<%@page import="dao.TripDAO"%>
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
	//out.print(checks);
	String[] checks = tmp[0].split(",");
	int[] pno = null;
	if(checks!=null){
		pno = new int[checks.length];
		for(int i=0; i<checks.length; i++){
			pno[i] = Integer.parseInt(checks[i]);
			
			TripDAO dao = new TripDAO();
			dao.deleteTrip(pno[i]);
		}
			response.sendRedirect("adminMain.jsp?fno=productList");
	}
	
	%>
</body>
</html>