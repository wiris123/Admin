package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.org.apache.xerces.internal.parsers.DTDParser;

import dto.BoardDTO;
import dto.CommDTO;

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

	// 통합 관리에서 리스트를 가져오기
	public int getTotalCount(Map<String, Object> param) {
		int totalCount = -1;
		String query = "SELECT COUNT(*) FROM multiboard where 1=1 ";
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
			rs = psmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//통합 관리에서 코맨트 갯수 가져오기
	public int getTotalComm(Map<String, Object> param) {
		int totalCount = -1;
		String query = "SELECT COUNT(*) FROM BOARD_COMM where 1=1 ";
		/*if (param.get("Word") != null) {
			if (param.get("Column").equals("both")) {
				query += " and " + "title LIKE '%" + param.get("Word") + "%' " + " OR " + " contents LIKE '%"
						+ param.get("Word") + "%' ";
			} else {
				query += " and " + param.get("Column") + " " + " LIKE '%" + param.get("Word") + "%' ";
			}
		}*/
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	// 특정 페이지에서 리스트를 가져오기
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

	// 통합 관리 페이지용
	public List<BoardDTO> selectTotalList(Map<String, Object> param) {
		String b_id = null;
		BoardDTO dto;
		List<BoardDTO> list = new Vector<BoardDTO>();
		String query = "SELECT * FROM (SELECT e.*, rownum rnum FROM (SELECT * FROM multiboard WHERE 1=1";
		if (param.get("Word") != null) {
			if (param.get("Column").equals("both")) {
				query += " and " + "title LIKE '%" + param.get("Word") + "%' " + " OR " + " contents LIKE '%"
						+ param.get("Word") + "%' ";
			} else {
				query += " and " + param.get("Column") + " " + " LIKE '%" + param.get("Word") + "%' ";
			}
		}
		query += " ORDER BY num desc ) e) where rNum BETWEEN ? AND ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, param.get("start").toString());
			psmt.setString(2, param.get("end").toString());
			System.out.println("query" + query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				switch (rs.getString("b_id")) {
				case "free":
					b_id = "공지사항";
					break;
				case "photo":
					b_id = "이벤트";
					break;
				case "response":
					b_id = "질의응답";
					break;
				}
				dto = new BoardDTO();
				dto.setNum(rs.getString("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setRegidate(rs.getDate("REGIDATE"));
				dto.setViewcnt(rs.getInt("VIEWCNT"));
				dto.setAttfile(rs.getString("ATTFILE"));
				dto.setReply(rs.getInt("reply"));
				dto.setB_name(b_id);
				dto.setB_id(rs.getString("b_id"));

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 게시판리스트가져오기
	public List<BoardDTO> selectList(Map<String, Object> param) {
		BoardDTO dto;
		List<BoardDTO> list = new Vector<BoardDTO>();
		String query = "SELECT * FROM (SELECT e.*, rownum rnum FROM (SELECT * FROM multiboard WHERE 1=1 and b_id=?";
		if (param.get("Word") != null) {
			if (param.get("Column").equals("both")) {
				query += " and " + "title LIKE '%" + param.get("Word") + "%' " + " OR " + " contents LIKE '%"
						+ param.get("Word") + "%' ";
			} else {
				query += " and " + param.get("Column") + " " + " LIKE '%" + param.get("Word") + "%' ";
			}
		}
		query += " ORDER BY num desc ) e) where rNum BETWEEN ? AND ?";
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
				dto.setViewcnt(rs.getInt("VIEWCNT"));
				dto.setAttfile(rs.getString("ATTFILE"));
				dto.setReply(rs.getInt("reply"));

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
		String query = "insert into multiboard values(board_seq.nextval, '짐배', ?, ?, ?, sysdate, 0, ?, ?, null)";
		try {
			psmt = con.prepareStatement(query);
			System.out.println(dto.getName());
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContents());
			psmt.setString(4, dto.getAttfile());
			psmt.setString(5, dto.getB_id());
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
			String query = "select * from multiboard where num = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				incViewcnt(num);
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getDate("regidate"));
				dto.setContents(rs.getString("contents"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt")+1);
				dto.setAttfile(rs.getString("attfile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//조회수 1추가
	public void incViewcnt(String num) {
		String query = "Update multiboard set viewcnt = viewcnt +1 where num = ? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	// 내용 수정용 메소드
	public int modify(BoardDTO dto) {
		int affected = 0;
		String query = "update multiboard set name=?, title=?, contents=?";
		if (dto.getAttfile() != null) {
			query += ", attfile=?";
		}
		query += ", regidate=sysdate where num=?";

		try {
			System.out.println("업데이트를 위해 들어온 글의 번호" + dto.getNum());
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContents());
			// 파일이 새로 들어온 경우에는 수정을 해야하지만 그렇지 않은 경우에는 현재의 파일을 유지해야한다.
			if (dto.getAttfile() != null) {
				psmt.setString(4, dto.getAttfile());
				psmt.setString(6, dto.getNum());
			} else {
				psmt.setString(4, dto.getNum());
			}
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	// 모든 댓글을 가져오기 위한 비즈니스 로직
	public List<CommDTO> commentTotalList(Map<String, Object> param) {
		CommDTO dto;
		List<CommDTO> list = new Vector<CommDTO>();
		String query = "SELECT * FROM (SELECT e.*, rownum rnum FROM (SELECT * FROM board_comm WHERE 1=1";
		if (param.get("Word") != null) {
			if (param.get("Column").equals("both")) {
				query += " and " + "title LIKE '%" + param.get("Word") + "%' " + " OR " + " contents LIKE '%"
						+ param.get("Word") + "%' ";
			} else {
				query += " and " + param.get("Column") + " " + " LIKE '%" + param.get("Word") + "%' ";
			}
		}
		query += " ORDER BY com_idx desc ) e) where rNum BETWEEN ? AND ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, param.get("start").toString());
			psmt.setString(2, param.get("end").toString());
			System.out.println("query" + query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				dto = new CommDTO();
				dto.setCom_name(rs.getString("com_name"));
				dto.setCom_regidate(rs.getDate("com_regidate"));
				dto.setCom_content(rs.getString("com_content"));
				dto.setCom_idx(rs.getString("com_idx"));

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 댓글을 가져오기 위한 비즈니스 로직
	public List<CommDTO> commentList(String num) {
		CommDTO dto;
		List<CommDTO> list = new Vector<CommDTO>();
		String query = "SELECT * FROM board_comm where board_idx = ? order by com_idx desc";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			while (rs.next()) {
				dto = new CommDTO();
				dto.setCom_name(rs.getString("com_name"));
				dto.setCom_regidate(rs.getDate("com_regidate"));
				dto.setCom_content(rs.getString("com_content"));
				dto.setCom_idx(rs.getString("com_idx"));

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 댓글을 쓰는 비즈니스로직
	public int writeComment(CommDTO dto) {
		int affected = 0;
		String query = "INSERT INTO board_comm VALUES(comm_seq.nextval, ?, sysdate, ?, ?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getCom_name());
			psmt.setString(2, dto.getCom_content());
			psmt.setString(3, dto.getBoard_idx());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}

	// 댓글을 지우는 로직
	public int comdel(String com_idx) {
		int affected = 0;
		String query = "DELETE FROM board_comm where com_idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, com_idx);
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return affected;
	}

	// 처리 완료 여부를 전환하는 비즈니스 로직
	public int replyck(String num, int isChecked) {
		int affected = 0;
		String query = null;
		if (isChecked == 0) {
			query = "update multiboard set reply = 1 where num=?";
		} else if (isChecked == 1) {
			query = "update multiboard set reply = 0 where num=?";
		}
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return affected;
	}

	// 게시물 수 카운트
	public int[] listCount() {
		int[] b_id = new int[3];
		String query = "select count(b_id) from multiboard group by b_id order by b_id";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			int i = 0;
			while (rs.next()) {
				System.out.println(rs.getInt(1));
				b_id[i] = rs.getInt(1);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b_id;
	}

	//오늘 게시물수 카운트
	public int todayPost() {
		Date date = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("YY/MM/dd");
		String today = transFormat.format(date);
		
		int count=0;
		String query = "select count(*) from multiboard group by to_char(regidate, 'YY/MM/DD') having to_char(regidate, 'YY/MM/DD')=?";
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, today);
			rs = psmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
