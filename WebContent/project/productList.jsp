<%@page import="java.util.ArrayList"%>
<%@page import="vo.TripVO"%>
<%@page import="dao.TripDAO"%>
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
   
   TripDAO dao = new TripDAO();
   
   //총 게시글 수 필요
   int totalCount = dao.getTotalCount();
   
   //한 페이지당 레코드 수 : 10개
   int recordByPage = 10;	
   
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
<title>productList.jsp</title>
<style type="text/css">
   #div1{
      margin-left : 100px;
      width: 1400px;
      height : 30px;
      border :1px solid black;
      padding-bottom: 20px;
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
      font-size: 15px;   
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
      width: 5%;
      text-align: center;
   }
   
   .col2{
      width: 7%;
      text-align: center;
   }
   .col3{
      width: 35%;
      padding-left: 15px;
   }
   
   .col4{
      width: 7%;
      text-align: center;
   }
   
   .col5{
      width: 5%;
      text-align: center;
   }
   
   .col6{
      width: 24%;
      text-align: center;
   }
   .col7{
      width: 12%;
      text-align: center;
   }

   
   #mainimg{
      display: inline;
      width: 100px;
      height: 80px;
      float: left;
      margin-right: 20px;
   }
   
   #delete{
    margin-left: 20px;
    margin-top: 10px;
    padding: 3px;
    width: 70px;
    height: 30px;
    font-size: 15px;
    background-color: #FFFDF9;
    
   }
   #modify{
   margin-left: 20px;
    margin-top: 10px;
    padding: 3px;
    width: 70px;
    height: 30px;
    font-size: 15px;
    background-color: #FFFDF9;
   }
   
   #insert{
   margin-left: 1100px;
    margin-top: 10px;
    padding: 3px;
    width: 70px;
    height: 30px;
    font-size: 15px;
    background-color: #FFFDF9;
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
   .bt{
      font-size: 14px;
      margin-top: 10px;
      background-color: white;
      border: none;
      border-bottom: 1px solid black;
      
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
          location.href="adminMain.jsp?fno=insertProduct";
       });
   
       
      var tdArr = new Array();   //td 값을 담음
       //상단 선택버튼 클릭시 체크된 Row의 값을 가져옴
      $(".checkRow").click(function(){
         var rowData = new Array();   //행의 값을 담음
         var checkbox = $("input[type=checkbox]:checked"); //체크된 체크박스를 담음
       
         checkbox.each(function(i){   //체크된 체크박스를 가져옴
          var tr = checkbox.parent().parent().eq(i);
          var td = tr.children();   
      //    console.log(tr);
          
          //체크된 row의 모든 값을 배열에 담음
          rowData.push(tr.text());
         console.log(td.eq(1));
          //td.eq(0)은 체크박스, td.eq(1)은 상품번호, td.eq(2)는 테마명......
          var pno = td.eq(1).text();
          console.log(pno); 
          tdArr.push(pno);
         //console.log(tdArr);

         //for(int i=0; i<tdArr.length; i++){
            //document.write(tdArr[i]);
         //}
          });
      });
         //삭제 버튼 누르면 삭제
      $("#delete").click(function(){
         console.log(tdArr);
         document.location = "deleteProduct.jsp?tdArr="+tdArr;
      });
         
      $('.bt').click(function(){
         
         console.log(this.value);
         
         $('#div2').load('productDetail.jsp?pno='+this.value);
         
      });
   });

</script>
</head>
<body>
   <p>홈 > 상품관리 > <a href="">상품목록</a></p>
   <h2>상품목록</h2>
   <div id="div1">
      <input type="button" id="delete" value="상품삭제">
      <input type="button" id="modify" value="상품수정" />
      <input type="button" id="insert" value="상품등록" />
   </div>
   <div id="div2">
      <table>
             <tr>
                <th class="col0"> <input type="checkbox" id="checkAll"></th>
              <th class="col1">상품번호</th>
              <th class="col2">테마</th>
              <th class="col3">상품명</th>
              <th class="col4">상품가격</th>
              <th class="col5">제한인원</th>
              <th class="col6">코스</th>
              <th class="col7">상품등록일</th>
          </tr>
          
          <%
         ArrayList<TripVO> list = dao.getAllData(startNo, endNo);         
         for(TripVO vo : list){
            
         %>
         <tr>
            <td class="col0"><input type="checkbox" name="checkRow" class="checkRow" ></td>
            <td class="col1"><%=vo.getPno() %></td>
            <td class="col2"><%=vo.getTema() %></td>
            <td class="col3"><img src="<%=vo.getMainimg() %>" alt="" id="mainimg"/>
               <button class="bt" value="<%=vo.getPno()%>"><%=vo.getPname() %></button>
            </td>
            <td class="col4"><%=vo.getPprice() %></td>
            <td class="col5"><%=vo.getQty() %></td>
            <td class="col6"><%=vo.getCourse() %></td>
            <td class="col7"><%=vo.getPdate() %></td>
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
            <a href="productList.jsp?cp=<%=i %>"><span id="page"><%=i %></span></a>
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