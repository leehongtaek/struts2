<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->
<title>EGWare Board</title>
<script src="resources/layout/js/common.js"></script>
<div class="panel panel-warning">
		<div class="panel-heading">
		<h2>칭찬합시다 게시판</h2>
		</div>
		<div class="panel-body">
			<div class="dropdown">
				<button class="btn btn-default dropdown-toggle" type="button"
					id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					카테고리 선택 <span class="caret"></span>
				</button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">칭찬합시다!</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">자유게시판</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">건의사항
						게시판</a></li>
			</ul>
			</div>
		</div>
</div>		

<!-- board table start-->
<div class="table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>게시물 번호</th>
				<th>제목</th>
				<th>사원코드</th>
				<th>조회수</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="list">
				<tr>
					<td><s:property value="board_num" /></td>
					<td><s:if test="#session.loginid == null">
						<a href="board_L_detail?board_num=${board_num}"> <s:property
							value="board_title" />
						</a>
						</s:if> <s:url action="view" id="goView">
							<s:param name="board_num" value="board_num" />
						</s:url></td>
					<td><s:property value="mem_code" /></td>
					<td><s:property value="board_hit" /></td>
					<td><s:property value="board_regdate" /></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
</div>
<!-- board table end-->

<!-- form start -->
<form method="post" action="board_L_list">
	<div class="form-inline">	
		<button class="btn btn-primary" type="button" onclick="goUrl('board_L_write')">
			<span class="glyphicon glyphicon-pencil">등록</span>
		</button>
	
		<select class="form-control" name="searchType">
				<option value="">선택</option>
				<option value="1">제목</option>
				<option value="2">내용</option>
		</select>
		<input name="searchValue" type="text" class="form-control">
		<button type="submit" class="form-control btn btn-default" >검색</button>
	</div>
</form>
<!-- form end -->

<!-- paging start -->
<div align="center">
	<ul class="pagination">
		<li><a href="board_L_list?currentpage=${pagingData.prev_pageno}">«</a></li>
		<c:forEach var="iter" begin="${pagingData.page_sno}" end="${pagingData.page_eno}">
		<li id="pagination"><a href="board_L_list?currentpage=${iter}"><b>${iter}</b></a></li>
		</c:forEach>
		<li><a href="board_L_list?currentpage=${pagingData.next_pageno}">»</a></li>
		</ul>
</div>
<!-- paging end -->
	



