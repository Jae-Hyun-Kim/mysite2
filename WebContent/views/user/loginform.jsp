<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page contentType="text/html;charset=UTF-8" %>
<%-- <%
	String result = request.getParameter("result");
%> --%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url="/views/include/header.jsp"></c:import>
		<div id="content">
			<div id="user">
				<form id="login-form" name="loginform" method="post" action="/mysite/member?a=login">
					<input type ="hidden" name="a" value="login">
					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" value="">
					<label class="block-label" >패스워드</label>
					<input name="password" type="password" value="">
					<%-- <%
					if("error".equals(result)){
					%> --%>
					<c:if test ='${"error"=="(param.result)"}'>
					<p>
					 로그인이 실패했습니다.
					 </p> 
			<%-- 		<%
					}
					%> --%>
					</c:if>
					<input type="submit" value="로그인">
				</form>
			</div>
		</div>
		<c:import url="/views/include/navigation.jsp" ></c:import>
		<c:import url="/views/include/footer.jsp" ></c:import>
	</div>
</body>
</html>