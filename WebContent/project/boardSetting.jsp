<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardSetting.jsp</title>
<style type="text/css">
	p{
		font-size: 15px;
	}
	#div1{
		margin-left : 100px;
		width: 1400px;
		height : 30px;
		border :1px solid black;
		padding-bottom: 30px;
		marign-bottom: 10px;	
		padding-top: 0px;
	}

	#div2{
		padding-top : 40px;
		margin-left : 100px;
		margin-top : 1px;
		padding-bottom: 40px;
		width: 1400px;
		height : 100%;
		border :1px solid black;
		
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
	}
	
	th{
		padding: 2px;
		font-size: 15px;
		background-color: #C4DEFF;
		text-shadow: 2px 2px 2px #D5D5D5;
	}
	
	.col1{
		width: 15%;
		text-align: center;
	}
	
	.col2{
		width: 20%;
		text-align: center;
	}
	.col3{
		width: 20%;
		text-align: center;
	}
	
	.col4{
		width: 15%;
		text-align: center;
	}
	
	.col5{
		width: 30%;		
		text-align: center;
	}
	
	#div1 h3{
		padding: 1px 10px 50px 10px;
		margin-bottom: 20px;
		margin-left : 10px;
	}
</style>
</head>
<body>
	<p>홈> 게시판관리 > <a href="">게시판설정</a></p>
	<h2>게시판설정</h2>
	<div id="div1">
		<h3>게시판 목록</h3>
	</div>
	<div id="div2">
		<table>
	   	 	<tr>
		        <th class="col1">분류</th>
		        <th class="col2">게시판명</th>
		        <th class="col3">권한(쓰기/읽기)</th>
		        <th class="col4">새글/총갯수</th>
		        <th class="col5">게시물관리</th>
	    	</tr>
	    	
	    	<tr>
				<td class="col1">고객센터</td>
				<td class="col2"><a href="adminMain.jsp?fno=boardManage">공지사항</a></td>
				<td class="col3">관리자/비회원,회원</td>
				<td class="col4"></td>
				<td class="col5">
					<button id="btn">글보기</button>
					<button id="btn">글삭제</button>
					<button id="btn">공지글 등록</button>
				</td>
			</tr>
			
			<tr>
				<td class="col1">고객센터</td>
				<td class="col2"><a href="">Q&A</a></td>
				<td class="col3">회원/관리자</td>
				<td class="col4"></td>
				<td class="col5">
					<button id="btn">글보기</button>
					<button id="btn">글삭제</button>
					<button id="btn">공지글 등록</button>
				</td>
			</tr>
			
			<tr>
				<td class="col1">고객센터</td>
				<td class="col2"><a href="">FAQ</a></td>
				<td class="col3">관리자/회원</td>
				<td class="col4"></td>
					<td class="col5">
					<button id="btn">글보기</button>
					<button id="btn">글삭제</button>
					<button id="btn">공지글 등록</button>
				</td>
			</tr>
			
			<tr>
				<td class="col1">커뮤니티</td>
				<td class="col2"><a href="">동행찾아요</a></td>
				<td class="col3">회원/회원</td>
				<td class="col4"></td>
				<td class="col5">
					<button id="btn">글보기</button>
					<button id="btn">글삭제</button>	
					<button id="btn">공지글 등록</button>
				</td>
			</tr>
			
			<tr>
				<td class="col1">커뮤니티</td>
				<td class="col2"><a href="">상품후기</a></td>
				<td class="col3">회원/회원</td>
				<td class="col4"></td>
				<td class="col5">
					<button id="btn">글보기</button>
					<button id="btn">글삭제</button>
					<button id="btn">공지글 등록</button>
				</td>
			</tr>
			
			<tr>
				<td class="col1">커뮤니티</td>
				<td class="col2"><a href="">자유게시판</a></td>
				<td class="col3">회원/회원</td>
				<td class="col4"></td>
				<td class="col5">
					<button id="btn">글보기</button>
					<button id="btn">글삭제</button>
					<button id="btn">공지글 등록</button>
				</td>
			</tr>
			</table>
		</div> 
</body>
</html>