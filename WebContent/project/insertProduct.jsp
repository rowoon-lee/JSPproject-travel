<%@page import="java.util.ArrayList"%>
<%@page import="vo.TemaVO"%>
<%@page import="dao.TemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertProduct.jsp</title>
<style type="text/css">
	p{
		font-size: 15px;
	}
	table, tr, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	table{
		margin: 20px;
		margin-left : 50px;
		width: 900px;
		
	}
	#div1{
		margin-left : 300px;
		width: 1000px;
		height : 50px;
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
	.left{
		background-color: #C4DEFF;
		font-size : 15px;
		padding : 5px;
	}
	#te, #pn, #pr, #qt, #ca, #mainimg, #detailimg, #course{
		margin-left: 20px;
		font-size: 15px;
		margin-top: 8px;
		margin-bottom: 8px;
	}
	#course{
		width: 600px;
	}
	#ca {
      width: 600px;
      margin-right: 20px;
    }
	#pn{
      width: 400px;
    }
    #te, #pr, #qt{
      width: 150px;
	}
	#pr, #qt{
    width: 100px;
	}
	#insert{
	background-color: #C4DEFF;
    margin-left: 730px;
    margin-top: 70px;
    padding: 3px;
    width: 150px;
    height: 40px;
    font-size: 20px;
   }
  
	

</style>
</head>
<body>
<p>홈 > 상품관리 > <a href="">상품등록</a></p>
	<h2>상품등록</h2>
	<form action="insertOk.jsp" method="post" enctype="multipart/form-data">   <!-- form 태그는 정보를 name에 담아서 간다. -->
		<div id="div1">
			<h3>기본정보</h3>
		</div>
		<div id="div2">
			<table>
				<tr>
					<td class="left">상품분류</td>
					<td class="right">
			             <select name="tema" id="te">
		                   <option value="1">테마선택</option>
		                   <%
		                   	TemaDAO dao = new TemaDAO();
		                   	ArrayList<TemaVO> list = dao.selectTema();
		                   	
		                   for(TemaVO vo : list){
		                   %>
		                   <option value="<%=vo.getTname() %>"><%=vo.getTname() %></option>
		              	   <%
		                   }
		                   %>
		               </select><br>
		             </td>
				</tr>
				<tr>
					<td class="left">상품명</td>
					<td class="right"><input type="text" name="pname" id="pn" /></td>
				</tr>
				<tr>
					<td class="left">판매가</td>
					<td class="right"><input type="text" name="pprice" id="pr" /> (원)</td>
				</tr>
				<tr>
					<td class="left">QTY</td>
					<td class="right"><input type="text" name="qty" id="qt" /> (명)</td>
				</tr>
				<tr>
					<td class="left">상품요약설명</td>
					<td class="right"><input type="text" name="ca" id="ca" /></td>
				</tr>
				<tr>
					<td class="left">대표이미지</td>
					<td class="right"><input type="file" name="mainimg" id="mainimg" /></td>
				</tr>
				<tr>
					<td class="left">상세설명이미지</td>
					<td class="right"><input type="file" name="detailimg" id="detailimg" /></td>
				</tr>
				<tr>
					<td class="left">코스</td>
					<td class="right"><input type="text" name="course" id="course" /></td>
				</tr>				
			</table>
		</div>
	         <input type="submit" value="상품등록" id="insert"/> <!-- 내가 쓴 내용 submitForm으로 보내기 -->         
	</form>

</body>
</html>