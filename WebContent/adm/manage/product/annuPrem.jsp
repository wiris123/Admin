<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int payment = Integer.parseInt(request.getParameter("payment"));
	String instart  = request.getParameter("instart");
	String regidate = request.getParameter("regidate");
	int rprem = Integer.parseInt(request.getParameter("rprem"));
	int interest =Integer.parseInt(request.getParameter("interest"));
	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date begin = formatter.parse(instart);
	Date end = formatter.parse(regidate);
	
	long diffDays = (begin.getTime() - end.getTime()) / (24 * 60 * 60 * 1000);
	diffDays = diffDays / 365;
	
	//연금보험 계산
	double result = 0;
	
	result = (payment*10000)* Math.pow(1+(interest*0.01), (int)diffDays) / Math.pow(1+(3*0.01) , (int)diffDays);
	result = result + (result * (interest*0.01*diffDays)) -(result*((rprem*0.01)*diffDays));
	result = (int)Math.round(result);

	
	JSONObject obj = new JSONObject();
	obj.put("payt", (int)diffDays);
	obj.put("result", result);
	
	response.getWriter().write(obj.toString());
	
%>