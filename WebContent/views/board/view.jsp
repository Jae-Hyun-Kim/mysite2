<%@page import="java.util.List"%>
<%@page import="com.bit2015.mysite.dao.BoardDao"%>
<%@page import="com.bit2015.mysite.vo.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 BoardVo vo =  (BoardVo)request.getAttribute("board");
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
			<div id="board" class="board-form">
				<table class="tbl-ex">
					<tr>
						<th colspan="2">글보기</th>
					</tr>
					<tr>
						<td class="label">제목</td>
						<td><%= vo.getTitle()%></td>
					</tr>
					<tr>
						<td class="label">내용</td>
						<td>
							<div class="view-content">
								<%= vo.getContent()%>
							</div>
						</td>
					</tr>
				</table>
				<div class="bottom">
					<a href="/mysite/board?a=list">글목록</a>
					<a href="/mysite/board?a=modify&bno=<%=vo.getNo()%>">글수정</a>
				</div>
			</div>
		</div>
		<div id="navigation">
			<ul>
				<li><a href="">안대혁</a></li>
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