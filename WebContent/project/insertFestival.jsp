<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertFestival.jsp</title>
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
	.left{
		width: 20%;
		background-color: #C4DEFF;
		font-size : 15px;
		padding : 5px;
	}
	#location, #fname, #fimg, #fdate{
		margin-left: 20px;
		font-size: 15px;
		margin-top: 8px;
		margin-bottom: 8px;
	}
	
	#fdate1{
		font-size: 15px;
		margin-top: 8px;
		margin-bottom: 8px;
	}
	
	#fname{
		width: 300px;
	}
	#button{
	background-color: #C4DEFF;
    margin-left: 700px;
    margin-top: 70px;
    padding: 3px;
    width: 150px;
    height: 40px;
    font-size: 20px;
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
	

</style>

</head>
<body>
<p>홈 > 축제관리 > <a href="">축제정보등록</a></p>
	<h2>축제정보등록</h2>
	<form action="festivalOk.jsp" method="post" enctype="multipart/form-data">   <!-- form 태그는 정보를 name에 담아서 간다. -->
		<div id="div1">
				<h3>기본정보</h3>
		</div>
		<div id="div2">
			<table>
				<tr>
					<td class="left">축제지역</td>
					<td class="right">
						<select name="location" id="location">
		                   <option value="지역선택">지역선택</option>
		                   <option value="강원도">강원도</option>
		                   <option value="경기도">경기도</option>
		                   <option value="경상남도">경상남도</option>
		                   <option value="경상북도">경상북도</option>
		                   <option value="전라북도">전라북도</option>
		                   <option value="전라남도">전라남도</option>
		                   <option value="제주도">제주도</option>
		                   <option value="충청도">충청도</option>
		                   
		                   
		               </select>
		             </td>
				</tr>
				<tr>
					<td class="left">축제명</td>
					<td class="right"><input type="text" name="fname" id="fname" /></td>
				</tr>
				<tr>
					<td class="left">상세설명이미지</td>
					<td class="right"><input type="file" name="fimg" id="fimg" /></td>
				</tr>
				<tr>
					<td class="left">축제기간</td>
					<td class="right"><input type="date" name="fdate" id="fdate" /> ~ <input type="date" name="fdate1" id="fdate1" /></td>
				</tr>
			</table>
		</div>
			
         <input type="submit" value="축제정보등록" id="button"/> <!-- 내가 쓴 내용 submitForm으로 보내기 -->         

	
	</form>

</body>
</html>