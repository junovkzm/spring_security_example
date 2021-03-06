<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Login Page</title>
</head>
<jsp:include page="/WEB-INF/views/include/jsInclude.jsp"></jsp:include> 
<script type="text/javascript">
$(document).ready(function (){
	
	$("#loginbtn").click(function(){
		if($("#loginid").val() == ""){
			alert("로그인 아이디를 입력해주세요");
			$("#loginid").focus();
		}else if($("#loginpwd").val() == ""){
			alert("로그인 비밀번호를 입력해주세요");
			$("#loginpwd").focus();
		}else{
			$("#loginfrm").submit();
		}
	});
		
});
</script>
<body onload='document.loginfrm.loginid.focus();'>
<h3>Login with Username and Password</h3>
<form id="loginfrm" name="loginfrm" method="POST" action="/j_spring_security_check">
<table>
   	<tr>
   		<td>아이디</td>
   		<td>
   			<input type="text" id="loginid" name="loginid" value="" />
   		</td>
   		<td rowspan="2">
   			<input type="button" id="loginbtn" value="확인" />
   		</td>
   	</tr>
   	<tr>
   		<td>비밀번호</td>
   		<td>
   			<input type="text" id="loginpwd" name="loginpwd" value="" />
   		</td>
   	</tr>
	<c:if test="${not empty param.fail}">
   	<tr>
   		<td colspan="2">
			<font color="red">
			<p>Your login attempt was not successful, try again.</p>
			<p>Reason: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
			</font>
			<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>
   		</td>
   	</tr>
   	</c:if>
</table>
</form>
</body>
</html>