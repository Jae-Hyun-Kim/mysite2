<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page contentType="text/html;charset=UTF-8" %>
<%-- <%
	String no = request.getParameter("no");
%>  --%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url="/views/include/header.jsp"></c:import>
		<div id="content">
			<div id="guestbook" class="delete-form">
				<form method="post" action="/mysite/guest">
					<input type="hidden" name="a" value="delete">
					<input type='hidden' name="no" value=${param.no}>
														<%-- <%=no%> --%>
					<label>비밀번호</label>
					<input type="password" name="password">
					<input type="submit" value="확인">
				</form>
				<a href="/mysite/guest">방명록 리스트</a>
			</div>
		</div>
		<c:import url="/views/include/navigation.jsp" ></c:import>
		<c:import url="/views/include/footer.jsp" ></c:import>
	</div>
</body>
</html>