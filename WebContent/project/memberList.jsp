<%@page import="java.util.ArrayList"%>
<%@page import="vo.P_MemberVO"%>
<%@page import="dao.P_MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
<style type="text/css">
p{
		font-size: 15px;
	}
table{
		width: 1300px;
		margin: 0 auto;
	}
	
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	td{
		font-size: 15px;
		height: 40px;	
	}
	
	th{
		padding: 2px;
		font-size: 15px;
		background-color: #C4DEFF;
		text-shadow: 2px 2px 2px #D5D5D5;
	}
	.col1{
		width: 7%;
		text-align: center;
	}
	
	.col2{
		width: 10%;
		text-align: center;
	}
	.col3{
		width: 18%;
		text-align: center;
	}
	
	.col4{
		width: 10%;
		text-align: center;
	}
	
	.col5{
		width: 15%;
		text-align: center;
	}
	.col6{
		width: 10%;
		text-align: center;
	}
	.col7{
		width: 15%;
		text-align: center;
	}
	.col8{
		width: 15%;
		text-align: center;
	}
	#div1{
		margin-left : 100px;
		width: 1400px;
		height : 50px;
		border :1px solid black;
		padding-bottom: 20px;
		marign-bottom: 10px;	
		padding-top: 0px;
	}
	#div1 h3{
		padding: 1px 0px 30px 20px;
		margin-bottom: 20px;
		margin-left : 10px;
	}
	#div2{
		padding-top : 40px;
		padding-bottom : 40px;
		margin-left : 100px;
		margin-top : 1px;
		width: 1400px;
		height : 100%;
		border :1px solid black;
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
	
	.bt{
	font-size: 14px;
	margin-top: 10px;
	background-color: white;
	border: none;
	border-bottom: 1px solid black;
		
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){		
	    $("#a").on('click', function(){
	    	location.href="adminMain.jsp?fno=memeberList";
	    });
	    
	$('.bt').click(function(){
			
			console.log(this.value);
			
			$('#div2').load('memberOrderPage.jsp?memno='+this.value);
			$('#div1').load('ptag.jsp');
			
		});
	});

</script>
</head>
<body>
	<p>홈 > 고객관리 > <a href="">회원목록</a></p>
	<h2>회원목록</h2>
	<div id="div1">
		<h3>회원리스트</h3>
	</div>
	<div id="div2">
		<table>
	   	 	<tr>
		        <th class="col1">회원번호</th>
		        <th class="col2">아이디</th>
		        <th class="col3">비밀번호</th>
		        <th class="col4">이름</th>
		        <th class="col5">생년월일</th>
		        <th class="col6">성별</th>
		        <th class="col7">휴대폰번호</th>
		        <th class="col8">이메일</th>
	    	</tr>
	    	
	    	<%
			P_MemberDAO dao = new P_MemberDAO();
			ArrayList<P_MemberVO> list = dao.selectMember();
			
			for(P_MemberVO vo : list){
			%>
	
			<tr>
				<td class="col1"><%=vo.getMemno() %></td>
				<td class="col2">
				<button class="bt" value="<%=vo.getMemno()%>"><%=vo.getMid() %></button>
				</td>
				<td class="col3"><%=vo.getMpw() %></td>
				<td class="col4"><%=vo.getMname() %></td>
				<td class="col5"><%=vo.getMbirth() %></td>
				<td class="col6"><%=vo.getMgender() %></td>
				<td class="col7"><%=vo.getMhp() %></td>
				<td class="col8"><%=vo.getMemail() %></td>
			</tr> 
			
			<%
			}
			%>
		
		</table>	
	</div>    
</body>
</html>