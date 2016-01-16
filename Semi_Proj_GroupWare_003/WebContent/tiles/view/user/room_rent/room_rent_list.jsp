<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 : list view
  
  @author By 유현주 
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->
<script type="text/javascript"
	src="<c:url value='/resources/layout/js/common.js'/>"></script>

<title>PAGE[room_rent_list] </title>

<script>

// booking시 roomname을 DB로부터 가져와 option으로 만들어줌 - value값으로 roomnum으로 가짐(ajax)

$(function(){
		var url = "room_name";
		$.ajax({
			url: url,
			success: function(args){
				var print = "<option> Select Name of Room </option>";
				$.each(JSON.parse(args),function(idx, item){
					print += "<option value="+item.room_num+">"+item.room_name+"</option>";
				});
				$('#room_num').html(print);
			},
			error: function(e){
				alert(e.responseText);
			}
		});
}); 

// booking시 roomname을 DB로부터 가져와 resource로 만들어줌(ajax)

$(function(){
	var url = "room_name";
	$.ajax({
		url: url,
		success: function(args){
			$.each(JSON.parse(args),function(idx, item){
				$('#calendar').fullCalendar(
					'addResource',
					{
						id: item.room_num,
						title: item.room_name
					},
					true // scroll to the new resource?
				); 
			});
		
		},
		error: function(e){
			alert(e.responseText);
		}
	});
});

// rent 내용 add 부분

$(function(){
	var url = "rent_list";
	$.ajax({ // 'removeEvents', calEvent._id
		url: url,
		success: function(args){
			$.each(JSON.parse(args),function(idx, item){
				var eventData = {
								title: item.rent_reason,
								start: item.rent_start,
								end: item.rent_end,
								id: item.rent_num,
								resourceId: item.room_num
							};
				$('#calendar').fullCalendar(
					'renderEvent',
					eventData,
					true
				);
			});
		
		},
		error: function(e){
			alert(e.responseText);
		}
	});
});

// calendar 부분

$(function() { // document ready
		
		var date = new Date();
		var y = parseInt(date.getFullYear());
		var m = parseInt(date.getMonth()+1);
		var d = parseInt(date.getDate());
		var today = y+"-"+m+"-"+d;
		
	  $('#calendar').fullCalendar({
		height: 500, // 세로 크기 조정
	    resourceAreaWidth: 230,
	    now: today,
	    editable: true,
	    dragable:true,
	    timeFormat: 'hh:mm',
	    aspectRatio: 1.50,
	    scrollTime: '07:00',
	    header: {
	      left: 'promptResource today prev,next',
	      center: 'title',
	      right: 'timelineDay,timelineThreeDays,agendaWeek,month'
	    },
	    defaultView: 'month',
	    views: {
	      timelineThreeDays: {
	        type: 'timeline',
	        duration: { days: 3 }
	      }
	    },
	    
	    selectable: true,
		selectHelper: true,
		select: function(start, end, event) { // 선택 날짜의 정보 가져오기(page 이동)
            var rent_start = start.format();
            console.log(rent_start);
            var urla = "room_rent_detail?rent_start="+rent_start;
            goUrl(urla);
   		},
		
	    editable: false,
		eventLimit: true, // allow "more" link when too many events
	    
		resourceLabelText: 'Rooms',
	    resourceRender:
	    function(resource, cellEls) {
			
	   	},
	    resources: 
	    [ // { id: 'b', title: 'Auditorium B', eventColor: 'green' }
	    ],
	    events: 
	    [ // { id: '5', resourceId: 'f', start: '2015-08-07T00:30:00', end: '2015-08-07T02:30:00', title: 'event 5' }
	    ]
	  });
	   
	});

</script>


<!-- 패널 시작 -->
<div class="panel panel-warning">
	<!-- 패널 헤드 시작 -->
	<div class="panel-heading">
		<h1><span class="glyphicon glyphicon-home" aria-hidden="true"> RESEVING SYSTEM </span></h1>
	</div>
	<!-- 패널 헤드 끝 -->
	<!-- 패널 바디 시작 -->
  	<div class="panel-body">
  	
	   	<!-- Button trigger modal -->
		<div class="row">
			<div class="col-sm-4" >
				<button type="button" class="btn btn-primary"
					data-toggle="modal" data-target="#booking">Booking</button>&nbsp;&nbsp; 
				<button type="button" class="btn btn-info"
					data-toggle="modal" data-target="#roomadd"><span class="glyphicon glyphicon-plus"> Room </span></button>
			</div>
		</div>
		<!--/. Button trigger modal End -->
		
	<!-- 패널 바디 끝 -->
  	</div>
</div>
<!-- 패널 끝 -->



<!-- calendar -->

<div id="calendar"></div>



<!-- Booking Modal Start -->

<div class="container-fluid">
	<div class="modal fade" id="booking" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Booking</h4>
				</div>
				
				<div class="modal-body">
					<form class="form-horizontal" action="rent_Insert" method="post" role="form">
						
						<!-- start rent_reason -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Purpose of Use : </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="rent_reason" name="rent_reason"
									placeholder="Purpose of Use">
							</div>
						</div>
						<!-- end rent_reason -->
						
						<!-- start date -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Start Date : </label>
							<div class="col-sm-6">
								<input type="datetime-local" class="form-control" id="rent_start"
								name="rent_start" placeholder="Start Date" required="required">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">End Date : </label>
							<div class="col-sm-6">
								<input type="datetime-local" class="form-control" id="rent_end"
								name="rent_end" placeholder="End Date" required="required">
							</div>
						</div>
						<!-- end date -->
						
						<!-- start room_num -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Select Name of Room : </label>
							<div class="col-sm-6">
								<select class="form-control" id="room_num" name="room_num"></select>
							</div>
						</div>
						<!-- end room_num -->
						<br>
						<div class="row">
							<div align="left" class="col-sm-6">
								<button type="submit" class="btn btn-primary">Booking</button>
								<button type="button" class="btn btn-default" data-dismiss='modal'>Close</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal End -->

<!-- Room Modal Start -->

<div class="container-fluid">
	<div class="modal fade" id="roomadd" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Room Add</h4>
				</div>
				
				<div class="modal-body">
					<form class="form-horizontal" action="room_Insert" method="post" role="form">
						
						<!-- start name -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Name of Room : </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="room_name" name="room_name"
									placeholder="Name of room">
							</div>
						</div>
						<!-- end name -->
						
						<!-- start location -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Location of Room : </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="room_loc" name="room_loc"
									placeholder="Location of Room">
							</div>
						</div>
						<!-- end location -->
						
						<!-- start Capacity -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="name">Capacity of people : </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="room_limit" name="room_limit"
									placeholder="Name of room">
							</div>
						</div>
						<!-- end Capacity -->
						
						<br>
						<div class="row">
							<div align="left" class="col-sm-6">
								<button type="submit" class="btn btn-primary">Add</button>
								<button type="button" class="btn btn-default" data-dismiss='modal'>Close</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal End -->