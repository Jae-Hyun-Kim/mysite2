<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@page import="java.util.List"%>
<%@page import="com.bit2015.mysite.dao.GuestBookDao"%>
<%@page import="com.bit2015.mysite.vo.GuestBookVo"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%-- <%
	List<GuestBookVo> list = (List<GuestBookVo>) request
			.getAttribute("list");
%> --%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/guestbook.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div id="container">
	<c:import url="/views/include/header.jsp"></c:import>
		<div id="content">
			<div id="guestbook">
				<form action="/mysite/guest" method="post">
					<input type="hidden" name="a" value="insert">
					<table>
						<tr>
							<td>바보</td>
							<td><input type="text" name="name"></td>
							<td>비밀번호</td>
							<td><input type="password" name="pass"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="content" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
				<ul>
					<li>
						<%-- <%
							for (int i = 0; i < list.size(); i++) {
						%> --%>
					<c:forEach items='${list}' var='vo' varStatus='status'>
						<table width=510 border=1>
							<tr>
								<%-- <%=i + 1%> --%>
								<td>${status.index+1}
								</td>
								<%-- <%=list.get(i).getName()%> --%>
								<td>${vo.name}</td>
								<%-- <%=list.get(i).getDate()%> --%>
								<td>${vo.date}</td>
								<td><a
									href="/mysite/guest?a=deleteform&no=${vo.no}">삭제</a></td>
														<%-- <%=list.get(i).getNo()%> --%>
							</tr>
							<tr>
								<td colspan=4>${vo.message}</td>
								<%-- <%=list.get(i).getMessage()%> --%>
							</tr>
						</table><%--  <%
 	}
 %> --%> 
 					</c:forEach>
 						<br>
					</li>
				</ul>
			</div>
		</div>
		<c:import url="/views/include/navigation.jsp" ></c:import>
		<c:import url="/views/include/footer.jsp" ></c:import>
	</div>
</body>
</html>