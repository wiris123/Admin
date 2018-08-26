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
	
	
/*	// 게시판리스트가져오기
	   public List<BoardDTO> selectList(Map<String, Object> param) {
	      System.out.println("게시판리스트가져오기중");
	      BoardDTO dto;
	      List<BoardDTO> list = new Vector<BoardDTO>();
	      String query = "SELECT * FROM (SELECT e.*, rownum rnum FROM (SELECT * FROM multiboard WHERE 1=1 and b_id=?";
	      System.out.println(param.get("Word"));
	      System.out.println("컬럼은:" + param.get("Column"));
	      if (param.get("Word") != null) {
	         if (param.get("Column").equals("both")) {
	            query += " and " + "title LIKE '%" + param.get("Word") + "%' " + " OR " + " contents LIKE '%"
	                  + param.get("Word") + "%' ";
	         } else {
	            query += " and " + param.get("Column") + " " + " LIKE '%" + param.get("Word") + "%' ";
	         }
	      }
	      query += ") e) where rNum BETWEEN ? AND ?";
	      try {
	         String b_id = (String) param.get("b_id");
	         psmt = con.prepareStatement(query);
	         psmt.setString(1, param.get("b_id").toString());
	         psmt.setString(2, param.get("start").toString());
	         psmt.setString(3, param.get("end").toString());
	         System.out.println(query + b_id);
	         rs = psmt.executeQuery();
	         while (rs.next()) {
	            System.out.println("드러왔다" + rs.getString("num"));
	            dto = new BoardDTO();
	            dto.setNum(rs.getString("NUM"));
	            dto.setName(rs.getString("NAME"));
	            dto.setTitle(rs.getString("TITLE"));
	            dto.setRegidate(rs.getDate("REGIDATE"));
	            dto.setViewcnt(rs.getString("VIEWCNT"));

	            list.add(dto);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }*/
	
	
	
	
	public List<CounselDTO> selectList(Map<String,Object> map){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<CounselDTO> bbs = new Vector<CounselDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = "SELECT * FROM (SELECT e.*, rownum rnum FROM (SELECT * FROM booking WHERE 1=1 and flag=? order by idx asc) e ) order by idx desc";		
		
		
		try {
			//3.prepare객체생성 및 실행
			psmt = con.prepareStatement(query);	
			psmt.setString(1, map.get("flag").toString());

			//4.쿼리실행후 결과셋 돌려받음
			rs = psmt.executeQuery();

			//5.결과셋의 갯수만큼 반복
			while(rs.next()) 
			{		
				//6.결과셋을 하나씩 DTO객체에 저장
				CounselDTO dto = new CounselDTO();
				dto.setIdx(rs.getString(8));
				dto.setName(rs.getString(2));
				dto.setMobile(rs.getString(3));
				dto.setRegidate(rs.getDate(4));
				dto.setEmail(rs.getString(5));
				dto.setContents(rs.getString(6));
				dto.setFlag(rs.getString(7));
				
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
