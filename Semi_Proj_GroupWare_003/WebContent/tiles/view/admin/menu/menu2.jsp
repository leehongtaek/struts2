<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title"> MEMBER MANAGER LIST</h3>
	</div>
	<div class="panel-body">
		<h3> 페이지 기능 내용 </h3>
		<pre>
	구현 컨셉  :::: 	 	
		현재 이 페이지는 사원들의 현 상태를 보고 관리자 모드에서 사원이
		그룹웨어에 등록했을때 승인이나 각종 회원의 정보를 수정하고 
		조회 할수 있도록 하는 페이지이다.
		</pre>
		
	</div>
</div>

<hr>
<table class="table table-striped table-hover ">
	<thead>
		<tr>
			<th>#</th>
			<th>MEMBER CODE</th>
			<th>MEMBER DEPARTMENT </th>
			<th>MEMBER POSITION</th>
			<th>MEMBER HIREDATE </th>
			<th>MEMBER STATE </th>
			<th>수정</th>
			<th>상세보기</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
		</tr>
		<tr>
			<td>2</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
			
		</tr>
		<tr class="info">
			<td>3</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
		</tr>
		<tr class="success">
			<td>4</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
		</tr>
		<tr class="danger">
			<td>5</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
		</tr>
		<tr class="warning">
			<td>6</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
		</tr>
		<tr class="active">
			<td>7</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>	
		</tr>
	</tbody>
</table>