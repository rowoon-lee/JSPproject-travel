<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	body {	
	  font-style: "나눔스퀘어_ac";
	}
	
	#logo{
		margin-left: 800px;
		width: 300px;	
		height: 90px;
	}	
	#img{
		width: 15px;
		height: 15px;
	}
  #top {
  	
    width: 100%;
    height: 150px; 
    position: fixed;
    top : 0;	
    left: 0; 	
    right: 0;
    
  }
  
	 #top1{
	 	background-color: #C4DEFF;
		width: 100%;
		height: 30px;	
	 }
	 
	 #top2{
	 	background-color: white;
	 	width: 100%;
	 	height: 90px;
	 }
	 
	 #top3{
	 	background-color: #C4DEFF;
	 	width: 100%;
	 	height: 30px;
	 }

  #direct{
    margin-left: 1600px;
    text-decoration: none;  
    font-size: 18px;
    marign-top : 0px;
    padding-top: 0px;	
  }

  #admin{
    text-decoration: none;
    font-size: 18px;
    color: black;
    border: none;
    background: none;
    text-align: left;
    margin-left: 30px; 

    
  }

.sidenav {	
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 80px;
  left: 0;
  background-color: #C4DEFF;
  overflow-x: hidden;	
  margin-top : 70px;
}

.sidenav a, .dropdown-btn {
  padding: 10px 10px 10px 20px;
  text-decoration: none;
  font-size: 15px;
  color: black;
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

.sidenav a:hover{
  color: blue;
}
.dropdown-btn:hover {
	background-color: white;
}

.main {
  margin-left: 190px; 
  font-size: 20px; 
  margin-top :120px;
  padding-top : 20px;
  padding-left : 20px;
  margin-bottom: 90px;
}

.dropdown-container {
  display: none;
  background-color: white;
  padding-left: 8px;
}

.fa-caret-down {
  float: right;
  padding-right: 8px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logo").on('click', function(){
			$(location).attr("href", "adminMain.jsp");
		});
		
	});
</script>
</head>
<body>

	<%
	String pname = "";
	
	String fno = request.getParameter("fno"); //request사용해도 충분
		
	if(fno==null){
			pname ="main.jsp"; 
	}else{
		pname = fno + ".jsp";
	}
	
	%>

	

  <div id="top">
  	<div id="top1">
  		<a href="../teamproject/main.jsp" id="direct">사이트 바로가기</a>
	    <a href="login.jsp" id="admin">로그아웃</a>
	     	 

  	</div>
  	<div id="top2">
	    <img src="../travelimg/mainLogo3.png" alt="" id="logo"/>
    </div>
    <div id="top3">
    </div>
  </div>
  
	<div class="sidenav">
	   <button class="dropdown-btn">
	   		<img src="https://image.flaticon.com/icons/png/128/1570/1570888.png" alt="" id="img"/> 상품관리 
	      <i class="fa fa-caret-down"></i>
	    </button>
	    <div class="dropdown-container">
	      <a href="adminMain.jsp?fno=insertProduct">상품등록</a>
	      <a href="adminMain.jsp?fno=productList">상품목록</a>
	      <a href="adminMain.jsp?fno=productTema">상품테마관리</a>
	    </div>
	    
	    <button class="dropdown-btn">
	    	<img src="https://image.flaticon.com/icons/png/128/1760/1760379.png" alt="" id="img"/> 축제관리
	      <i class="fa fa-caret-down"></i>
	    </button>
	    <div class="dropdown-container">
	      <a href="adminMain.jsp?fno=insertFestival">축제정보등록</a>
	      <a href="adminMain.jsp?fno=festivalList">축제목록</a>
	    </div>		
	    <button class="dropdown-btn">
	    	<img src="https://image.flaticon.com/icons/png/128/1170/1170678.png" alt="" id="img"/> 주문관리
	      <i class="fa fa-caret-down"></i>
	    </button>	
	    <div class="dropdown-container">
	      <a href="adminMain.jsp?fno=allOrderlist">전체주문목록</a>
	      <a href="adminMain.jsp?fno=orderChangeList">주문진행상태</a>	
	    </div>	
	    
	    
	    <button class="dropdown-btn">
	    	<img src="https://image.flaticon.com/icons/png/128/1875/1875565.png" alt="" id="img"/> 고객관리
	      <i class="fa fa-caret-down"></i>
	    </button>
	    <div class="dropdown-container">
	      <a href="adminMain.jsp?fno=memberList">회원목록</a>	
	    </div>
	    	
	    <button class="dropdown-btn">
	    	<img src="https://image.flaticon.com/icons/png/128/684/684831.png" alt="" id="img"/> 게시판관리 
	      <i class="fa fa-caret-down"></i>
	    </button>
	    <div class="dropdown-container">
	      <a href="adminMain.jsp?fno=boardSetting">게시판 설정</a>
	      <a href="#">고객센터 관리</a>
	      <a href="#">커뮤니티 관리</a>
	    </div>
	     <button class="dropdown-btn">
	     	<img src="https://image.flaticon.com/icons/png/128/1077/1077976.png" alt="" id="img"/> 통계분석 
	      <i class="fa fa-caret-down"></i>
	    </button>	
	    <div class="dropdown-container">
	      <a href="#">매출 분석</a>
	      <a href="#">상품 분석</a>
	    </div>
	   
	
	 </div>

  <div class="main">
    <jsp:include page="<%=pname %>"></jsp:include>

  </div>

<script>
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } else {
  dropdownContent.style.display = "block";
  }
  });
}
</script>




</body>
</html> 