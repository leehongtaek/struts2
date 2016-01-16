<%-- 
    작업 날짜 : 2015. 10. 20.
    구현 내용 :   
  
  @author By KOSTA 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags" %>   <!-- struts tag 선언 -->
<!-- Resoures 선언 -->
<link href="<c:url value='/resources/[필요한 CSS파일경로명]' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/[필요한 JS파일경로명]'/>" ></script>

<title>PAGE - MENU [NAME] </title>
<script>
jQuery(document).ready(function($) {
	
    $('#modaladd').modal('toggle');
});
</script>
<div class="modal-fade" id="modaladd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">시설예약</h4>
      </div>
      
      <div class="modal-body">

		<form action="" method="" class="j-forms" novalidate>

			<div class="header">
				<p>Room</p>
			</div>
			<!-- end /.header-->

			<div class="content">

				<!-- start name -->
				<div class="unit">
					<div class="input">
						<label class="icon-left" for="room_name">
							<i class="fa fa-user"></i>
						</label>
						<input type="text" id="room_name" name="room_name" placeholder="Name">
					</div>
				</div>
				<!-- end name -->
				
				<!-- start rooms -->
				<div class="unit">
					<div class="input">
						<label class="icon-left" for="room_loc">
							<i class="fa fa-users"></i>
						</label>
						<input type="text" placeholder="Number of rooms" id="room_loc" name="room_loc">
						<span class="tooltip tooltip-left-top">How many rooms do you need (approximately)</span>
					</div>
				</div>
				<!-- end rooms -->
				
				<!-- start date -->
				<div class="j-row">
					<div class="span6 unit">
						<div class="input">
							<label class="icon-left" for="date_from">
								<i class="fa fa-calendar"></i>
							</label>
							
							<input id="datepicker" placeholder="Check-in date" type="date" data-provide="datepicker" data-date-format="yyyy/mm/dd" >
						</div>
					</div>
					<div class="span6 unit">
						<div class="input">
							<label class="icon-left" for="date_to">
								<i class="fa fa-calendar"></i>
							</label>
							<input id="datepicker" placeholder="Check-out date" type="date" data-provide="datepicker" data-date-format="yyyy/mm/dd" >
						</div>
					</div>
				</div>
				<!-- end date -->
				
		<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Booking</button>
     	</div>
				
		</form>
      </div>
    </div>
  </div>
</div>
