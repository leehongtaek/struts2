<%-- 
    작업 날짜 : 2015. 10. 19.
    구현 내용 :   
  
  @author By kosta 
--%>
<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags" %>   <!-- struts tag 선언 -->

<title>PAGE[scheduler_add] </title>
<script>
function goUrlchk(id_num) {
	$.ajax({
		 type:"POST",
    	 url:"event_chk",
    	 
    	 data:{sched_num:id_num},
    	 success: function() {console.log("check:::"+id_num);},
    	 error: function() {console.log("check:::"+id_num);}
	});
	location="scheduler_list";
	
	//location="scheduler_add?date="+$('#date').val()+"&edate="+$('#edate').val();
}


</script>

<div>
	<table>
		<thead>
			<tr>
				<td><%=request.getParameter("date")%>~<%=request.getParameter("edate")%></td><!--  -->
				
				<td>일정추가</td>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="list">
					<tr>
						<td><s:property value="sched_evnet"/> </td>
						<s:if test="sched_check.equals('1')">
							<td>
								계획 달성
							</td>
						</s:if>
						<s:else>
							<td>
								계획 미달성
							</td>
						</s:else>
						
						<td><input type="button" id="<s:property value="sched_num"/>" name="<s:property value="sched_num"/>" 
						value="완료" onclick="goUrlchk(<s:property value="sched_num"/>)"/> </td>
						
					</tr>
			</s:iterator>
		</tbody>
		<tfoot>
			<tr>
				<td>
					<form action="scheduler_insert" method="post">
						<input type="hidden" value="<%=session.getAttribute("mem_code")%>" id="mem_code" name="mem_code">
						<input type="hidden" value="<%=request.getParameter("date")%>" id="date" name="date" >
						<input type="hidden" value="<%=request.getParameter("edate")%>" id="edate" name="edate" >
						<input type="text" id="sched_input" name="sched_input">
						<input type="submit" value="새로운 일정 추가">
					</form>
				</td>
			</tr>
		</tfoot>
	</table>
</div>
