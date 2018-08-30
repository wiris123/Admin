<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int hosp = Integer.parseInt(request.getParameter("hosp"));
	int gohosp = Integer.parseInt(request.getParameter("gohosp"));
	int sanghosp = Integer.parseInt(request.getParameter("sanghosp"));
	int sgohosp = Integer.parseInt(request.getParameter("sgohosp"));
	int chbedosu = Integer.parseInt(request.getParameter("chbedosu"));
	int chbeinje = Integer.parseInt(request.getParameter("chbeinje"));
	int chbemri = Integer.parseInt(request.getParameter("chbemri"));

	
	//보험료처리
	int premium = hosp+gohosp+sanghosp+sgohosp+chbedosu+chbeinje+chbemri;
	int result = 10000;
	result = (int)(10000*(1+(premium*2*0.01)));

	
	JSONObject obj = new JSONObject();
	obj.put("result", result);
	obj.put("rprem", premium);
	
	response.getWriter().write(obj.toString());


%>
