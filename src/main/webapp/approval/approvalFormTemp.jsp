<%@page import="java.time.LocalDate"%>
<%@page import="vo.EmployeeVO"%>
<%@page import="vo.ApprovalVO"%>
<%@page import="dao.ApprovalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//approvalForm
	String data1 = request.getParameter("placeholder1");
	String data2 = request.getParameter("placeholder2");
	String data3 = request.getParameter("placeholder3");
	String data4 = request.getParameter("placeholder4");
	String contents = request.getParameter("contents");
	String title = request.getParameter("title");

	System.out.println(data1);
	System.out.println(data3);
	if(data3 == null || data3.equals("")||data1 == null || data1.equals("")||contents == null || contents.equals("")){
		 response.sendRedirect("approvalForm.jsp");
		
	}else{
		Object obj = session.getAttribute("vo");
		String name = null;
		String dname = null;
		String position = null;
		int num = 0;
		LocalDate now = LocalDate.now();
		if(obj != null){
		EmployeeVO vo0 = (EmployeeVO)obj;
		name = vo0.geteName();
		dname = vo0.getdName();
		position = vo0.geteOfficialResponsibilities();
		num = vo0.geteNumber();
		ApprovalDAO dao = new ApprovalDAO();
		ApprovalVO vo = new ApprovalVO();
		vo.setaName1st(data1);
		vo.setaName2nd(data3);
		vo.setaTitle(title);
		vo.setaContent(contents);
   		dao.addOne(vo0,vo);
		response.sendRedirect("approvalListTemporary.jsp"); 

			
		}
	}
	
%>