
<%@page import="vo.MailVO"%>
<%@page import="dao.MailDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mail_writeOk.jsp</title>
</head>
<body>
 <%

	//	1. 파라미터값 가져오기
			//작성자 writer  e_number
			request.setCharacterEncoding("UTF-8");
			
			String writer = request.getParameter("writer");
 			int intWriter = Integer.parseInt(writer);
 
 			//수신자 reciver  e_number2
			String reciver = request.getParameter("reciverId");
 			int intReciver = Integer.parseInt(reciver);
 			
 			//제목 
 			String title =  request.getParameter("title");
 			//내용
			String contents =  request.getParameter("contents");
			//첨부파일 -> 일단패스
			String file =  request.getParameter("file");
			//참조인
			String cc =  request.getParameter("cc");
			
			String mBoard = "받은 메일함";
			
			//편지함상태는 일단 패스
			
			
	if(writer == null || title == null || contents == null || writer.equals("") || title.equals("") || contents.equals("") ){
				System.out.println("널값");
			}else{
				MailDAO dao = new MailDAO();			   	
			   	MailVO vo= new MailVO();
			   	
			   	
			   	vo.setMTitle(title);
			   	vo.setMContent(contents);
			   	vo.setMFile(file);
			   	vo.setMCc(cc);
				vo.setMBoard(mBoard);							   
			   	vo.setENumber(intWriter);
			   	vo.setENumber2(intReciver);
			   	
			   	
			   	dao.writeMail(vo);
			   	
			}
			
         response.sendRedirect("mail_layOut.jsp");
 %>	
 
</body>
</html>