<%@page import="java.util.List"%>
<%@page import="com.bit2015.mysite.dao.BoardDao"%>
<%@page import="com.bit2015.mysite.vo.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<BoardVo> list = (List<BoardVo>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<h1>MySite</h1>
			<ul>
				<li><a href="">로그인</a><li>
				<li><a href="">회원가입</a><li>
				<li><a href="">회원정보수정</a><li>
				<li><a href="">로그아웃</a><li>
				<li>님 안녕하세요 ^^;</li>
			</ul>
		</div>
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
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
					<tr>
						<td><%=list.get(i).getNo()%></td>
						<td><a href="/mysite/board?a=view&bno=<%=list.get(i).getNo()%>"><%=list.get(i).getTitle()%></a></td>
						<td><%=list.get(i).getMember_name()%></td>
						<td><%=list.get(i).getView_cnt()%></td>
						<td><%=list.get(i).getReg_date()%></td>
						<td><a href="" class="del">삭제</a></td>
					</tr>
				<%
 					}
 				%>		
				</table>
			
				
					<div class="bottom">
					<a href="/mysite/board?a=write" id="new-book">글쓰기</a>
				</div>				
			</div>
		</div>
		<div id="navigation">
			<ul>
				<li><a href="">김재현</a></li>
				<li><a href="">방명록</a></li>
				<li><a href="">게시판</a></li>
			</ul>
		</div>
		<div id="footer">
			<p>(c)opyright 2014 </p>
		</div>
	</div>
</body>
</html>