<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int paytime = Integer.parseInt(request.getParameter("paytime"));
	int instime =Integer.parseInt(request.getParameter("instime"));
	int rprem = Integer.parseInt(request.getParameter("rprem"));
	int death = Integer.parseInt(request.getParameter("death"));
	int birth = Integer.parseInt(request.getParameter("birth"));
	double result = 0;
	
	if(paytime>=40)
	{
		paytime = paytime - birth;
	}
	else if(instime>=40)
	{
		instime = instime - birth;
	}
	
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
	String resultStr = "<input type='text' name='monthpay' id='mp' placeholder='계산식' value='"+result+"'/>";
	out.println(resultStr);
	
%>
