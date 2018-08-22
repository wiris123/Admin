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

import dto.BoardDTO;

public class BbsDAO {
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역활
	ResultSet rs;
	
	public BbsDAO() 
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
	
	public int getTotalRecordCount(Map<String,Object> param) {
		int totalCount=-1;
		String query = "select count(*) from multiboard";
		try {
			psmt = con.prepareStatement(query);
			rs=psmt.executeQuery();
			if(rs.next()) {
				totalCount=rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(totalCount);
		return totalCount;
	}
	
	public List<BoardDTO> selectList(Map<String,Object> param){
		List<BoardDTO> list=new Vector<BoardDTO>();
		
		return list;
	}
	
}
