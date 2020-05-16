<%@page import="vo.FestivalVO"%>
<%@page import="dao.FestivalDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>festivalOk.jsp</title>
</head>
<body>
	<%
		String saveDir = request.getRealPath("festivalimg");
		
		int maxFileSize = 1024*1024*10;
		
		 MultipartRequest mr =
	  			  new MultipartRequest(request, saveDir, maxFileSize,  "UTF-8", new DefaultFileRenamePolicy());
	
		String location = mr.getParameter("location");
		String fname = mr.getParameter("fname");
		String fimg = mr.getOriginalFileName("fimg");
		String fdate = mr.getParameter("fdate");
		String fdate1 = mr.getParameter("fdate1");
		
		FestivalDAO dao = new FestivalDAO();
		FestivalVO vo = new FestivalVO();
		
		vo.setLocation(location);
		vo.setFname(fname);
		vo.setFimg("../festivalimg/" +fimg);
		vo.setFdate(fdate);
		vo.setFdate1(fdate1);
		
		dao.insertFestival(vo);
		
		response.sendRedirect("adminMain.jsp");
		
	
	%>

</body>
</html>