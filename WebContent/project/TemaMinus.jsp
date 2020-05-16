<%@page import="dao.TemaDAO"%>
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
	int[] tno = null;
	if(checks!=null){
		tno = new int[checks.length];
		for(int i=0; i<checks.length; i++){
			tno[i] = Integer.parseInt(checks[i]);
			
			TemaDAO dao = new TemaDAO();
			dao.deleteTema(tno[i]);
		}
			response.sendRedirect("adminMain.jsp?fno=productTema");
	}
	%>
</body>
</html>