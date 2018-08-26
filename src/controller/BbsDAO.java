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

import dto.BoardDTO;

public class BbsDAO {
	Connection con; // 오라클 서버와 연결할때 사용
	PreparedStatement psmt;// 오라클 서버와 쿼리전송 역활
	ResultSet rs;

	public BbsDAO() {
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

	public int getTotalRecordCount(Map<String, Object> param) {

		int totalCount = -1;
		String query = "select count(*) from multiboard where 1=1 and b_id=? ";
		if (param.get("Word") != null) {
			if (param.get("Column").equals("both")) {
				query += " and " + "title LIKE '%" + param.get("Word") + "%' " + " OR " + " contents LIKE '%"
						+ param.get("Word") + "%' ";
			} else {
				query += " and " + param.get("Column") + " " + " LIKE '%" + param.get("Word") + "%' ";
			}
		}

			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, param.get("b_id").toString());
				rs = psmt.executeQuery();
				if (rs.next()) {
					totalCount = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return totalCount;
		}

	// 게시판리스트가져오기
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
	}

	// 게시판글쓰기
	public int write(BoardDTO dto) {
		System.out.println("게시판글쓰기중");
		int affected = -1;
		String query = "insert into multiboard values(board_seq.nextval, '짐배', ?, ?, ?, sysdate, 0, null, ?, null)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContents());
			psmt.setString(4, dto.getB_id());
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return affected;
	}

	// 게시판글지우기
	public int delete2(String[] num) {
		System.out.println("게시판글지우기중");
		int affected = 0;
		System.out.println(num.length);
		try {
			String query = "delete from multiboard where num in (?";
			for (int i = 1; i < num.length; i++) {
				query += ",?";
			}
			query += ")";
			psmt = con.prepareStatement(query);
			for (int i = 0; i < num.length; i++) {
				psmt.setString(i + 1, num[i]);
			}

			System.out.println(query);
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delete_board중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}

	// 삭제용 메소드
	public int delete(String num) {
		int affected = 0;
		try {
			String query = "delete from multiboard where num=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, num);

			affected = psmt.executeUpdate();
		}

		catch (Exception e) {
			System.out.println("delete_board중 예외발생");
			e.printStackTrace();
		}
		System.out.println("term_name" + num);
		return affected;
	}

	// 내용을 가져올 메소드
	public BoardDTO contents(String num) {
		System.out.println("내용가져오는중");
		BoardDTO dto = new BoardDTO();
		try {
			String querty = "select * from multiboard where num = ?";
			psmt = con.prepareStatement(querty);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getDate("regidate"));
				dto.setContents(rs.getString("contents"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getString("viewcnt"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
