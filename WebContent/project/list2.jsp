<%@page import="vo.QnABoardVO"%>
<%@page import="dao.QnABoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String cp = request.getParameter("cp");

	int currentPage = 0;
	
	if(cp!=null){
		currentPage = Integer.parseInt(cp);
	}else{
		currentPage = 1;
	}
	
	QnABoardDAO dao = new QnABoardDAO();
	QnABoardVO vo1 = new QnABoardVO();
	int totalCount = dao.getTotalCount();
	
	int recordByPage = 7;
	
	int totalPage = (totalCount/recordByPage==0)?totalCount/recordByPage:totalCount/recordByPage+1;
	
	int startNo = (currentPage-1)*recordByPage+1;
	int endNo = currentPage*recordByPage;
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	#listdiv1{
		width : 1000px;
		height: 100%;
		float : left;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		margin-left: 30px;
		margin-bottom:10px;
	}
	
	#qnaTable{
		width : 1200px;
		margin : 0 auto;
		border-collapse: separate;
		border-spacing: 2px;
		font-size: 13px;
   		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
	}
	
	#qnaTable, #qnaTable tr, #qnaTable th, #qnaTable td{
		border-top : 1px black solid;
		border-bottom : 1px black solid;
		border-collapse: collapse;
		font-size: 15px;
	}
	
	#qnaTable th, #qnaTable td{
		height : 10px;
		padding-top: 5px;
		padding-bottom: 5px;
	}
	
	
	#list_col1{
		width : 10%;
		text-align: center;
	}

	#list_col2{
		width : 50%;
	}
	
	#list_col3{
		width : 15%;
		text-align: center;
	}
	
	#list_col4 {
		width : 15%;
		text-align: center;
	}
	
	#list_col5{
		width : 10%;
		text-align: center;
	}
	
	.btn{
		padding-left : 770px;
	}
	
	#searchbox{
		position : relative;
		float : right;
	}
	
	.qnalistbutton{
		background: white;
		border : 0px;
		font-family: '나눔스퀘어_ac Light';
		font-weight: bold;
		font-size: 15px;
		cursor: pointer;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
</head>
<body>
	<div>
		<div id="listdiv1">
			<table id="qnaTable">
				<tr>
					<th id="list_col1">번호</th>
					<th id="list_col2">제목</th>
					<th id="list_col3">작성자</th>
					<th id="list_col4">작성일</th>
					<th id="list_col5">조회수</th>
				</tr>
			<%
			ArrayList<QnABoardVO> list = dao.getAllData(startNo, endNo);
			for(QnABoardVO vo : list){
			%>
				<tr>
					<td id="list_col1"><%=vo.getBno() %></td>
					<td id="list_col22">
					<% 
					
					String pw1 = vo.getBpassword();
					
					if(pw1==null){
						
					%>
					<button id="bt" value="<%=vo.getBno()%>" class="qnalistbutton"><%=vo.getBtitle() %></button>
					
					<%
					
					}else if(pw1!=null){
						
					%>
					<button id="bt1" value="<%=vo.getBno()%>" class="qnalistbutton">[비밀글]<%=vo.getBtitle() %></button>

					<%
					}
					%>
					
					</td>
					<td id="list_col3"><%=vo.getMname() %></td>
					<td id="list_col4"><%=vo.getBregdate() %></td>
					<td id="list_col5"><%=vo.getBhits() %></td>
				</tr>
				<%
				}
				%>
				<tr>
					<td colspan="5">
						<%
							for(int i = currentPage-4; i<=currentPage+5; i++){
								if(i<=0){
									continue;
								}else if(i>totalPage){
									break;
								}else{
						%>
						<a href="../abc/qna_boardlist.jsp?cp=<%=i %>"><span id="list_page"> <%=i %></span></a>			
						<%
								}//if end
						}//for end
						%>
					</td>
				</tr>					
			</table>


	</div>
</body>
<%
QnABoardVO vo = new QnABoardVO();
String pw1 = vo.getBpassword();
if(pw1==null){
	
%>

<script type="text/javascript">
	
	
	$('#bt').click(function(){
		var bno = this.value;
		$('#listdiv1').load('../abc/qna_board/detail.jsp?bno='+bno);
	});
	
	$('#bt1').click(function(){
		var bno = this.value;
		$('#listdiv1').load('../abc/qna_board/passwordcheck.jsp?bno='+bno);
		
	});
	
	$('#bt2').click(function(){
		$('#listdiv1').load("../abc/qna_board/write.jsp");
	});

</script>
<%
}
%>
</html>