<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags" %>   <!-- struts tag 선언 -->
<!-- Resoures 선언 -->
<link href="<c:url value='/resources/[필요한 CSS파일경로명]' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/[필요한 JS파일경로명]'/>" ></script>

<title>PAGE[room_rent_detail] </title>


<div class="container">
<h2>Reserving Room List</h2>
  <p> 여러 예약된 목록중에 특정 정보를 가진 리스트를 출력 ? </p>                                                                                      
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
      	<th>#</th>
        <th>Purpose of Use</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Room Name</th>
        <th>Subscriber</th>
        <th>Modify</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
    	<s:iterator value="de_list" status="stat">
      <tr>
      	<td>${stat.count}</td>
        <td><s:property value="rent_reason" /></td>
        <td><s:property value="rent_start" /></td>
        <td><s:property value="rent_end" /></td>
        <td><s:property value="room_name" /></td>
        <td><s:property value="mem_name" /></td>
        <td><button type="button" class="btn btn-default btn-xs">수정</button></td>
        <td><button type="button" class="btn btn-danger btn-xs">삭제</button></td>
      </tr>
      </s:iterator>
    </tbody>
    <tfoot>
    	<form  action="#" method="get">
	    	<div class="form-group"> 
		    	<div class="col-sm-1">
					<select name="searchType" class="form-control input-md">
						<option value="">선택</option>
						<option value="1">목적</option>
						<option value="2">예약내용</option>
						<option value="3">예약자이름</option>
					</select>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<input  class="form-control input-md" name="searchValue" type="text">
						<span class="input-group-btn">
							<button type="submit" class="btn btn-primary">검색</button>
							</span>
					</div>
				</div>
	    	</div>
    	</form>
    </tfoot>
  </table>
  </div>
</div>
