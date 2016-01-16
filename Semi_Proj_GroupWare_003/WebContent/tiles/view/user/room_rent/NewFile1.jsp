<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->
<!-- Resoures 선언 -->
<link href="<c:url value='/resources/[필요한 CSS파일경로명]' />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/[필요한 JS파일경로명]'/>" ></script>

<title>PAGE[room_rent_list] </title>
- roomrent view

<script>
$(function() { // document ready
		
		var date = new Date();
		var y = parseInt(date.getFullYear());
		var m = parseInt(date.getMonth()+1);
		var d = parseInt(date.getDate());
		var today = y+"-"+m+"-"+d;
		console.log(today);
		
	  $('#calendar').fullCalendar({
	    resourceAreaWidth: 230,
	    now: today,
	    editable: true,
	    aspectRatio: 1.5,
	    scrollTime: '00:00',
	    header: {
	      left: 'promptResource today prev,next',
	      center: 'title',
	      right: 'timelineDay,timelineThreeDays,agendaWeek,month'
	    },
	    customButtons: {
	      promptResource: {
	        text: '+ room',
	        click: function() {
	          var title = prompt('Room name');
	           if (title) {
	            $('#calendar').fullCalendar(
	              'addResource',
	              { title: title },
	              true // scroll to the new resource?
	            );
	          } 
	        }
	      }
	    },
	    eventClick : function(calEvent, jsEvent, view){
			var r = confirm("Delete"+calEvent.title+":"+calEvent._id);
			if(r===true){ // '===' : 자료형까지 비교
				$('#calendar').fullCalendar('removeEvents', calEvent._id);
			}
		},
	    defaultView: 'timelineDay',
	    views: {
	      timelineThreeDays: {
	        type: 'timeline',
	        duration: { days: 3 }
	      }
	    },
	    resourceLabelText: 'Rooms',
	    resources: [
	      { id: 'a', title: 'Auditorium A' },
	      { id: 'b', title: 'Auditorium B', eventColor: 'green' },
	      { id: 'c', title: 'Auditorium C', eventColor: 'orange' },
	      { id: 'd', title: 'Auditorium D', children: [
	        { id: 'd1', title: 'Room D1' },
	        { id: 'd2', title: 'Room D2' }
	      ] },
	      { id: 'e', title: 'Auditorium E' },
	      { id: 'f', title: 'Auditorium F', eventColor: 'red' },
	      { id: 'g', title: 'Auditorium G' },
	      { id: 'h', title: 'Auditorium H' },
	      { id: 'i', title: 'Auditorium I' },
	      { id: 'j', title: 'Auditorium J' },
	      { id: 'k', title: 'Auditorium K' },
	      { id: 'l', title: 'Auditorium L' },
	      { id: 'm', title: 'Auditorium M' },
	      { id: 'n', title: 'Auditorium N' },
	      { id: 'o', title: 'Auditorium O' },
	      { id: 'p', title: 'Auditorium P' },
	      { id: 'q', title: 'Auditorium Q' },
	      { id: 'r', title: 'Auditorium R' },
	      { id: 's', title: 'Auditorium S' },
	      { id: 't', title: 'Auditorium T' },
	      { id: 'u', title: 'Auditorium U' },
	      { id: 'v', title: 'Auditorium V' },
	      { id: 'w', title: 'Auditorium W' },
	      { id: 'x', title: 'Auditorium X' },
	      { id: 'y', title: 'Auditorium Y' },
	      { id: 'z', title: 'Auditorium Z' }
	    ],
	    events: [
	      { id: '1', resourceId: 'b', start: today, end: today, title: 'event 1' },
	      { id: '2', resourceId: 'c', start: '2015-08-07T05:00:00', end: '2015-08-07T22:00:00', title: 'event 2' },
	      { id: '3', resourceId: 'd', start: '2015-08-06', end: '2015-08-08', title: 'event 3' },
	      { id: '4', resourceId: 'e', start: '2015-08-07T03:00:00', end: '2015-08-07T08:00:00', title: 'event 4' },
	      { id: '5', resourceId: 'f', start: '2015-08-07T00:30:00', end: '2015-08-07T02:30:00', title: 'event 5' }
	    ]
	  });
	  
	  
	  
	});
// 모달 창을 열어주는 함수

</script>

<div id="calendar" class="container">
</div>

<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  시설 예약
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">시설예약</h4>
      </div>
      
      <div class="modal-body">

		<form action="" method="" class="j-forms" novalidate>

			<div class="header">
				<p>Booking</p>
			</div>
			<!-- end /.header-->

			<div class="content">

				<!-- start name -->
				<div class="unit">
					<div class="input">
						<label class="icon-left" for="rent_reason">
							<i class="fa fa-user"></i>
						</label>
						<input type="text" id="rent_reason" name="rent_reason" placeholder="Reason">
					</div>
				</div>
				<!-- end name -->
				
				<!-- start rooms -->
				<div class="unit">
					<div class="input">
						<label class="icon-left" for="room_num">
							<i class="fa fa-users"></i>
						</label>
						<input type="text" placeholder="Number of rooms" id="room_num" name="room_num">
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