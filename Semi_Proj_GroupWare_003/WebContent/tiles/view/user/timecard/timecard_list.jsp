<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :  TIME CARD LIST 를 구현함 
  
  @author By Byeong Gi Kim 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags" %>   <!-- struts tag 선언 -->	
<META http-equiv="Cache-Control" content="No-Cache"> 
<script type="text/javascript" src="<c:url value='/resources/layout/js/common.js'/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	var d = new Date();
	    d = d.toLocaleDateString(); // 브라우저의 현재 시간을 가져옴
	$('#todayinfo').html(" 오늘 날짜 : "+d);
});

// ==========================  JQUERY AJAX START=============================
var seleced_Day; // 사용자가 선택한 날짜
function etcdataLoad(day) { // 비고 정보를 가져온다
	seleced_Day = day;
	
	$.ajax({
		type : "POST",
		url : "timecard_update",
		data : {
			cmd : 'etc_data',
			selectedDay : seleced_Day,
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(result, status, xhr) {
			// 서버로부터 성공후 결과를 다시 모달의 TEXTAREA의 값을 변경
			console.log(result);
			$('#etc_modal_textArea').val(result);
		}

	});		
	
}


var resText;
function ajax_etc(){
	resText=$('#etc_modal_textArea').val(); // 비고의 변경사항을 업데이트 한다.
	$.ajax({
		type : "POST",
		url : "timecard_update",
		data : {
			cmd : 'etc',
			selectedDay : seleced_Day,
			tcetc : resText 
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
			console.log(resultData);
			
		}

	});	
	window.location.reload(true);
}	





function ajax_goout_start(){ // 외출 시간 시작 업데이트
	$.ajax({
		type : "POST",
		url : "timecard_update",
		data : {
			cmd : 'tcgoout_start'
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
			
			
		}

	});	
	window.location.reload(true);
}	


function ajax_goout_end(){ // 외출 시간 끝  업데이트
	$.ajax({
		type : "POST",
		url : "timecard_update",
		data : {
			cmd : 'tcgoout_end'
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
			
		}

	});	

	window.location.reload(true);
}	


function ajax_tcwork_end(){ // 퇴근 시간 업데이트
	$.ajax({
		type : "POST",
		url : "timecard_update",
		data : {
		cmd : 'tcwork_end'
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(resultData) {
			
		}

	});	

	window.location.reload(true);
}	
//==========================  JQUERY AJAX END=============================
</script>
<title>PAGE[timecard] </title>

<!-- 패널 시작 -->
<div class="panel panel-success">
	<!-- 패널 헤드 시작 -->
	<div class="panel-heading">
	
		<!-- 날짜 표시부  시작-->
		<h1><span class="glyphicon glyphicon-time" aria-hidden="true"> TIMECARD</span></h1>
		<span id="todayinfo">Today</span>&nbsp; <br>
		<!--날짜 표시부  끝-->
	</div>
	<!-- 패널 헤드 끝 -->
	<!-- 패널 바디 시작 -->
  	<div class="panel-body">
	   	<button class="btn btn-info" type="button" onclick="ajax_tcwork_end()">퇴근</button>
		<button class="btn btn-info" type="button" onclick="ajax_goout_start()">외출시작</button>
		<button class="btn btn-info" type="button" onclick="ajax_goout_end()">외출종료</button> <br>

	<!-- 패널 바디 끝 -->
  	</div>
</div>
<!-- 패널 끝 -->

<div class="table-responsive"> 
<!-- TIME CARD START -->
<div class="form-group">
	<table class="table table-hover table-striped table-condensed">
		<thead>
			<tr>
				<th>날짜</th>
				<th>출근</th>
				<th>퇴근</th>
				<th>외출 시작</th>
				<th>외출 종료</th>
				<th colspan="2">상태/비고</th>			
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="timecard_data">
			<tr>
			<td>${timecard_data.day}</td>
			<td>${timecard_data.tcwork_start}</td>
			<td>${timecard_data.tcwork_end}</td>
			<td>${timecard_data.tcgoout_start}
			<td>${timecard_data.tcgoout_end}</td>
			<td>
			<c:if test="${timecard_data.tc_state =='Y'}">
		    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
		    </c:if>
			<c:if test="${timecard_data.tc_state ==null}">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
			</c:if>				
		  	</td>
			<td>
			<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#etcModal" 
					onclick="etcdataLoad('${timecard_data.day}')" >	
		  	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		  	</button>
		  	</td>
			</tr>
			</c:forEach>
			</tbody>
	</table>
			
	
		


</div>
<!--/. table-responsive  -->

</div>
<!-- TIME CARD END -->
<!-- TIME CARD PAGING START -->
	<div align="center">
		<ul class="pagination">
			<li><a href="timecard_list?currentpage=${pagingData.prev_pageno}" >«</a></li>
				<c:forEach var="iter" begin="${pagingData.page_sno}" end="${pagingData.page_eno}">
				<li id="pagination"><a href="timecard_list?currentpage=${iter}" ><b>${iter}</b></a></li>
				</c:forEach>
				<li><a href="timecard_list?currentpage=${pagingData.next_pageno}">»</a></li>
			</ul>
	</div>
<!-- /.TIME CARD PAGING END -->	




<!-- ETC Modal Start-->
<div class="modal fade" id="etcModal" tabindex="-1" role="dialog" aria-labelledby="etcModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="etcModalLabel"> 비고 사항 </h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="control-label"></label>
            <textarea class="form-control" id="etc_modal_textArea" cols="5" rows="5"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="etcSave" onclick="ajax_etc()" class="btn btn-primary" data-dismiss="modal">Save</button>
      </div>
    </div>
  </div>
</div>
<!-- 비고 Modal End-->
