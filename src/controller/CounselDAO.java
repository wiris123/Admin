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
	
	
	public List<CounselDTO> selectList(Map<String,Object> map){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<CounselDTO> bbs = new Vector<CounselDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = "select * from booking where flag=?";		

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
				dto.setIdx(rs.getString(1));
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
	
	public int deleteTerm(String term_name) {
		int affected = 0;
		try {
			String query = "delete from booking where term_name=?";
			
			psmt = con.prepareStatement(query);			
			psmt.setString(1, term_name);
			 
			affected = psmt.executeUpdate();
		}
		
		catch(Exception e) {
			System.out.println("delete_board중 예외발생");
			e.printStackTrace();
		}
		System.out.println("term_name"+term_name);
		return affected;	
	}

}
