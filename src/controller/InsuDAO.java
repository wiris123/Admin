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

import dto.AnnuDTO;
import dto.PropDTO;
import dto.TermDTO;

public class InsuDAO 
{
	Connection con; //�삤�씪�겢 �꽌踰꾩� �뿰寃고븷�븣 �궗�슜
	PreparedStatement psmt;//�삤�씪�겢 �꽌踰꾩� 荑쇰━�쟾�넚 �뿭�솢
	ResultSet rs;
	
	public InsuDAO() 
	{
		try {
			Context ctx = new InitialContext(); 
			DataSource source = 
			  (DataSource)
			  ctx.lookup("java:comp/env/jdbc/myoracle");
			
			con = source.getConnection();
			System.out.println("DBCP�뿰寃곗꽦怨�");
		}
		catch(Exception e) {
			System.out.println("DBCP�뿰寃곗떎�뙣");
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
	
	
<<<<<<< HEAD
public List<TermDTO> selectList(Map<String,Object> map){
		
		//1.寃곌낵 �젅肄붾뱶�뀑�쓣 �떞湲곗쐞�븳 由ъ뒪�듃怨꾩뿴 而щ젆�뀡�깮�꽦 
		List<TermDTO> bbs = new Vector<TermDTO>();
		
		//2.寃뚯떆臾� �쟾泥대�� 媛��졇�삤湲� �쐞�븳 荑쇰━�옉�꽦
		String query = "select * from term_insu";		
	
		try {
			//3.prepare媛앹껜�깮�꽦 諛� �떎�뻾
			psmt = con.prepareStatement(query);
=======
	public List<TermDTO> selectList(Map<String,Object> map){
>>>>>>> branch '222222222222222222' of https://github.com/wiris123/Admin
			
<<<<<<< HEAD
			//4.荑쇰━�떎�뻾�썑 寃곌낵�뀑 �룎�젮諛쏆쓬
			rs = psmt.executeQuery();
=======
			//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
			List<TermDTO> bbs = new Vector<TermDTO>();
>>>>>>> branch '222222222222222222' of https://github.com/wiris123/Admin
			
<<<<<<< HEAD
			//5.寃곌낵�뀑�쓽 媛��닔留뚰겮 諛섎났
			while(rs.next()) {
=======
			//2.게시물 전체를 가져오기 위한 쿼리작성
			String query = "select * from term_insu";		
		
			try {
				//3.prepare객체생성 및 실행
				psmt = con.prepareStatement(query);
>>>>>>> branch '222222222222222222' of https://github.com/wiris123/Admin
				
<<<<<<< HEAD
				//6.寃곌낵�뀑�쓣 �븯�굹�뵫 DTO媛앹껜�뿉 ���옣
				TermDTO dto = new TermDTO();

				//4.쿼리실행후 결과셋 돌려받음
				rs = psmt.executeQuery();

				dto.setTerm_name(rs.getString(1));
				dto.setInstype(rs.getString(2));
				dto.setPaytime(rs.getString(3));
				dto.setInstime(rs.getString(4));
				dto.setRprem(rs.getString(5));
				dto.setDeathben(rs.getString(6));
				dto.setMonthpay(rs.getString(7));
				dto.setRegidate(rs.getDate(8));
				dto.setAttfile(rs.getString(9));
				
				
				//7.DTO媛앹껜瑜� 而щ젆�뀡�뿉 異붽�
				bbs.add(dto);
=======
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
>>>>>>> branch '222222222222222222' of https://github.com/wiris123/Admin
			}
			catch(Exception e) {
				System.out.println("Select시 예외발생");
				e.printStackTrace();
			}
			
			return bbs;
		}
	
	public int insertWrite(TermDTO dto) {
		//적용된 행의 갯수확인을 위한 변수
		int affected = 0;
		try {
			String query = "INSERT INTO term_insu "
				+ " (term_name,instype,paytime,instime,rprem,deathben,monthpay,regidate,attfile) "
				+ " VALUES"
				+ " (?,?,?,?,?,?,?,sysdate,?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTerm_name());
			psmt.setString(2, dto.getInstype());
			psmt.setString(3, dto.getPaytime());
			psmt.setString(4, dto.getInstime());
			psmt.setString(5, dto.getRprem());
			psmt.setString(6, dto.getDeathben());
			psmt.setString(7, dto.getMonthpay());
			psmt.setString(8, dto.getAttfile());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
<<<<<<< HEAD
			System.out.println("Select�떆 �삁�쇅諛쒖깮");
=======
			System.out.println("term_insert중 예외발생");
>>>>>>> branch '222222222222222222' of https://github.com/wiris123/Admin
			e.printStackTrace();
		}
		
		return affected;
	}
<<<<<<< HEAD

public List<AnnuDTO> selectList1(Map<String,Object> map){
	
	//1.寃곌낵 �젅肄붾뱶�뀑�쓣 �떞湲곗쐞�븳 由ъ뒪�듃怨꾩뿴 而щ젆�뀡�깮�꽦 
	List<AnnuDTO> bbs = new Vector<AnnuDTO>();
	
	//2.寃뚯떆臾� �쟾泥대�� 媛��졇�삤湲� �쐞�븳 荑쇰━�옉�꽦
	String query = "select * from annu_insu";		

	try {
		//3.prepare媛앹껜�깮�꽦 諛� �떎�뻾
		psmt = con.prepareStatement(query);
		
		//4.荑쇰━�떎�뻾�썑 寃곌낵�뀑 �룎�젮諛쏆쓬
		rs = psmt.executeQuery();
		
		//5.寃곌낵�뀑�쓽 媛��닔留뚰겮 諛섎났
		while(rs.next()) {
			
			//6.寃곌낵�뀑�쓣 �븯�굹�뵫 DTO媛앹껜�뿉 ���옣
			AnnuDTO dto = new AnnuDTO();
			
			dto.setAnn_name(rs.getString(1));
			dto.setInstart(rs.getString(2));
			dto.setPaytime(rs.getString(3));
			dto.setPayment(rs.getString(4));
			dto.setRprem(rs.getString(5));
			dto.setInterest(rs.getString(6));
			dto.setMonthann(rs.getString(7));
			
			
			
			//7.DTO媛앹껜瑜� 而щ젆�뀡�뿉 異붽�
			bbs.add(dto);
		}
	}
	catch(Exception e) {
		System.out.println("Select�떆 �삁�쇅諛쒖깮");
		e.printStackTrace();
	}
	
	return bbs;
}
	
public List<PropDTO> selectList2(Map<String,Object> map){
	
	//1.寃곌낵 �젅肄붾뱶�뀑�쓣 �떞湲곗쐞�븳 由ъ뒪�듃怨꾩뿴 而щ젆�뀡�깮�꽦 
	List<PropDTO> bbs = new Vector<PropDTO>();
	
	//2.寃뚯떆臾� �쟾泥대�� 媛��졇�삤湲� �쐞�븳 荑쇰━�옉�꽦
	String query = "select * from prop_insu";		

	try {
		//3.prepare媛앹껜�깮�꽦 諛� �떎�뻾
		psmt = con.prepareStatement(query);
		
		//4.荑쇰━�떎�뻾�썑 寃곌낵�뀑 �룎�젮諛쏆쓬
		rs = psmt.executeQuery();
		
		//5.寃곌낵�뀑�쓽 媛��닔留뚰겮 諛섎났
		while(rs.next()) {
			
			//6.寃곌낵�뀑�쓣 �븯�굹�뵫 DTO媛앹껜�뿉 ���옣
			PropDTO dto = new PropDTO();
			
			dto.setProp_name(rs.getString(1));
			dto.setInstime(rs.getString(2));
			dto.setMonthpay(rs.getString(3));
			dto.setHosp(rs.getString(4));
			dto.setGohosp(rs.getString(5));
			dto.setSanghosp(rs.getString(6));
			dto.setSgohosp(rs.getString(7));
			dto.setChbedosu(rs.getString(8));
			dto.setChbeinje(rs.getString(9));
			dto.setChbemri(rs.getString(10));
			
			
			//7.DTO媛앹껜瑜� 而щ젆�뀡�뿉 異붽�
			bbs.add(dto);
		}
	}
	catch(Exception e) {
		System.out.println("Select�떆 �삁�쇅諛쒖깮");
		e.printStackTrace();
	}
	
	return bbs;
}
	
=======
>>>>>>> branch '222222222222222222' of https://github.com/wiris123/Admin
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {
			System.out.println("�옄�썝諛섎궔�떆 �삁�쇅諛쒖깮");
			e.printStackTrace();
		}
	}
	
	
		
}
