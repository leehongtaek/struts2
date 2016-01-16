<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@page import="com.user.scheduler.vo.ScheduleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags" %>   <!-- struts tag 선언 -->
<script>
 $(function(){
	 
	  var currentLangCode = 'ko';
	  $('#calendar').fullCalendar('destroy');
	  $('#calendar').fullCalendar({
		   dragable:true,  //드래그앤 드랍 옵션
	       timeFormat: 'hh:mm', //시간 포멧
	       header: {
			     left: 'prev,next today',
			     center: 'title',
			     right: 'month,agendaWeek,agendaDay'
		      },
	    eventClick : function(calEvent,jsEvent,view){ //데이터 베이스에서도 이벤트 제거
	           var r=confirm("Delete " + calEvent.title);//+":"+calEvent._id);
		           if (r===true){
		        	   console.log(calEvent.start._i);
		        	   $.ajax({
		                	 type:"POST",
		                	 url:"event_delete",
		                	 
		                	 data:{sched_num:calEvent._id},//date : calEvent.start._i,sched_evnet : calEvent.title },
		                	 success: function() {console.log("deleted");}
		                 });//삭제 추가
		                 $('#calendar').fullCalendar('removeEvents', calEvent._id);
		                 
		                
		                 
		             }
	             },
	   defaultView: 'month',
	   editable: false,                                            
	   selectable: true,
	   selectHelper: true,
	   /*
	   dayClick:function(date, jsEvent, view) {//날짜 선택 메서드
		   
		   var urla = "scheduler_add?date="+date.format();
		   console.log(date.format());
		    goUrladd(urla);
		    
	   },*/
	   select: function(start, end, event) {//기간 선택 메서드
		   
		    var s_date = start.format();
		    var e_date=end.format();
		    console.log(s_date+"~"+e_date);
		    var urla = "scheduler_add?date="+s_date+"&edate="+e_date;
		    goUrladd(urla);

	   },
	   editable: true,
	   eventLimit: true,
	   events:function(start,end,timezone,callback) {
		   $.ajax({
		        	url:"event_controll",
		        	
		        	dataType: "json",
		        	success: function(list) {
		        		console.log("LOG "+list);
		                var events = [];
		                $.each(list,function(idx,dta) {
		                	console.log(dta.SCHED_CHECK);
		                	var col = 'blue';
		                	if(dta.SCHED_CHECK=='1'){
		                		col='red';
		                	}
		                    events.push({
		                        title: dta.SCHED_EVNET,//$(this).attr('title'),
		                        start: dta.SCHED_SOMEDAY, //$(this).attr('start') // will be parsed
		                        end:dta.SCHED_SOMEDAYEND,
		                        id:dta.SCHED_NUM,
		                        backgroundColor:col
		                    });
		                });
		                console.log(events);
		                callback(events);
		            }
		          });
		          
	   		}
	     
	  })
 });

 </script>
 
 <script>
 function goUrladd(url) {
	location=url;
}
 function modal_cont_ajax(d) {
	var params ="d="+d;
	$.ajax({
		url:"scheduler_add",
		data: params,
		success : function(data) {
			console.log(data);
		}
	});	
	return ;
}

	
</script>
	
	<div id='calendar'></div>
	
	
<!-- 
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			    
			      </div>
			      
			      <div class="modal-body">
				      <div class="mbody">
				       
				     </div>
			       	 <div>
			       	 <input type="text" id="new_sched">
			       	 <input type="button" value="새로운 일정 입력">
			       	 </div>
			      </div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			      </div>
			 
			    </div>
	  </div>
</div> -->

	