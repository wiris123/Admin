<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int paytime = Integer.parseInt(request.getParameter("paytime"));
	int payment = Integer.parseInt(request.getParameter("payment"));
	String instart  = request.getParameter("instart");
	String regidate = request.getParameter("regidate");
	int rprem = Integer.parseInt(request.getParameter("rprem"));
	 
	
	double result = 0;
	
	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date begin = formatter.parse(instart);
	Date end = formatter.parse(regidate);
	
	long diffDays = (begin.getDate()-end.getDate()) / (24 * 60 * 60 * 1000);

	

	result = death*Math.pow(1.05,instime)/Math.pow(1.05,instime-paytime);
	result = (result/100);
	result = result*(1+(rprem*0.01))/12;
	result = (int)Math.round(result);
	 
	
	/*
		연금보험 계산?
				result = death/instime+paytime;
		result = (result* Math.pow(1.03, instime))*(1+(rprem*0.01))/12;
		result = (int)Math.round(result);
	*/
	
	JSONArray jArr = new JSONArray();
	JSONObject obj = new JSONObject();
	String resultStr = "<span id='result'><input type='number' name='payment' value='' readonly/></span>";
	out.println(resultStr);


%>