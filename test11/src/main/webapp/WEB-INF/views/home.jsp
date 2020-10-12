<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>
<%@ page import="or.gr.kr.vo.MemberInfo"%>

<%
Authentication auth = SecurityContextHolder.getContext().getAuthentication();

Object principal = auth.getPrincipal();	
String name = "";
String id = "";
if(principal != null && principal instanceof MemberInfo){
	name = ((MemberInfo)principal).getName();
	id = ((MemberInfo)principal).getId();
}
%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<sec:authorize access="isAnonymous()">
		로그인 하기전
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<%=name%>님 반갑습니다<br />
		<%=id%>님 반갑습니다<br />
		<a href="${ctx}/j_spring_security_logout">로그아웃</a>
	</sec:authorize>
	<sec:authorize access="hasRole('ADMIN')">
		<li>관리자 화면</li>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER')">
		<li>사용자 화면</li>
	</sec:authorize>
	<sec:authorize access="permitAll">
		<li>비회원 게시판</li>
	</sec:authorize>
	<sec:authorize access="hasAnyRole('USER', 'ADMIN')">
		<li>정회원 게시판</li>
	</sec:authorize>
</body>
</html>