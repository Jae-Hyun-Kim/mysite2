<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@page import="com.bit2015.mysite.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bit2015.mysite.dao.BoardDao"%>
<%@page import="com.bit2015.mysite.vo.BoardVo"%>
<%-- <%
BoardVo vo =(BoardVo)request.getAttribute("modify");
MemberVo mvo = (MemberVo)session.getAttribute("authUser");
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
	<c:import url="/views/include/header.jsp"></c:import>
		<div id="content">
			<div id="board">
				<form class="board-form" method="post" action="/mysite/board?a=update&bno=${modify.no}">
					<table class="tbl-ex">                               <%-- <%=vo.getNo()%> --%>
						<tr>
							<th colspan="2">글수정</th>
						</tr>
						<tr>
							<td class="label">제목</td>
							<td><input type="text" name="title" value="${modify.title}"></td>
						</tr>								<%-- <%=vo.getTitle()%> --%>
						<tr>
							<td class="label">내용</td>
							<td>
						<textarea id="content" name="content">${modify.content}</textarea>
							</td>						<%-- <%=vo.getContent()%> --%>
						</tr>
					</table>
					<div class="bottom">
						<a href="">취소</a>
					<%-- 	<%if (mvo !=null && mvo.getNo()==vo.getMember_no()) {%> --%>
					<c:if test ='${not empty authUser && authUser.no == modify.member_no}'>
						<input type="submit" value="수정">
					<%-- 	<% } %> --%>
					</c:if>
					</div>
				</form>				
			</div>
		</div>
	<jsp:include page="/views/include/navigation.jsp" flush="false"></jsp:include>
	<jsp:include page="/views/include/footer.jsp" flush="false"></jsp:include>
	</div>
</body>
</html>