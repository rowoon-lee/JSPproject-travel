<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderChangeList.jsp</title>
<style type="text/css">
	p{
		font-size: 15px;
	}

	#board{
	width: 1400px;
	height: 100%;
	margin-top:-2px;
    padding-top: 40px;
    padding-bottom: 40px;
    border: 1px solid gray;
    border-radius: 2px;
    box-shadow: 0px 2px 1px 0px #EAEAEA;
    color: #6e6e6e;
	}
	
	#nav, #board{
		margin-left: 120px;
	}
	#nav{
		margin-top : 70px;
	}
	#before, #ok, #cbefore, #cafter{
		padding: 2px 20px 2px 20px;
		width: 150px;
		height: 40px;
		color: #6e6e6e;
		background: #C4DEFF;
		border: 1px solid #A0BAED;
		border-radius: 40px;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
	    $('#before').click(function(){
	    	$('#board').load("before.jsp");
	    });
	    $('#ok').click(function(){
	    	$('#board').load("ok.jsp");
	    });
	    $('#cbefore').click(function(){
	    	$('#board').load("cbefore.jsp");
	    });
	    $('#cafter').click(function(){
	    	$('#board').load("cafter.jsp");
	    });
	    
	    $("#before").click(function(){
			$('#before').css("background-color", "#fff").css("color", "black").css("font-weight", "bold").css("font-size", "17px");
			$('#ok').css("background-color", "#C4DEFF").css("color", "black");
			$('#cbefore').css("background-color", "#C4DEFF").css("color", "black");
			$('#cafter').css("background-color", "#C4DEFF").css("color", "black");
		});
	    $("#ok").click(function(){
			$('#ok').css("background-color", "#fff").css("color", "black").css("font-weight", "bold").css("font-size", "17px");
			$('#before').css("background-color", "#C4DEFF").css("color", "black");
			$('#cbefore').css("background-color", "#C4DEFF").css("color", "black");
			$('#cafter').css("background-color", "#C4DEFF").css("color", "black");
		});	
	    $("#cbefore").click(function(){
			$('#cbefore').css("background-color", "#fff").css("color", "black").css("font-weight", "bold").css("font-size", "17px");
			$('#ok').css("background-color", "#C4DEFF").css("color", "black");
			$('#before').css("background-color", "#C4DEFF").css("color", "black");
			$('#cafter').css("background-color", "#C4DEFF").css("color", "black");
		});	
	    $("#cafter").click(function(){
			$('#cafter').css("background-color", "#fff").css("color", "black").css("font-weight", "bold").css("font-size", "17px");
			$('#ok').css("background-color", "#C4DEFF").css("color", "black");
			$('#cbefore').css("background-color", "#C4DEFF").css("color", "black");
			$('#before').css("background-color", "#C4DEFF").css("color", "black");
		});	
	});

</script>

</head>
<body>
<p>홈 > 주문관리 > <a href="">주문진행상태</a></p>	
	<h2>주문진행상태</h2>
		<div id="nav">
			<button id="before" value="입금전">입금전</button>
			<button id="ok" value="입금완료">입금완료</button>
			<button id="cbefore" value="입금전취소">입금전취소</button>
			<button id="cafter" value="입금후취소">입금후취소</button>
		</div>		
		<div id="board">
			 <jsp:include page="before.jsp"></jsp:include>
		</div>
</body>
</html>