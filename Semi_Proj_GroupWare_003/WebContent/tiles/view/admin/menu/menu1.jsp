<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->


<script>
	$(function() {
		$("#sortable").sortable();
		$("#sortable").disableSelection();
	});
</script>
<style>
#sortable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 450px;
}

#sortable li {
	margin: 3px 3px 3px 0;
	padding: 1px;
	float: left;
	width: 100px;
	height: 90px;
	font-size: 4em;
	text-align: center;
}
</style>

<script>
	$(function() {
		$("#sortable").sortable();
		$("#sortable").disableSelection();
	});
</script>
<style>
#sortable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 450px;
}

#sortable li {
	margin: 3px 3px 3px 0;
	padding: 1px;
	float: left;
	width: 100px;
	height: 90px;
	font-size: 4em;
	text-align: center;
}
</style>

<script>
	$(function() {
		$("#sortable").sortable();
		$("#sortable").disableSelection();
	});
</script>
<style>
#sortable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 450px;
}

#sortable li {
	margin: 3px 3px 3px 0;
	padding: 1px;
	float: left;
	width: 100px;
	height: 90px;
	font-size: 4em;
	text-align: center;
}
</style>
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
	<input type="text" name="date" id="date">

	<ul id="sortable">
		<li class="ui-state-default">1</li>
		<li class="ui-state-default">2</li>
		<li class="ui-state-default">3</li>
		<li class="ui-state-default">4</li>
		<li class="ui-state-default">5</li>
		<li class="ui-state-default">6</li>
		<li class="ui-state-default">7</li>
		<li class="ui-state-default">8</li>
		<li class="ui-state-default">9</li>
		<li class="ui-state-default">10</li>
		<li class="ui-state-default">11</li>
		<li class="ui-state-default">12</li>
	</ul>