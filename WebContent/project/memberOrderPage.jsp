<%@page import="java.util.ArrayList"%>
<%@page import="vo.P_OrderVO"%>
<%@page import="dao.P_OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .col1{
 	text-align: center;
 	width: 20%;
 }
 .col2{
 	text-align: center;
 	width: 10%;
 }
 .col3{
 	text-align: center;
 	width: 25%;
 }
 .col4{
 	text-align: center;
 	width: 15%;
 }
 .col5{
 	text-align: center;
 	width: 15%;
 }
 .col6{
 	text-align: center;
 	width: 15%;
 }



</style>
<%
	String no = request.getParameter("memno");

	P_OrderDAO dao = new P_OrderDAO();

	ArrayList<P_OrderVO> list = new ArrayList<P_OrderVO>();
	
	String memno = null;
	if(no != null){
		memno = no;
		
	 list = dao.getMyreserve(memno);
	}
%>
</head>
<body>

		<table>
	   	 	<tr>
		        <th class="col1">예약일(결제일)</th>
		        <th class="col2">예약번호</th>
		        <th class="col3">상품명</th>
		        <th class="col4">결제금액</th>
		        <th class="col5">결제상태</th>
		        <th class="col6">여행일</th>
	    	</tr>
	    	

	 		<%for(P_OrderVO vo: list){ %>
	 		<tr>
	 		
				<td class="col1"><%=vo.getOdate() %> </td>
				<td class="col2"><%=vo.getOno() %> </td>
				<td class="col3"><%=vo.getPname() %> </td>
				<td class="col4"><%=vo.getPprice() %> </td>
				<td class="col5"><%=vo.getStatus() %> </td>
				<td class="col6"><%=vo.getTdate() %> </td>
			</tr> 
			<%} %>

		</table>	 

</body>
</html>