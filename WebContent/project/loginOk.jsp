
<%@page import="dao.P_MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");


	P_MemberDAO dao = new P_MemberDAO();
	
	int memno = dao.login(id, pw);
	
	
	//memno == -1이면 로그인 실패.
	if(memno == -1){
		out.println("로그인 실패");
	}else{
		//out.println("회원 번호 : " + memno);
		
		
		//String userId = URLEncoder.encode(id,"UTF-8");
		
		Cookie c = new Cookie("projectLogin",String.valueOf(memno));
		//c.setMaxAge(60*60*24); 	//하루동안 저장
		c.setPath("/");
		
		response.addCookie(c);
		response.sendRedirect("../abc/adminMain.jsp");
	}
%>
