<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
</head>
<body>
menu - 4 body 검사 
<script type="text/javascript">
$(docoment).ready(){
	CKEDITOR.replace( 'ckeditor' );
};


</script>
<div>
<textarea class="ckeditor" cols="1" id="editor1" name="editor1" rows="15"/>



</div>
</body>
</html>
		