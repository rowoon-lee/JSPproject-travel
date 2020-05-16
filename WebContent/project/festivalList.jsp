<%@page import="java.util.ArrayList"%>
<%@page import="vo.FestivalVO"%>
<%@page import="dao.FestivalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>festivalList.jsp</title>
<style type="text/css">
	p{
			font-size: 15px;
		}
	table{
			width: 900px;
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
	.col0{
		width: 5%;
		text-align: center;
	}
	.col1{
		width: 20%;
		text-align: center;
	}
	
	.col2{
		width: 40%;
		text-align: center;
	}
	
	.col3{
		width: 35%;
		text-align: center;
	}

	#div1{
		margin-left : 300px;
		width: 1000px;
		height : 30px;
		border :1px solid black;
		padding-bottom: 20px;
		marign-bottom: 10px;
		padding-top: 0px;
	}
	#div1 h3{
		padding: 1px 10px 30px 10px;
		margin-bottom: 20px;
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
	#delete{
    margin-left: 20px;
    margin-top: 10px;
    padding: 3px;
    width: 100px;
    height: 30px;
    font-size: 15px;
    background-color: #FFFDF9;
    
	}
	#modify{
	margin-left: 20px;
    margin-top: 10px;
    padding: 3px;
    width: 100px;
    height: 30px;
    font-size: 15px;
    background-color: #FFFDF9;
	}
	
	#insert{
	margin-left: 600px;
    margin-top: 10px;
    padding: 3px;
    width: 100px;
    height: 30px;
    font-size: 15px;
    background-color: #FFFDF9;
	}	
	
	#target1{
		width: 1300px;
		margin-left: 200px;
		margin-top : 500px;
		border: 1px solid black;

	}
	
	img{
		width: 100%;
		
	}
	
	#pagelist{
		text-align: center;
	}
	
	#page{
		width: 10px;
		margin: 0;
		padding: 2px;
		border: 1px solid gray;
		text-align: center;
	}
	.btn{
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
	    //체크박스 전체 선택&해제
	    $('#checkAll').click(function(){
	         if($("#checkAll").prop("checked")){
	            $("input[type=checkbox]").prop("checked",true); 
	        }else{
	            $("input[type=checkbox]").prop("checked",false); 
	        }
	    });
	    
	    $("#insert").on('click', function(){
	    	location.href="adminMain.jsp?fno=insertFestival";
	    });
	    
		 var tdArr = new Array();	//td 값을 담음
		 //상단 선택버튼 클릭시 체크된 Row의 값을 가져옴
			$(".checkRow").click(function(){
				var rowData = new Array();	//행의 값을 담음
				var checkbox = $("input[type=checkbox]:checked"); //체크된 체크박스를 담음
			 
				checkbox.each(function(i){	//체크된 체크박스를 가져옴
			 	var tr = checkbox.parent().parent().eq(i);
			 	var td = tr.children();	
			 //	console.log(tr);
			 	
			 	//체크된 row의 모든 값을 배열에 담음
			 	rowData.push(tr.text());
				console.log(td.eq(2));
			 	//td.eq(0)은 체크박스, td.eq(1)은 상품번호, td.eq(2)는 테마명......
			 	var fname = td.eq(2).text();
			 	console.log(fname); 
			 	tdArr.push(fname);
				console.log(tdArr);
		
				//for(int i=0; i<tdArr.length; i++){
					//document.write(tdArr[i]);
				//}
				});
			});
				//삭제 버튼 누르면 삭제
			$("#delete").click(function(){
				console.log(tdArr);
				document.location = "deleteFestival.jsp?tdArr="+tdArr;
			});
				
			$('.btn').click(function(){
				
				console.log(this.value);
				
				$('#div2').load('festivalDetail.jsp?fname='+this.value);
				
			});
		});
</script>
</head>
<body>
	<p>홈 > 축제관리 > <a href="">축제목록보기</a></p>
	<h2>축제목록</h2>
	<div id="div1">
		<input type="button" id="delete" value="축제정보삭제">
		<input type="button" id="modify" value="축제정보수정" />
		<input type="button" id="insert" value="축제정보등록" />
	</div>
	<div id="div2">
		<table>
	   	 	<tr>
	   	 		<th class="col0"> <input type="checkbox" id="checkAll"></th>
		        <th class="col1">축제지역</th>
		        <th class="col2">축제이름</th>		        
		        <th class="col3">축제기간</th>
		        
	    	</tr>
	    	
	    	<%
	    	FestivalDAO dao = new FestivalDAO();
			ArrayList<FestivalVO> list = dao.selectFestival();
			
			for(FestivalVO vo : list){
			%>
	
			<tr>
				<td class="col0"><input type="checkbox" name="checkRow" class="checkRow"></td>
				<td class="col1"><%=vo.getLocation() %></td>
				<td class="col2">	
					<button class="btn" value="<%=vo.getFname() %> "><%=vo.getFname() %></button>
				</td>
				<td class="col3"><%=vo.getFdate() %> ~ <%=vo.getFdate1() %></td>
			</tr> 
			
			<%
			}
			%>
			
		</table>	    
	</div>

</body>
</html>