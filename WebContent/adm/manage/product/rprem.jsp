<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int paytime = Integer.parseInt(request.getParameter("paytime"));
	int instime =Integer.parseInt(request.getParameter("instime"));
	int rprem = Integer.parseInt(request.getParameter("rprem"));
	int death = Integer.parseInt(request.getParameter("death"));
	
	double result = 0;
	
	result = death*(1+(rprem*0.01))/instime+paytime;
	result = (result* Math.pow(1.03, instime))/12;
	result = (int)Math.round(result);
	

	String resultStr = "<input type='text' name='monthpay' id='mp' placeholder='계산식' value='"+result+"'/>";
	out.println(resultStr);
%>
