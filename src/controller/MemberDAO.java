package controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import dto.CounselMemDTO;
import dto.MemberDTO;
import dto.OutMemDTO;

public class MemberDAO {

	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt;//오라클 서버와 쿼리전송 역활
	ResultSet rs;//쿼리의 결과를 받을때 사용
	
	public MemberDAO() {		
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
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
			String query = "INSERT INTO member ( id,pass,name,mobile,email,birth,regidate) VALUES ( ?, ?, ?, ?, ?, to_date(?,'yyyy-MM-dd') ,sysdate)";

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
	//회원목록에 데이터를 리스트 출력하는 함수
	public List<MemberDTO> selectList(Map<String,Object> map){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<MemberDTO> bbs = new Vector<MemberDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = "SELECT * FROM (SELECT e.*, rownum rnum FROM (SELECT * FROM member WHERE 1=1 ";
		if (map.get("Word") != null) {
			if (map.get("Column").equals("both")) {
				query += " and " + "title LIKE '%" + map.get("Word") + "%' " + " OR " + " contents LIKE '%"
						+ map.get("Word") + "%' ";
			} else {
				query += " and " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
			}
		}
		query += " ORDER BY regidate desc ) e) where rNum BETWEEN ? AND ?";
		System.out.println("쿼리문:"+ query);			
			
		try {
			//3.prepare객체생성 및 실행
			psmt = con.prepareStatement(query);
			System.out.println("들오온 숫짜는"+map.get("start").toString());
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
	
	//현제 회원수
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
	
	
	
	//회원목록 삭제
	public int delete(String id) {
		int affected = 0;
		try {
			String query = "DELETE FROM member WHERE id=?";
			
			psmt = con.prepareStatement(query);			
			psmt.setString(1, id);
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("delete중 예외발생" );
			
			e.printStackTrace();
		}
		
		return affected;	
	}
	
	//회원목록테이블에서 상세보기 함수
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
	
	//탈퇴회원 데이터를 리스트 출력하는 함수 
	public List<OutMemDTO> selectList2(Map<String,Object> map){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<OutMemDTO> bbs = new Vector<OutMemDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = "SELECT * FROM (SELECT e.*, rownum rnum FROM (SELECT * FROM with_member WHERE 1=1 ";
		if (map.get("Word") != null) {
			if (map.get("Column").equals("both")) {
				query += " and " + "title LIKE '%" + map.get("Word") + "%' " + " OR " + " contents LIKE '%"
						+ map.get("Word") + "%' ";
			} else {
				query += " and " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
			}
		}
		query += " ORDER BY regidate desc ) e) where rNum BETWEEN ? AND ?";
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

	//상담회원목록에 데이터를 리스트 출력하는 함수
	public List<CounselMemDTO> selectListQ(Map<String,Object> map){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<CounselMemDTO> bbs = new Vector<CounselMemDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		String query = "SELECT member_q.*,rownum FROM member_q where ";
		
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
				CounselMemDTO dto = new CounselMemDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setMobile(rs.getString(4));
				dto.setRegidate(rs.getDate(5));
				dto.setContents(rs.getString(6));
				
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
	//상담회원데이터 상세보기 함수
	public CounselMemDTO selectViewQ(String id) {
		
		CounselMemDTO dto = new CounselMemDTO();
		
		String query = "SELECT * FROM member_q WHERE id=?";		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setMobile(rs.getString(4));
				dto.setRegidate(rs.getDate(5));
				dto.setContents(rs.getString(6));
				
				
			}
			System.out.println("상세보기");
			
		}
		catch(Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}				
				
		return dto;
	}
	
	//상담회원데이터 추가 함수
	public int memberQRegist(CounselMemDTO dto) {
		//적용된 행의 갯수확인을 위한 변수
		int affected = 0;
		try {
			String query = "INSERT INTO member_q ( idx,name,id,mobile,regidate,contents) VALUES ( ?, ?, ?, ? ,sysdate, ? )";

			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getIdx());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getMobile());
			psmt.setString(5, dto.getContents());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}	
	
	//상담회원 삭제 함수
	public int deleteQ(String id) {
		int affected = 0;
		try {
			String query = "DELETE FROM member_q WHERE id=?";
			
			psmt = con.prepareStatement(query);			
			psmt.setString(1, id);
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("delete중 예외발생" );
			
			e.printStackTrace();
		}
		
		return affected;	
	}
	
	public int memberRegist2(String id, String reason) {
		//적용된 행의 갯수확인을 위한 변수
		int affected = 0;
		try {
			String query = "INSERT INTO with_member ( id,reason, regidate) VALUES ( ?, ?, sysdate )";

			psmt = con.prepareStatement(query);
			
			psmt.setString(1, id);
			psmt.setString(2, "삭제"); //reason
			
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}	
	//오늘 가입자수
	public int regiToday() {
		int today=0;
		try {
			String query = "select count(to_char(regidate, 'YY-MM-dd')) from member where to_char(regidate, 'YY-MM-dd') = (select to_char(sysdate, 'YY-MM-dd') from dual) ";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			if(rs.next()) {
				today = rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return today;
	}
	//전체가입자수
	public int regiTotal() {
		int total=0;
		try {
			String query ="select count(*) from member";
			psmt  = con.prepareStatement(query);
			rs = psmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	//오늘 탈퇴자수
	public int outToday() {
		int today=0;
		try {
			String query = "select count(to_char(regidate, 'YY-MM-dd')) from WITH_MEMBER where to_char(regidate, 'YY-MM-dd') = (select to_char(sysdate, 'YY-MM-dd') from dual) ";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			if(rs.next()) {
				today = rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return today;
	}
	//전체 탈퇴자수
	public int outTotal() {
		int total = 0 ;
		try {
			String query = "select count(*) from WITH_MEMBER";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
}
