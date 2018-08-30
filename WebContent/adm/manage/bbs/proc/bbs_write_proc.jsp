<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dto.BoardDTO"%>
<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파일명 : write_proc.jsp

	//파일이 있을시와 없을시 처리 둘다 필요한 변수,객체를 미리 생성해둔다
	request.setCharacterEncoding("UTF-8");
	BbsDAO dao = new BbsDAO();
	BoardDTO dto = new BoardDTO();
	String name = null;
	String title = null;
	String b_id = null;
	String contents = null;
	String regidate = null;
	

	//첨부파일이 없는경우 mr 을 사용해서 데이터를 가져오거나 저장할수가 없다 그러므로 첨부파일이 있는지를 확인하기 위한변수 생성
	int check = Integer.parseInt(request.getParameter("filecheck"));
	System.out.println(check);
	//파일이 있을경우
	if (check == 0) {
		//본격적으로 받아봅시당 try문 안쪽은 지역변수이므로 아래쪽에서 에러가 날 가능성이 있으므로 깔끔하게 미리처리
		MultipartRequest mr = null;
		StringBuffer inter = new StringBuffer();
		String encoding = "UTF-8";
		//저장된 파일명 변경을 위한 객체생성
		File oldFile = null;
		File newFile = null;
		String realFileName = null;
		try {
			//파일 받기 처리 실제 경로와 파일 최대 사이즈 정의
			String saveDirectory = application.getRealPath("/Upload");
			int maxPostSize = 1024 * 5000;
			//파일 중복값 처리용 클래스
			FileRenamePolicy policy = new DefaultFileRenamePolicy();
			mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

			//저장된 파일명 가져오기
			String fileName = mr.getFilesystemName("attfile");
			System.out.println("파일네임체크" + fileName);
			//파일명 변경을 위해 현재시간 가져오기. 
			/*
			※SimpleDateFormat의 서식문자중 대문자 S는 1/1000
			단위로 초를 가져오는것임
			*/
			String nowTime = new SimpleDateFormat("yyyy_MM_dd_H_m_s_S").format(new Date());
			//파일의 확장자를 가져오기 위한 변수
			int idx = -1;
			//파일명 사이에 .이 여러개 있을수 있으므로 항상
			//마지막 .을 가져와야 확장자를 딸수 있다.
			idx = fileName.lastIndexOf(".");
			//시간을통해 생성한 파일명과 확장자를 합체
			realFileName = nowTime + fileName.substring(idx, fileName.length());
			oldFile = new File(saveDirectory + oldFile.separator + fileName);
			newFile = new File(saveDirectory + oldFile.separator + realFileName);

			oldFile.renameTo(newFile);
			//7.파일 이외의 폼값 받기
			b_id = mr.getParameter("b_id");
			title = mr.getParameter("title");
			name = mr.getParameter("name");
			contents = mr.getParameter("contents");
			dto.setAttfile(mr.getOriginalFileName("attfile"));
			dto.setAttfileR(realFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//파일이 없을경우
	else {
		System.out.println("파일이없네요");
		b_id = request.getParameter("b_id");
		title = request.getParameter("title");
		contents = request.getParameter("contents");
		name = request.getParameter("name");
	}
	//DTO객체 생성 및 값 설정

	dto.setTitle(title);
	dto.setName(name);
	dto.setContents(contents);
	//추후 로그인후 생성
	//dto.setId(session.getAttribute("USER_ID").toString());
	dto.setB_id(b_id);

	//커넥션풀로 변경
	System.out.println("타이틀" + title);

	int affected = dao.write(dto);
	dao.close();
%>
<script language="JavaScript">
	
<%if (affected == 1) {%>
	alert("글쓰기 완료");
	opener.parent.location.reload();
	window.close();
<%} else {%>
	alert("글쓰기중 문제가 발생하였습니다.");
	opener.parent.location.reload();
	window.close();
<%}%>
</script>