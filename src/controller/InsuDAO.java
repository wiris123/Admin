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

import dto.TermDTO;

public class InsuDAO 
{
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역활
	ResultSet rs;
	
	public InsuDAO() 
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
	
	public int getTotalRecordCount(
			Map<String,Object> map) {		
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM insu_term ";
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
		else
		{
			query += "";
		}
		
		try 
		{
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();

			while(rs.next())
			{
				totalCount = rs.getInt(1);
			}			
		}
		catch(Exception e) {}	
		return totalCount;
		
	}
	
	
public List<TermDTO> selectList(Map<String,Object> map){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<TermDTO> bbs = new Vector<TermDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = "select * from term_insu";		
	
		try {
			//3.prepare객체생성 및 실행
			psmt = con.prepareStatement(query);
			
			//4.쿼리실행후 결과셋 돌려받음
			rs = psmt.executeQuery();
			
			//5.결과셋의 갯수만큼 반복
			while(rs.next()) {
				
				//6.결과셋을 하나씩 DTO객체에 저장
				TermDTO dto = new TermDTO();
				
				dto.setTerm_name(rs.getString(1));
				dto.setInstype(rs.getString(2));
				dto.setPaytime(rs.getString(3));
				dto.setInstime(rs.getString(4));
				dto.setRprem(rs.getString(5));
				dto.setDeathben(rs.getString(6));
				dto.setMonthpay(rs.getString(7));
				dto.setRegidate(rs.getDate(8));
				dto.setAttfile(rs.getString(9));
				
				
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
	
	
		
}
