<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	//질문과답변
	$(document).ready(function() {
		$("#qna").click(function(){
			$("#boarddiv").load("../qna_board/list.jsp");
		});
	});
	
	//자주묻는질문
	$(document).ready(function() {
    	$("#faq").click(function(){
    		$("#boarddiv").load("../faqboard/faq_list.jsp");
    	});
	});
	
	
</script>
<style type="text/css">
	
	#listdiv{
	
		margin : 0px;
		width : 200px;
		position: static;
		display: block;
		float: left;
		
	}
	
	#boarddiv{
	
		width : 830px;
		height: 7000px;
		background-color: gray;
		margin-left: 300px;
		position: relative;
		
	}
	
	#cc_title{
	
		width: 155px;
 		height: 70px;
  		margin: 10px 0px 0px 0px;	
  		text-align : center;
    	background-color: #fff;
    	border-top: 3px solid #22409a;
    	border-bottom: 1px solid #e1e1e1;
    	border-collapse: collapse;
		
	}
	
	#strong{
	
		padding : 20px 0 5px 0px;
		display: block;
	}
	
	#customcenter {
	
		width : 155px;
		margin:0px;
		padding-left: 0px;
		font-size: 15px;
		text-align : center;

	
	}
	
	
	#notice, #qna, #faq {
		
		height: 20px;
		list-style-type: none;
		font-family: "나눔고딕",Nanum Gothic,Malgun Gothic,"Spoqa Han Sans", "돋움",Dotum,"굴림",Gulim, AppleGothic, Sans-serif;
		padding: 15px 21px 15px 21px;
		border-bottom: 1px solid #e1e1e1;
		border-collapse: collapse;
		
	}


</style>
</head>

<body>
	<div id="listdiv">
		<h2 id="cc_title"><strong id="strong">고객센터</strong></h2>
		<ul id="customcenter">
			<li id="notice">공지사항</li>
			<li id="qna">질문과 답변</li>
			<li id="faq">자주묻는질문</li>
		</ul>
	</div>
	
	
	<%
	
		String pname = "";
	
		String fno = request.getParameter("fno");
		
		if(fno==null){
			pname = "../qna_board/list.jsp";
		}else{
			pname = fno;
		}

	%>
	
	
	<div id="boarddiv">
		<jsp:include page="<%=pname %>"></jsp:include>
	</div>
</body>
</html>