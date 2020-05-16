<%@page import="dao.P_OrderDAO"%>
<%@page import="vo.P_OrderVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<style type="text/css">
	#order{
		margin-top : 50px;
		margin-left : 180px;
		width: 1270px;	
		height: 100%;
	}

		
	#order1{
		margin-top : 50px;
		margin-left : 180px;
		width: 1270px;
		height: 100%;
	}
	
	#money, #refund, #reservation{
		width: 350px;
		height: 140px;
		font-size : 20px;
		background: #FFFDF9;
		border: 2px solid #A0BAED;
		border-radius: 40px;
		font-weight: bold;
		color: #6e6e6e;
	}
	
	#money, #refund{
		margin-left: 100px;
	}
	#ok, #cbefore, #cafter{
		margin-left: 80px;
	}
	#before, #ok, #cbefore, #cafter{
		width: 250px;
		height: 140px;
		font-size : 20px;
		color: #6e6e6e;
		background: #FFFDF9;
		border: 2px solid #A0BAED;
		border-radius: 40px;
		font-weight: bold;
	}
	#qna{
	    padding: 1px 15px 1px 15px;
	    font-size: 20px;
	    width: 130px;
		height: 40px;
	    color: #6e6e6e;
		background: #FFFDF9;
		border: 2px solid #A0BAED;
		border-radius: 40px;
	    margin-left: 180px;
	    margin-top: 60px;
	    font-weight: bold;
	}

	#board{
		height: 270px;
		margin-left: 160px;
		width: 1300px;
		color: gray;
		padding-left:10px;
		padding-right: 10px; 
	}	
	
	
	#imgs{
		width: 40px;
		height: 40px;
	}
	
	#moreview{
		margin-left: 1150px;
		color: #6e6e6e;
		background: #FFFDF9;
	}
	
	span{
		font-weight: bold;
		color: #6e6e6e;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		$('#moreview').click(function(){
			location.href = "adminMain.jsp?fno=boardManage";
		});
		$('#before').click(function(){
			location.href = "adminMain.jsp?fno=orderChangeList";
		});
		$('#ok').click(function(){
			location.href = "adminMain.jsp?fno=orderChangeList";
		});
		$('#cbefore').click(function(){
			location.href = "adminMain.jsp?fno=orderChangeList";
		});
		$('#cafter').click(function(){
			location.href = "adminMain.jsp?fno=orderChangeList";
		});
	});		
</script>
</head>
<body>
	<div id="order">
		<span>오늘 매출 현황</span><br /><br />
		<button id="reservation">
			<img src="https://image.flaticon.com/icons/png/128/1170/1170678.png" alt="" id="imgs"/> 
			주문 
			<%
				P_OrderDAO dao = new P_OrderDAO();
				String reservation = dao.selectOrderPrice();	
			 %>
			 ( <%=reservation %> ) 원	
		</button>
		<button id="money">
			<img src="https://image.flaticon.com/icons/svg/1087/1087117.svg" id="imgs" /> 
			결제 
			<%
				String money = dao.selectOk();	
			 %>
			 ( <%=money %> ) 원
		</button>
		<button id="refund">
			<img src="https://www.flaticon.com/premium-icon/icons/svg/2366/2366081.svg" id="imgs" /> 
			환불 
			<%
				String refund = dao.selectCafter();	
			 %>
			 ( <%=refund %> ) 원
			</button>
	</div>
	
	<div id="order1">
		<span>주문 진행 현황 ( 최근 1개월 기준 ) </span><br /><br />
		<button id="before">
			입금 전 <br />
			<%
				int before = dao.aA();
			%>
			( <%=before %> ) 건
		</button>
		<button id="ok">
			입금 완료 <br />
			<%
				int ok= dao.aB();
			%>
			( <%=ok %> ) 건
		</button>
		<button id="cbefore">
			입금 전 취소 <br />
			<%
				int cbefore= dao.aC();
			%>
			( <%=cbefore %> ) 건
		</button>
		<button id="cafter">
			입금 후 취소 <br />
			<%
				int cafter= dao.aD();
			%>
			( <%=cafter %> ) 건
		</button>
	</div>

	<button id="qna" value="Q&A">Q & A</button>
	<div id="board">
		<jsp:include page="../project/list2.jsp"></jsp:include>
	</div>
		<input type="button" value="더 보기" id="moreview"/>

</body>
</html>