<%@page import="java.util.ArrayList"%>
<%@page import="vo.P_MemberVO"%>
<%@page import="dao.P_MemberDAO"%>
<%@page import="dao.P_OrderDAO"%>
<%@page import="vo.P_OrderVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 1300px;
		margin: 0 auto;
	}
	
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	td{
		height: 35px;
		font-size: 15px;	
	}
	
	th{
		padding: 2px;
		font-size: 15px;
		background-color:#C4DEFF;
		text-shadow: 2px 2px 2px #D5D5D5;
	}
	.col0{
		width: 3%;
		text-align: center;
	}
	.col1{
		width: 17%;
		text-align: center;
	}
	
	.col2{
		width: 9%;
		text-align: center;
	}
	.col3{
		width: 10%;
		text-align: center;
	}
	
	.col4{
		width: 25%;
		text-align: center;
	}
	
	.col5{
		width: 10%;
		text-align: center;
	}
	
	.col7{
		width: 15%;
		text-align: center;
	}
	.col8{
		width: 10%;
		text-align: center;
	}
	#pagelist{
		text-align: center;
		height: 50px;
		
	}
	
	#page{
		width: 10px;
		margin: 0;
		padding: 2px;
		border: 1px solid gray;
		text-align: center;
	}

</style>
</head>
<body>
		<table>
	   	 	<tr>
	   	 		<th class="col0"><input type="checkbox" id="checkAll"></th>
		        <th class="col1">예약일(결제일)</th>
		        <th class="col2">예약번호</th>
		        <th class="col3">예약자</th>
		        <th class="col4">상품명</th>
		        <th class="col5">결제금액</th>
		        <th class="col7">결제상태</th>
		        <th class="col8">여행일</th>
	    	</tr>
	    	
	    	<%
	    	P_OrderDAO dao = new P_OrderDAO();
	    	ArrayList<P_OrderVO> list = dao.moneyOk();
	    	
	    	for(P_OrderVO vo : list){	    			
	    	%>
	    	<%
	    	int memno = vo.getMemno();
	    	
	    	P_MemberDAO dao1 = new P_MemberDAO();
	    	P_MemberVO vo1 = new P_MemberVO();
	    	vo1 = dao1.selectMid(memno);
	    	%>
	 		<tr>
				<td class="col0"><input type="checkbox" name="checkRow"></td>
				<td class="col1"><%=vo.getOdate() %> </td>
				<td class="col2"><%=vo.getOno() %> </td>
				<td class="col3"><%=vo1.getMid()%> </td>
				<td class="col4"><%=vo.getPname() %> </td>
				<td class="col5"><%=vo.getPprice() %> </td>
				<td class="col7"><%=vo.getStatus() %> </td>
				<td class="col8"><%=vo.getTdate() %> </td>
			</tr> 
			<%
	    	}			
			%>
			
		</table>	    
</body>
</html>