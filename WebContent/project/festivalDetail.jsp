<%@page import="vo.FestivalVO"%>
<%@page import="dao.FestivalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<%
	String fname = request.getParameter("fname");

	FestivalDAO dao = new FestivalDAO();
	FestivalVO vo = new FestivalVO();
	
	 vo = dao.selectFimg(fname);
	
%>

<div id="festivaldetail">
	<img src="<%=vo.getFimg() %>" alt="" />
</div>

</body>
</html>