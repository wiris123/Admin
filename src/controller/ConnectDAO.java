package controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BoardDTO;
import dto.VisitorDTO;
import dto.VisitorValDTO;

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
		//db에서는 날짜를 아무 식으로나 입력해도 상관없지만 jdbc를 통한 연결을 할떄는 date 타입으로 맞춰줘야한다
		SimpleDateFormat parse = new SimpleDateFormat("YYYY-MM-dd");
		Date date1 = Date.valueOf(start);
		Date date2 = Date.valueOf(end);
		
		String query = "SELECT * FROM"
	    +" (SELECT TO_CHAR(TO_DATE(?, 'YY-MM-dd') + LEVEL - 1, 'YY-MM-dd') as dates FROM DUAL CONNECT BY TO_DATE(?, 'YY-MM-dd') + LEVEL - 1 < TO_DATE(?, 'YY-MM-dd')+1) d"
	    +" left outer join"
	    +" (select TO_CHAR(visit_date, 'YY-MM-DD') as Vd, count(TO_CHAR(visit_date, 'YY-MM-DD'))as val from visitor group by TO_CHAR(visit_date, 'YY-MM-DD') ) v on"
	    +" d.DATES = v.vD order by d.dates";
			
		try {
			//System.out.println("구하는중:"+query);
			psmt = con.prepareStatement(query);
			psmt.setDate(1, date1);
			psmt.setDate(2, date1);
			psmt.setDate(3, date2);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new VisitorDTO();
				//date 타입을 가져올떄는 4자리로 가져오지 않고 2자리만 보내준다는것 발견 to_char 를 통해 4자리 문자열로 변경하거나
				//아니면 앞에20을 미리 붙여준다
				String comdate = "20";
				comdate += rs.getString("dates");
				//System.out.println(comdate);
				comdate = comdate.replace("-", ","); //- 를 , 으로 바꾼다.
				dto.setVisit_date(comdate);
				dto.setVal(rs.getInt(3));
				
				list.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//모든 날짜별 
	public VisitorValDTO getTotVisitor() {
		VisitorValDTO dto = new VisitorValDTO();
		String query = "select sum(val), ROUND(AVG(val), 2) from (select count(TO_CHAR(visit_date, 'YYYY-MM-DD'))as val from visitor group by TO_CHAR(visit_date, 'YYYY-MM-DD'))";
		try {
		psmt = con.prepareStatement(query);
		rs = psmt.executeQuery();
		if(rs.next()) {
			dto.setTot(rs.getInt(1));
			dto.setAvg(rs.getDouble(2)); 
		}
		rs.close();
		psmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
