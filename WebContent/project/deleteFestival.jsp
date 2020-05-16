<%@page import="dao.FestivalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String[] tmp = request.getParameterValues("tdArr");
	String[] fname = tmp[0].split(",");

	if(fname!=null){
		for(int i=0; i<fname.length; i++){
			FestivalDAO dao = new FestivalDAO();
			dao.deleteFestival(fname[i]);
		}
			response.sendRedirect("adminMain.jsp?fno=festivalList");
	}
	%>
</body>
</html>