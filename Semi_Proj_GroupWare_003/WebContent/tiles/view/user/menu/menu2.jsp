<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker.css" />
<script type="text/javascript" src ="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src ="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/locales/bootstrap-datepicker.kr.min.js"></script>
</head>
<body>

menu - 2 body 검사 
<div class="well">
<input data-provide="datepicker" data-date-format="mm/dd/yyyy" >
</div>

<div class="well">
<div class="input-append date">
    <input type="text" value="12-02-2012">
    <span class="add-on"><i class="icon-th"></i></span>
</div>



</div>
<div class="input-daterange">
    <input data-provide="datepicker" type="text" class="input-small" value="2012-04-05" />
    <span class="add-on">to</span>
    <input data-provide="datepicker" type="text" class="input-small" value="2012-04-19" />
</div>
<div class="well">


</div>
<script type="text/javascript">
$('.datepicker').datepicker();
</script>
				
</body>
</html>
		