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
<script type="text/javascript">
$(document).ready(function(){
	$('#datepicker').Datepicker();
});

</script>

<html>

<title>Booking form</title>

<body class="bg-pic">
	<div class="wrapper wrapper-640">

		<form action="" method="" class="j-forms" novalidate>

			<div class="header">
				<p>Booking</p>
			</div>
			<!-- end /.header-->

			<div class="content">

				<!-- start name -->
				<div class="unit">
					<div class="input">
						<label class="icon-left" for="name">
							<i class="fa fa-user"></i>
						</label>
						<input type="text" id="name" name="name" placeholder="Name">
					</div>
				</div>
				<!-- end name -->

				<!-- start email phone -->
				<div class="j-row">
					<div class="span6 unit">
						<div class="input">
							<label class="icon-left" for="email">
								<i class="fa fa-envelope-o"></i>
							</label>
							<input type="email" placeholder="Email" id="email" name="email">
						</div>
					</div>
					<div class="span6 unit">
						<div class="input">
							<label class="icon-left" for="phone">
								<i class="fa fa-phone"></i>
							</label>
							<input type="text" placeholder="Phone" id="phone" name="phone">
						</div>
					</div>
				</div>
				<!-- end email phone -->

				<div class="divider gap-bottom-25"></div>

				<!-- start rooms -->
				<div class="unit">
					<div class="input">
						<label class="icon-left" for="rooms">
							<i class="fa fa-users"></i>
						</label>
						<input type="text" placeholder="Number of rooms" id="rooms" name="rooms">
						<span class="tooltip tooltip-left-top">How many rooms do you need (approximately)</span>
					</div>
				</div>
				<!-- end rooms -->

				<!-- start guests -->
				<div class="j-row">
					<div class="span6 unit">
						<div class="input">
							<label class="icon-left" for="adults">
								<i class="fa fa-male"></i>
							</label>
							<input type="text" placeholder="Adult guests" id="adults" name="adults">
							<span class="tooltip tooltip-left-top">Number of adult guests</span>
						</div>
					</div>
					<div class="span6 unit">
						<div class="input">
							<label class="icon-left" for="children">
								<i class="fa fa-female"></i>
							</label>
							<input type="text" placeholder="Children guests" id="children" name="children">
							<span class="tooltip tooltip-left-top">Number of children</span>
						</div>
					</div>
				</div>
				<!-- end guests -->
				
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

				<div class="divider gap-bottom-25"></div>

				<!-- start message -->
				<div class="unit">
					<div class="input">
						<textarea placeholder="Your questions and comments..." spellcheck="false" name="message"></textarea>
					</div>
				</div>
				<!-- end message -->

			</div>
			<!-- end /.content -->

			<div class="footer">
				<button type="submit" class="primary-btn">Booking</button>
			</div>
			<!-- end /.footer -->

		</form>
	</div>

	<!-- Scripts -->
	<script src="j-folder/js/jquery.1.11.1.min.js"></script>
	<script src="j-folder/js/jquery.ui.min.js"></script>
	<script src="j-folder/js/jquery.maskedinput.min.js"></script>

	<!--[if lt IE 10]>
			<script src="j-folder/js/jquery.placeholder.min.js"></script>
		<![endif]-->

	<script>
		$(document).ready(function(){

			// Phone masking
			$("#phone").mask('(999) 999-9999', {placeholder:'x'});

			// Popup time interval
			$(function() {
				$( "#date_from" ).datepicker({
					dateFormat: 'mm/dd/yy',
					prevText: '<i class="fa fa-caret-left"></i>',
					nextText: '<i class="fa fa-caret-right"></i>',
					onClose: function( selectedDate ) {
						$( "#date_to" ).datepicker( "option", "minDate", selectedDate );
					}
				});
				$( "#date_to" ).datepicker({
					dateFormat: 'mm/dd/yy',
					prevText: '<i class="fa fa-caret-left"></i>',
					nextText: '<i class="fa fa-caret-right"></i>',
					onClose: function( selectedDate ) {
						$( "#date_from" ).datepicker( "option", "maxDate", selectedDate );
					}
				});
			});

		});
	</script>
</body>
</html>