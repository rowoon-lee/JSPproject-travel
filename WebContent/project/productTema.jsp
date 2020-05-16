<%@page import="java.util.ArrayList"%>
<%@page import="vo.TemaVO"%>
<%@page import="dao.TemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productTema.jsp</title>
<style type="text/css">
	#minus{
		margin-top: 50px;
		margin-left: 100px;
	}
	
	#delete{
		margin-left: 570px;
		margin-top: 10px;
	    padding: 3px;
	    width: 70px;
	    height: 30px;
	    font-size: 15px;	
	}
	
	#modify{
	margin-left: 20px;
    margin-top: 10px;
    padding: 3px;
    width: 70px;
    height: 30px;
    font-size: 15px;
	}
	
	#insert{
		margin-left: 20px;
	    margin-top: 10px;
	    padding: 3px;
	    width: 70px;
	    height: 30px;
	    font-size: 15px;
	}		
	#div1{
		margin-left : 300px;
		width: 1000px;
		height : 50px;
		border :1px solid black;
		padding-bottom: 10px;
		marign-bottom: 10px;
		padding-top: 10px;
	}
	
	#div1 h3{
		display : inline;
		padding-top: 1px;
		padding-left: 20px;
		margin-bottom: 10px;
		margin-left : 10px;
	}
	#div2{
		padding-top : 40px;
		padding-bottom : 40px;
		margin-left : 300px;
		margin-top : 1px;
		width: 1000px;
		height : 100%;
		border :1px solid black;
	}
	
	#div3{
		margin-top : 400px;
		margin-left : 550px;
		width: 500px;
		height : 50px;
		border :1px solid black;
		padding-bottom: 10px;
		marign-bottom: 10px;
		padding-top: 10px;
	}
	
	#div3 h3{
		display : inline;
		padding-top: 1px;
		padding-left: 20px;
		margin-bottom: 100px;
		margin-left : 10px;
		
	}
	
	#target1{
		padding-top : 40px;
		padding-bottom: 40px;
		margin-left : 550px;
		margin-top : 1px;
		width: 500px;
		height : 100%;
		border :1px solid black;
	}
	
	p{
		font-size: 15px;
		}
	table{
		margin: 20px;
		width: 800px;
		margin-left: 100px;
	}
	
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	td{
		font-size: 15px;	
		height: 30px;
	}
	
	th{
		height: 30px;
		padding: 2px;
		font-size: 15px;
		background-color: #C4DEFF;
		text-shadow: 2px 2px 2px #D5D5D5;
	}
	.col0{
		width: 10%;
		text-align: center;
	}
	
	.col1{
		width: 20%;
		text-align: center;
	}
	
	.col2{
		width: 70%;
		text-align: center;
	}
	span{
		margin-left: 50px;
		display: inline;
	}
	#plust{
		margin-left: 20px;
		height: 30px;
	}
	
	#plus{
		margin-left: 20px;
		margin-top: 10px;
	    padding: 3px;
	    width: 100px;
	    height: 30px;
	    font-size: 15px;
	}
	

	

	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		 $(".scroll").click(function(event){            
		 event.preventDefault();
		 $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
		 });
	 });

	 function checkAll(){
	     if( $("#checkAll").is(':checked') ){
	       $("input[type=checkbox]").prop("checked", true);
	     }else{
	       $("input[type=checkbox]").prop("checked", false);
	     }	
	 }
	
	 
	 $(document).ready(function() {
	 var tdArr = new Array();	//td 값을 담음
	 //상단 선택버튼 클릭시 체크된 Row의 값을 가져옴
		$(".checkRow").click(function(){
			var rowData = new Array();	//행의 값을 담음
			var checkbox = $("input[type=checkbox]:checked"); //체크된 체크박스를 담음
		 
			checkbox.each(function(i){	//체크된 체크박스를 가져옴
		 	var tr = checkbox.parent().parent().eq(i);
		 	var td = tr.children();	
		 	console.log(tr);
		 	
		 	//체크된 row의 모든 값을 배열에 담음
		 	rowData.push(tr.text());
			console.log(td.eq(1));
		 	//td.eq(0)은 체크박스, td.eq(1)은 상품번호, td.eq(2)는 테마명......
		 	var tno = td.eq(1).text();
		 	console.log(tno); 
		 	tdArr.push(tno);
			console.log(tdArr);
	
			//for(int i=0; i<tdArr.length; i++){
				//document.write(tdArr[i]);
			//}
			});
		});
			//삭제 버튼 누르면 삭제
		$("#delete").click(function(){
			console.log(tdArr);
			document.location = "TemaMinus.jsp?tdArr="+tdArr;
		});
	});
	
</script>
</head>	
<body>
	<p>홈 > 상품관리 > <a href="">상품테마관리</a></p>
	<h2>상품테마</h2>
	<div id="div1">
		<h3>테마목록</h3>
		<%
		String tno = request.getParameter("tno");
		TemaDAO dao1 = new TemaDAO();
		TemaVO vo1 = new TemaVO();
		%>
		<input type="button" id="delete" value="테마삭제">
		<input type="button" id="modify" value="테마수정" />
		<a href="#target1" class="scroll"><input type="button" id="insert" value="테마추가" /></a>
	</div>
	<div id="div2">
		<table>
	   	 	<tr>
	   	 		<th class="col0"> <input type="checkbox" name="checkAll" id="checkAll" onclick="checkAll();" ></th>
		        <th class="col1">테마번호</th>
		        <th class="col2">테마명</th>
	    	</tr>
	    	
	    	<%
			TemaDAO dao = new TemaDAO();
			ArrayList<TemaVO> list = dao.selectTema();
	    	
			for(TemaVO vo : list){
			%>
	
			<tr>
				<td class="col0"> <input type="checkbox" name="checkRow" class="checkRow"></th>
				<td class="col1"><%=vo.getTno() %></td>
				<td class="col2"><a href=""><%=vo.getTname() %></a></td>
			</tr> 
			
			<%
			}
			%>
		</table>	
	</div>
	
	
	<form action="TemaPlus.jsp">
		<div id="div3">
			<h3>테마추가</h3>	
		</div>
		<div id="target1">
			<span>테마명</span>
			<input type="text" name ="tname" id="plust"/>
			<input type="submit" value="+ (테마 등록)" id="plus" />	
		</div>			
	</form>
</body>

</html>