<%@page import="vo.TripVO"%>
<%@page import="dao.TripDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productDetail.jsp</title>
<%

	String no = request.getParameter("pno");

	//상품 디테일
	TripDAO dao = new TripDAO();
	TripVO vo = new TripVO();
	
	int pno = 0;
	if(no != null){
		pno = Integer.parseInt(no);
		
		vo = dao.getData(pno);
	}

%>

<style type="text/css">
#detailimg{
	padding-left: 180px;
}
</style>
</head>
<body>
<div id="detailimg">
	<img src="<%=vo.getDetailimg() %>" alt="" />
</div>
</body>
</html>