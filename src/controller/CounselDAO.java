package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CounselDTO;

public class CounselDAO 
{	
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역활
	ResultSet rs;
	
	public CounselDAO() 
	{
		try {
			Context ctx = new InitialContext(); 
			DataSource source = 
			  (DataSource)
			  ctx.lookup("java:comp/env/jdbc/myoracle");
			
			con = source.getConnection();
			System.out.println("DBCP연결성공");
		}
		catch(Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
		}	
	}
	
	//게시물 개수를 카운트하기 위한 메소드
	public int getTotalRecordCount(Map<String,Object> map) {		
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM booking WHERE 1=1";
		if(map.get("Word")!=null) 
		{
			if(map.get("Column").equals("both")) 
			{
				query +=" AND "
				  +" idx LIKE '%"+ map.get("Word") +"%' "
				  +" OR "
				  +" contents LIKE '%"+ map.get("Word") +"%' ";
			}
			else {
				query +=" AND "+ map.get("Column") +" "
				  +" LIKE '%"+ map.get("Word") +"%' ";
			}
		}
		query += " AND flag=? ";
		
		try {
			psmt = con.prepareStatement(query);
			
			//멀티게시판 추가
			psmt.setString(1, map.get("flag").toString());
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {}
				
		return totalCount;
	}
	
	public List<CounselDTO> selectList(Map<String,Object> map){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<CounselDTO> bbs = new Vector<CounselDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = "SELECT * FROM (SELECT e.*, rownum rnum FROM (SELECT * FROM booking WHERE 1=1 and flag=?";		
		
		if (map.get("Word") != null) {
	         if (map.get("Column").equals("contents")) {
	            query += " and " + "contents LIKE '%" + map.get("Word") + "%' ";
	         } else {
	            query += " and " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
	         }
	      }
		query += " order by idx desc ) e) WHERE rNum BETWEEN ? AND ? ";
		
		
		System.out.println(query);
		try {
			//3.prepare객체생성 및 실행
			psmt = con.prepareStatement(query);	
			psmt.setString(1, map.get("flag").toString());
			psmt.setString(2, map.get("start").toString());
			psmt.setString(3, map.get("end").toString());	
			
			//4.쿼리실행후 결과셋 돌려받음
			rs = psmt.executeQuery();

			//5.결과셋의 갯수만큼 반복
			while(rs.next()) 
			{		
				//6.결과셋을 하나씩 DTO객체에 저장
				CounselDTO dto = new CounselDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setMobile(rs.getString("mobile"));
				dto.setRegidate(rs.getDate("regidate"));
				dto.setEmail(rs.getString("email"));
				dto.setContents(rs.getString("contents"));
				dto.setFlag(rs.getString("flag"));
				
				//7.DTO객체를 컬렉션에 추가
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	public void close() 
	{
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {
			System.out.println("자원반납시 예외발생");
			e.printStackTrace();
		}
	}
	
	public int deleteTerm(String idx) {
		int affected = 0;
		try {
			String query = "delete from booking where idx=?";
			
			psmt = con.prepareStatement(query);			
			psmt.setString(1, idx);
			 
			affected = psmt.executeUpdate();
		}
		
		catch(Exception e) {
			System.out.println("delete_board중 예외발생");
			e.printStackTrace();
		}
		System.out.println("idx"+idx);
		return affected;	
	}
	
	//게시판 글쓰기 처리
	public int formWrite(CounselDTO dto) {
		//적용된 행의 개수 확인을 위한 변수
		int affected = 0;
		try {
			String query = "INSERT INTO booking ( "
				+ " idx,name,mobile,regidate,email,contents,flag) "
				+ " VALUES ( "
				+ " book_seq.NEXTVAL, ?, ?, sysdate, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			System.out.println(dto.getName()+dto.getMobile()+dto.getEmail()+dto.getContents()+dto.getFlag());
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getMobile());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getContents());
			psmt.setString(5, dto.getFlag());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}
	
	//게시판 상세보기
	public CounselDTO selectView(String idx) {

		CounselDTO dto = new CounselDTO();
		
		String query = "SELECT * FROM booking WHERE idx=?";		
		System.out.println(query);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setMobile(rs.getString(3));
				dto.setRegidate(rs.getDate(4));
				dto.setEmail(rs.getString(5));
				dto.setContents(rs.getString(6));
				dto.setFlag(rs.getString(7));
			}
		}
		catch(Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}				
				
		return dto;
	}

}
