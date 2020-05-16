<%@page import="java.util.ArrayList"%>
<%@page import="vo.P_MemberVO"%>
<%@page import="dao.P_MemberDAO"%>
<%@page import="vo.P_OrderVO"%>
<%@page import="dao.P_OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%
   /*페이징 처리*/
   //현재 페이지 얻어오기
   String cp = request.getParameter("cp");
   
   int currentPage = 0;
   
   if(cp!=null){
      currentPage = Integer.parseInt(cp);
   }else{   
      currentPage = 1;   //null이면 1페이지라도 보여주라는 의미.
   }	
   
   P_OrderDAO dao = new P_OrderDAO();
   
   //총 게시글 수 필요
   int totalCount = dao.getTotalCount();
   
   //한 페이지당 레코드 수 : 10개
   int recordByPage = 20;
   
   //총 페이지 수 *****
   int totalPage = 
      (totalCount/recordByPage==0)?totalCount/recordByPage:totalCount/recordByPage+1; 
      //=10단위로 나눠지면 몫을 출력하고 0이아니면(나머지가 나오면페이지 수를 1개 늘린다 나머지가 출력되도록)
   
   //현재 페이지 - 레코드 시작 번호
   int startNo = (currentPage-1)*recordByPage+1;   

   
   //현재페이지 - 레코드 끝 번호
   int endNo = currentPage*recordByPage;

%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>allOrderlist.jsp</title>
<style type="text/css">
   #div1{
      margin-left : 100px;
      width: 1400px;
      height : 50px;
      border :1px solid black;
      padding-bottom: 20px;
      marign-bottom: 10px;
      padding-top: 0px;
   }

   #div2{
      padding-top : 40px;
      padding-bottom : 40px;
      margin-left : 100px;
      margin-top : 1px;
      width: 1400px;
      height : 100%;
      border :1px solid black;
   }
   
   #div1 h3{
      padding: 1px 10px 30px 10px;
      margin-bottom: 20px;
      margin-left : 10px;
   }

   p{
      font-size: 15px;
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
      height: 35px;
      font-size: 15px;   
   }
   
   th{
      padding: 2px;
      font-size: 15px;
      background-color: #C4DEFF;
      text-shadow: 2px 2px 2px #D5D5D5;
   }
   .col0{
      width: 3%;
      text-align: center;
   }
   .col1{
      width: 17%;
      text-align: center;
   }
   
   .col2{
      width: 9%;
      text-align: center;
   }
   .col3{
      width: 10%;
      text-align: center;
   }
   
   .col4{
      width: 25%;
      text-align: center;
   }
   
   .col5{
      width: 10%;
      text-align: center;
   }
   
   .col7{
      width: 15%;
      text-align: center;
   }
   .col8{
      width: 10%;
      text-align: center;
   }
   #pagelist{
      text-align: center;
      height: 50px;
      
   }
   
   #page{
      width: 10px;
      margin: 0;
      padding: 2px;
      border: 1px solid gray;
      text-align: center;
   }


/* 
   #mainimg{
      display: inline;
      width: 100px;
      height: 80px;
      float: left;
      margin-right: 20px;
   } */
         
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
     
   });
      
</script>
</head>
<body>
   <p>홈 > 주문관리 > <a href="">전체주문목록</a></p>
   <h2>전체주문목록</h2>
   <div id="div1">
      <h3>주문목록</h3>
   </div>
   <div id="div2">
      <table>
             <tr>
                <th class="col0"><input type="checkbox" id="checkAll"></th>
              <th class="col1">예약일(결제일)</th>
              <th class="col2">예약번호</th>
              <th class="col3">예약자</th>
              <th class="col4">상품명</th>
              <th class="col5">결제금액</th>
              <th class="col7">결제상태</th>
              <th class="col8">여행일</th>
          </tr>
          
          <%
          ArrayList<P_OrderVO> list = dao.selectOrder(startNo, endNo);
          
          for(P_OrderVO vo : list){                
          %>
          <%
          int memno = vo.getMemno();
          
          P_MemberDAO dao1 = new P_MemberDAO();
          P_MemberVO vo1 = new P_MemberVO();
          vo1 = dao1.selectMid(memno);
          %>
          <tr>
            <td class="col0"><input type="checkbox" name="checkRow"></td>
            <td class="col1"><%=vo.getOdate() %> </td>
            <td class="col2"><%=vo.getOno() %> </td>
            <td class="col3"><%=vo1.getMid() %></td>
            <td class="col4"><%=vo.getPname() %> </td>
            <td class="col5"><%=vo.getPprice() %> </td>
            <td class="col7"><%=vo.getStatus() %> </td>
            <td class="col8"><%=vo.getTdate() %> </td>
         </tr> 
         <%
          }         
         %>
         <tr>
            <td colspan="8" id="pagelist">
            <%
               for(int i=1; i<totalPage+1; i++){   //i=currentPage-3 , i<=currentPage+3; 으로하면 선택한거 기준으로 3개씩보임
                  //i=1; i<totalPage; 하면 1번부터 전부~
                  if(i<=0){
                     continue;
                  }else if(i>totalPage+1){
                     break;
                  }else{
                  //1부터하면 다른 숫자의 페이지를 클릭해도 숫자가 사라지지않음
                  
            %>
            <a href="allOrderlist.jsp?cp=<%=i %>"><span id="page"><%=i %></span></a>
            <%
                  }//if end
               }//for end
            %>
            </td>
         </tr>
      </table>    
   </div>   
</body>
</html>