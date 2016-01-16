<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<table class="table">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
		</tr>
			
	</thead>
	<tbody>
		<c:forEach items="${list}" var="data">
		<tr>
			<td>${data.id}</td>
			<td>${data.name}</td>
		</tr>
		</c:forEach>
	</tbody>
	<tfoot>
	</tfoot>
</table>
</body>
</html>
		