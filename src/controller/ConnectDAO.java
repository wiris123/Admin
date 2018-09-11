package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BoardDTO;
import dto.VisitorDTO;

public class ConnectDAO {
	Connection con; // 오라클 서버와 연결할때 사용
	PreparedStatement psmt;// 오라클 서버와 쿼리전송 역활
	ResultSet rs;

	public ConnectDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

			con = source.getConnection();
			System.out.println("DBCP연결성공");
		} catch (Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			System.out.println("자원반납시 예외발생");
			e.printStackTrace();
		}
	}
	
	//모든 날짜별 리스트를 가져오는 명령어
	public List<VisitorDTO> selectList(String start, String end){
		VisitorDTO dto;
		
		List<VisitorDTO> list = new Vector<VisitorDTO>();
		
		String query = "SELECT to_char(visit_date, 'YYYY-MM-DD') AS visit_date, count(to_char(visit_date, 'YYYY-MM-DD')) AS val FROM visitor GROUP BY to_char(visit_date, 'YYYY-MM-DD') HAVING to_char(visit_date, 'YYYY-MM-DD') BETWEEN ? AND ? ORDER BY visit_date asc";
		try {
			System.out.println("구하는중:"+start+end);
			psmt = con.prepareStatement(query);
			psmt.setString(1, start);
			psmt.setString(2, end);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new VisitorDTO();
				String comdate = rs.getString(1);
				comdate = comdate.replace("-", ","); //- 를 , 으로 바꾼다.
				System.out.println(comdate);
				dto.setVisit_date(comdate);
				dto.setVal(rs.getInt(2));
				
				list.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
