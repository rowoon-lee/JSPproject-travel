<%@page import="vo.TripVO"%>
<%@page import="dao.TripDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- insertOk.jsp -->
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertOk.jsp</title>

 
 <%
/*
	String tema = request.getParameter("te");
	String pname = request.getParameter("pn");
	int pprice = Integer.parseInt(request.getParameter("pp"));
	int qty = Integer.parseInt(request.getParameter("qt"));
	String pcontentsa = request.getParameter("pa");
	String pcontentsb = request.getParameter("pb");
	String pimg = request.getParameter("pi");
*/ 
 
 //upload directory
 String saveDir = request.getRealPath("productimg");
  //parameter ==> 데이터를 보내는거. 
 
 
  //첨부파일 최대크기 => kb(1024) 단위
  int maxFileSize = 1024*1024*10; //10MB
        
  //cos 사용 - 클래스 호출
  //MultipartRequest(요청객체, 저장디렉토리, 최대 파일크기, 인코딩타입, 동명파일처리규정 객체)
  MultipartRequest mr =
  			  new MultipartRequest(request, saveDir, maxFileSize,  "UTF-8", new DefaultFileRenamePolicy());
  	//요청객체가 들어있는 Multipart 객체로 브라우저에게 요청해서 확인. 
 	String tema = mr.getParameter("tema");
	String pname = mr.getParameter("pname");
	int pprice = Integer.parseInt(mr.getParameter("pprice"));
	int qty = Integer.parseInt(mr.getParameter("qty"));
	String pcontents = mr.getParameter("ca");

	String mainimg = mr.getOriginalFileName("mainimg");
	String detailimg = mr.getOriginalFileName("detailimg");

	String course = mr.getParameter("course");
	String pdate = mr.getParameter("pdate");

	//DB에 연결 후 insertOk.jsp에서 전달해온 값을 저장
	TripDAO dao = new TripDAO();
	TripVO vo = new TripVO();
	
	vo.setTema(tema);
	vo.setPname(pname);
	vo.setPprice(pprice);
	vo.setQty(qty);
	vo.setPcontents(pcontents);
	vo.setMainimg("../productimg/" + mainimg);
	vo.setDetailimg("../productimg/" +detailimg);
	vo.setCourse(course);
	vo.setPdate(pdate);

	//넘겨온 데이터를 vo에 담아서 전달
	dao.insertData(vo);	
	
	//DB에 저장이 되면 main.jsp로 화면 이동
	response.sendRedirect("adminMain.jsp");

 %>
 </body>
</html>
 	