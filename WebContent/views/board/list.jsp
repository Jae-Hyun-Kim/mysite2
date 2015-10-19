<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@page import="com.bit2015.mysite.vo.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="com.bit2015.mysite.dao.BoardDao"%>
<%@page import="com.bit2015.mysite.vo.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
MemberVo vo = (MemberVo)session.getAttribute("authUser");
List<BoardVo> list = (List<BoardVo>)request.getAttribute("list");
%> --%>

<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
	<jsp:include page="/views/include/header.jsp"  flush="false"></jsp:include>
		<div id="content">
			<div id="board">
				<form id="search_form" action="" method="post">
					<input type="text" id="kwd" name="kwd" value="">
					<input type="submit" value="찾기">
				</form>
			
				<table class="tbl-ex">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>				
		
				<c:forEach items='${list}' var='vo'>
					<tr>
						<td>${vo.no}</td>
						<td><a href="/mysite/board?a=view&bno=${vo.no}">${vo.title}</a></td>
						<td>${vo.member_name}</td>
						<td>${vo.view_cnt}</td>
						<td>${vo.reg_date}</td>
						<td>
						
					
						<c:if test='${not empty authUser && authUser.no == vo.member_no}'> 
						<%-- <% if(vo != null && vo.getNo()==list.get(i).getMember_no()){ %> --%>
						<a href="/mysite/board?a=delete&bno=${vo.no}<%-- <%=list.get(i).getNo()%> --%>" class="del">삭제</a>
						<%-- <%}%> --%>
						</c:if>
						</td>
					</tr>
			
 				</c:forEach>	
				</table>
			
					<%-- <% if(vo != null){ %> --%>
					<c:if test='${not empty authUser}'>
					<div class="bottom">
					<a href="/mysite/board?a=write" id="new-book">글쓰기</a>
				</div>
				<%-- <%}%>	 --%>
				</c:if>			
			</div>
		</div>
	
	<jsp:include page="/views/include/navigation.jsp" flush="false"></jsp:include>
	<jsp:include page="/views/include/footer.jsp" flush="false"></jsp:include>
	</div>
</body>
</html>