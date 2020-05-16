<%@page import="vo.TemaVO"%>
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
	String pname = "";
	
	String fno = request.getParameter("fno"); //request사용해도 충분
		
	if(fno==null){
			pname ="main.jsp"; 
	}else{
		pname = fno + ".jsp";
	}
	
	%>

	<%
		String tname = request.getParameter("tname");
	
		TemaDAO dao1 = new TemaDAO();
		TemaVO vo1 = new TemaVO();
		
		vo1.setTname(tname);
		
		dao1.insertTema(vo1);
		
		response.sendRedirect("adminMain.jsp?fno=productTema");	
	%>
</body>
</html>