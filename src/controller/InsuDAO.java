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
import dto.MyStatusDTO;
import dto.PropDTO;
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
	
	public int deleteTerm(String term_name) {
		int affected = 0;
		try {
			String query = "delete from term_insu where term_name=?";
			
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
	
	public int deleteAnnu(String ann_name) {
		int affected = 0;
		try {
			String query = "delete from annu_insu where ann_name=?";
			
			psmt = con.prepareStatement(query);			
			psmt.setString(1, ann_name);
			 
			affected = psmt.executeUpdate();
		}
		
		catch(Exception e) {
			System.out.println("delete_board_ann중 예외발생");
			e.printStackTrace();
		}
		System.out.println("ann_name"+ann_name);
		return affected;	
	}
	
	public int deleteProp(String prop_name) {
		int affected = 0;
		try {
			String query = "delete from prop_insu where prop_name=?";
			
			psmt = con.prepareStatement(query);			
			psmt.setString(1, prop_name);
			 
			affected = psmt.executeUpdate();
		}
		
		catch(Exception e) {
			System.out.println("delete_board_prop중 예외발생");
			e.printStackTrace();
		}
		System.out.println("prop_name"+prop_name);
		return affected;	
	}
	public List<TermDTO> selectList(Map<String,Object> map){
			
			//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
			List<TermDTO> bbs = new Vector<TermDTO>();
			
			//2.게시물 전체를 가져오기 위한 쿼리작성
			String query = "select term_insu.*,rownum from term_insu where ";
			if(map.get("Word")!=null) {
		    	  if(map.get("Column").equals("both")) {
		    		  query +=""
	    				  + ""+map.get("Column")+" LIKE '%" + map.get("Word") + "%' "
	    				  + " OR "
	    				  + " content LIKE '%"+map.get("Word") + "%' "
	    				  + "and ";
		    	  }
		    	  else {
		    		  query +=""+ map.get("Column") +" "
	    				  + " LIKE '%"+map.get("Word") +"%' "
	    				  + " and ";
		    	  }
		      }
		      query +="rownum BETWEEN ? AND ? "
		    		  + " ORDER BY rownum DESC ";
		      System.out.println("쿼리문 : " + query);
		
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
	
	public int insertWrite(TermDTO dto) {
		//적용된 행의 갯수확인을 위한 변수
		int affected = 0;
		try {
			String query = "INSERT INTO term_insu "
				+ " (term_name,instype,instime,paytime,rprem,deathben,monthpay,regidate,attfile) "
				+ " VALUES"
				+ " (?,?,?,?,?,?,?,sysdate,?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTerm_name());
			psmt.setString(2, dto.getInstype());
			psmt.setString(3, dto.getInstime());
			psmt.setString(4, dto.getPaytime());
			psmt.setString(5, dto.getRprem());
			psmt.setString(6, dto.getDeathben());
			psmt.setString(7, dto.getMonthpay());
			psmt.setString(8, dto.getAttfile());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("term_insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}
	
	public int annu_insertWrite(AnnuDTO dto) {

		//적용된 행의 갯수확인을 위한 변수

		int affected = 0;

		try {

			String query = "INSERT INTO annu_insu "

				+ " (ann_name,instype,instart,paytime,payment,rprem,interest,monthann,regidate,submit, attfile) "

				+ " VALUES"

				+ " (?,?,?,?,?,?,?,?,sysdate,?,?)";

			psmt = con.prepareStatement(query);

			psmt.setString(1, dto.getAnn_name());

			psmt.setString(2, dto.getInstype());

			psmt.setString(3, dto.getInstart());
			System.out.println(dto.getInstart().toString());
		
			psmt.setString(4, dto.getPaytime());

			psmt.setString(5, dto.getPayment());

			psmt.setString(6, dto.getRprem());

			psmt.setString(7, dto.getInterest());

			psmt.setString(8, dto.getMonthann());

			psmt.setString(9, dto.getSubmit());

			psmt.setString(10, dto.getAttfile());

			

			affected = psmt.executeUpdate();

		}

		catch(Exception e) {

			System.out.println("annu_insert중 예외발생");

			e.printStackTrace();

		}

		

		return affected;

	}

	

	public int prop_insertWrite(PropDTO dto) {

		//적용된 행의 갯수확인을 위한 변수

		int affected = 0;

		try {

			String query = "INSERT INTO prop_insu "

				+ " (prop_name, instype, monthpay, regidate, hosp, gohosp, sanghosp, sgohosp, chbedosu, chbeinje, chbemri, attfile) "

				+ " VALUES"

				+ " (?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query);

			psmt.setString(1, dto.getProp_name());

			psmt.setString(2, dto.getInstype());

			psmt.setString(3, dto.getMonthpay());

			psmt.setString(4, dto.getHosp());

			psmt.setString(5, dto.getGohosp());

			psmt.setString(6, dto.getSanghosp());

			psmt.setString(7, dto.getSgohosp());

			psmt.setString(8, dto.getChbedosu());

			psmt.setString(9, dto.getChbeinje());

			psmt.setString(10, dto.getChbemri());

			psmt.setString(11, dto.getAttfile());

			affected = psmt.executeUpdate();

		}

		catch(Exception e) {

			System.out.println("prop_insert중 예외발생");

			e.printStackTrace();

		}

		

		return affected;

		}
	
	public int insertStatusWrite(MyStatusDTO dto, String mode) {
		//적용된 행의 갯수확인을 위한 변수
		int affected = 0;
		try { 
			String query = "INSERT INTO member_"+mode+"_my "
				+ " (num,id,insname,insnum,remainpay,paidprem,prem,contstat) "
				+ " VALUES "
				+ " ("+mode+"_my_seq.NEXTVAL,?,?,?,?,?,?,?)";
			
			psmt = con.prepareStatement(query);
			System.out.println(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getInsname());
			psmt.setString(3, dto.getInsnum());
			psmt.setString(4, dto.getRemainpay());
			psmt.setString(5, dto.getPaidprem());
			psmt.setString(6, dto.getPrem());
			psmt.setString(7, dto.getContstat());
			
			affected = psmt.executeUpdate();

			
		}
		catch(Exception e) {
			
			System.out.println("status_insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}
	
	
	//가입현황의 리스트를 출력하는 메소드
	public List<MyStatusDTO> selectStatusList(Map<String,Object> map){
		
		//1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		List<MyStatusDTO> bbs = new Vector<MyStatusDTO>();
		
		//2.게시물 전체를 가져오기 위한 쿼리작성
		
		
		String query = "select member_"+map.get("mode")+"_my.*,rownum from member_"+map.get("mode")+"_my where ";
		
		if(map.get("Word")!=null) {
	    	  if(map.get("Column").equals("both")) {
	    		  query +=""
				  + ""+map.get("Column")+" LIKE '%" + map.get("Word") + "%' "
  				  + " OR "
  				  + " content LIKE '%"+map.get("Word") + "%' "
  				  + "and ";
	    	  }
	    	  else {
	    		  query +=""+ map.get("Column") +" "
  				  + " LIKE '%"+map.get("Word") +"%' "
  				  + " and ";
	    	  }
	      }
	      query +="rownum BETWEEN ? AND ? "
	    		  + " ORDER BY rownum DESC ";
	      System.out.println("쿼리문 : " + query);
	
		try {
			//3.prepare객체생성 및 실행
			psmt = con.prepareStatement(query);
			
			String mode = map.get("mode").toString();
			 psmt.setString(1, map.get("start").toString());
	         psmt.setString(2, map.get("end").toString());
			
			//4.쿼리실행후 결과셋 돌려받음
			rs = psmt.executeQuery();
			
			//5.결과셋의 갯수만큼 반복
			while(rs.next()) {
				
				//6.결과셋을 하나씩 DTO객체에 저장
				MyStatusDTO dto = new MyStatusDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setInsname(rs.getString("insname"));
				dto.setInsnum(rs.getString("insnum"));
				dto.setRemainpay(rs.getString("remainpay"));
				dto.setPaidprem(rs.getString("paidprem"));
				dto.setPrem(rs.getString("prem"));
				dto.setContstat(rs.getString("contstat"));
				if(mode.equals("term"))
				{
					dto.setDeath_ins(rs.getString("death_ins"));
					dto.setRegidate(rs.getDate("regidate"));
				}
				else if(mode.equals("annu"))
				{
					dto.setMonthann(rs.getString("monthann"));
					
				}
					
				
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
	
	
		//보험의 정보를 출력
	   public List<AnnuDTO> selectList1(Map<String,Object> map){
		      
		      //1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		      List<AnnuDTO> bbs = new Vector<AnnuDTO>();
		      
		      //2.게시물 전체를 가져오기 위한 쿼리작성
		      String query = "select annu_insu.*,rownum from annu_insu where ";      
		      
		      if(map.get("Word")!=null) {
		    	  if(map.get("Column").equals("both")) {
		    		  query +=""
	    				  + ""+map.get("Column")+" LIKE '%" + map.get("Word") + "%' "
	    				  + " OR "
	    				  + " content LIKE '%"+map.get("Word") + "%' "
	    				  + "and ";
		    	  }
		    	  else {
		    		  query +=""+ map.get("Column") +" "
	    				  + " LIKE '%"+map.get("Word") +"%' "
	    				  + " and ";
		    	  }
		      }
		      query +="rownum BETWEEN ? AND ? "
		    		  + " ORDER BY rownum DESC ";
		      System.out.println("쿼리문 : " + query);
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
		            AnnuDTO dto = new AnnuDTO();
		            
		            dto.setAnn_name(rs.getString(1));
		            dto.setInstype(rs.getString(2));
		            dto.setInstart(rs.getString(3));
		            dto.setPaytime(rs.getString(4));
		            dto.setPayment(rs.getString(5));
		            dto.setRprem(rs.getString(6));
		            dto.setInterest(rs.getString(7));
		            dto.setMonthann(rs.getString(8));
		            dto.setRegidate(rs.getDate(9));
		            dto.setSubmit(rs.getString(10));
		            dto.setAttfile(rs.getString(11));
		            
		            
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
		   
		public List<PropDTO> selectList2(Map<String,Object> map){
		      
		      //1.결과 레코드셋을 담기위한 리스트계열 컬렉션생성 
		      List<PropDTO> bbs = new Vector<PropDTO>();
		      
		      //2.게시물 전체를 가져오기 위한 쿼리작성
		      String query = "select prop_insu.*,rownum from prop_insu where ";
		      
		      if(map.get("Word")!=null) {
		    	  if(map.get("Column").equals("both")) {
		    		  query +=""
	    				  + ""+map.get("Column")+" LIKE '%" + map.get("Word") + "%' "
	    				  + " OR "
	    				  + " content LIKE '%"+map.get("Word") + "%' "
	    				  + "and ";
		    	  }
		    	  else {
		    		  query +=""+ map.get("Column") +" "
	    				  + " LIKE '%"+map.get("Word") +"%' "
	    				  + " and ";
		    	  }
		      }
		      query +="rownum BETWEEN ? AND ? "
		    		  + " ORDER BY rownum DESC ";
		      System.out.println("쿼리문 : " + query);
		   
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
		            PropDTO dto = new PropDTO();
		            
		            dto.setProp_name(rs.getString(1));
		            dto.setInstype(rs.getString(2));
		            dto.setMonthpay(rs.getString(3));
		            dto.setRegidate(rs.getDate(4));
		            dto.setHosp(rs.getString(5));
		            dto.setGohosp(rs.getString(6));
		            dto.setSanghosp(rs.getString(7));
		            dto.setSgohosp(rs.getString(8));
		            dto.setChbedosu(rs.getString(9));
		            dto.setChbeinje(rs.getString(10));
		            dto.setChbemri(rs.getString(11));
		            dto.setAttfile(rs.getString(12));
		            
		            
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
		
		public int deleteStatus(String num, String mode) {
			int affected = 0;
			try {
				String query = "delete from member_"+mode+"_my where num=?";
				
				psmt = con.prepareStatement(query);			
				psmt.setString(1, num);
				 
				affected = psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("delete_status중 예외발생");
				e.printStackTrace();
			}
			System.out.println("num"+num);
			return affected;	
		}
		
		public int editStatus(String num,String mode) {
			int affected = 0;
			try {
				String query = "update member_"+mode+"_my set contstat='Y' where num=?";
				
				psmt = con.prepareStatement(query);			
				psmt.setString(1, num);
				 
				affected = psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("edit_status중 예외발생");
				e.printStackTrace();
			}
			
			return affected;	
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
