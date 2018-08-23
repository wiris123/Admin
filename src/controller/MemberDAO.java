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

import dto.MemberDTO;
import dto.OutMemDTO;






public class MemberDAO {

	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역활
	ResultSet rs;//쿼리의 결과를 받을때 사용
	
	public MemberDAO() {		
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
	
	public void close() {
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
	
	public int memberRegist(MemberDTO dto) {
		//적용된 행의 갯수확인을 위한 변수
		int affected = 0;
		try {
			String query = "INSERT INTO member ( id,pass,name,mobile,email,birth,regidate) VALUES ( ?, ?, ?, ?, ?, ? ,sysdate)";

			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());			
			psmt.setString(4, dto.getMobile());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getBirth());
				
			System.out.println(dto.getBirth());
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}	
	
	public List<MemberDTO> selectList(Map<String,Object> map){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<MemberDTO> bbs = new Vector<MemberDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = "SELECT member.*,rownum FROM member where ";
				
		if(map.get("Word")!=null) 
		{
			if(map.get("Column").equals("both")) 
			{
				query +=""
				  + "title LIKE '%"+ map.get("Word") +"%' "
				  +" OR "
				  +" content LIKE '%"+ map.get("Word") +"%' "
			  		+ "and ";
			}
			else {
				query +=""+ map.get("Column") +" "
				  +" LIKE '%"+ map.get("Word") +"%' "
			  		+ " and ";
				
			}			
		}
		query +="rownum BETWEEN ? AND ?"
			    +" ORDER BY rownum desc ";
		System.out.println("쿼리문:"+ query);			
			
		try {
			//3.prepare객체생성 및 실행
			psmt = con.prepareStatement(query);

			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			//4.쿼리실행후 결과셋 돌려받음
			rs = psmt.executeQuery();
			
			//5.결과셋의 갯수만큼 반복
			while(rs.next()) {
				
				//6.결과셋을 하나씩 DTO객체에 저장
				MemberDTO dto = new MemberDTO();
				dto.setName(rs.getString(3));
				dto.setId(rs.getString(1));;
				dto.setMobile(rs.getString(5));	
				dto.setEmail(rs.getString(4));
				dto.setBirth(rs.getString(6));
				dto.setRegidate(rs.getDate(7));
				dto.setPass(rs.getString(2));
				
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	public int getTotalRecordCount(
			Map<String,Object> map) {		
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM member ";
		if(map.get("Word")!=null) 
		{
			if(map.get("Column").equals("both")) 
			{
				query +=" WHERE "
				  +" title LIKE '%"+ map.get("Word") +"%' "
				  +" OR "
				  +" content LIKE '%"+ map.get("Word") +"%' ";
			}
			else {
				query +=" WHERE "+ map.get("Column") +" "
				  +" LIKE '%"+ map.get("Word") +"%' ";
			}			
		}
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {}
				
		return totalCount;
	}
	
	public int delete(String id) {
		int affected = 0;
		try {
			String query = "DELETE FROM member WHERE id=?";
			
			psmt = con.prepareStatement(query);			
			psmt.setString(1, id);;
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("delete중 예외발생" );
			
			e.printStackTrace();
		}
		
		return affected;	
	}
	
	public MemberDTO selectView(String id) {
		
		MemberDTO dto = new MemberDTO();
		
		String query = "SELECT * FROM member WHERE id=?";		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setMobile(rs.getString("mobile"));
				dto.setBirth(rs.getString("birth"));
				dto.setRegidate(rs.getDate("regidate"));
			}
			System.out.println("상세보기");
			
		}
		catch(Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}				
				
		return dto;
	}
	
	public int getTotalRecordCount2(
			Map<String,Object> map) {		
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM with_member ";
		if(map.get("Word")!=null) 
		{
			if(map.get("Column").equals("both")) 
			{
				query +=" WHERE "
				  +" title LIKE '%"+ map.get("Word") +"%' "
				  +" OR "
				  +" content LIKE '%"+ map.get("Word") +"%' ";
			}
			else {
				query +=" WHERE "+ map.get("Column") +" "
				  +" LIKE '%"+ map.get("Word") +"%' ";
			}			
		}
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {}
				
		return totalCount;
	}
	
public List<OutMemDTO> selectList2(Map<String,Object> map){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<OutMemDTO> bbs = new Vector<OutMemDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = "SELECT * FROM with_member "
				+ " WHERE 1=1 "
				+ " ORDER BY id DESC";
				
		
		System.out.println("쿼리문:"+ query);			
			
		try {
			//3.prepare객체생성 및 실행
			psmt = con.prepareStatement(query);
						
			
			//4.쿼리실행후 결과셋 돌려받음
			rs = psmt.executeQuery();
			
			//5.결과셋의 갯수만큼 반복
			while(rs.next()) {
				
				//6.결과셋을 하나씩 DTO객체에 저장
				OutMemDTO dto = new OutMemDTO();
				
				dto.setId(rs.getString(1));
				dto.setReason(rs.getString(2));
				dto.setRegidate(rs.getDate(3));
				
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}

	public OutMemDTO selectView2(String id) {
	
		OutMemDTO dto = new OutMemDTO();
		
		String query = "SELECT * FROM with_member WHERE id=?";		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				
				dto.setId(rs.getString(1));
				dto.setReason(rs.getString("reason"));
				dto.setRegidate(rs.getDate("regidate"));
			}
			System.out.println("상세보기");
			
		}
		catch(Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}				
				
		return dto ;
	}
	
	public int memberRegist2(OutMemDTO dto) {
		//적용된 행의 갯수확인을 위한 변수
		int affected = 0;
		try {
			String query = "INSERT INTO with_member ( id,reason) VALUES ( ?, ? )";

			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, "삭제");
			
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}	
}
