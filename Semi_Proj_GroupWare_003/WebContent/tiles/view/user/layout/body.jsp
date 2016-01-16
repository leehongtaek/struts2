<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->
<style>
.gridster * {
	margin: 0;
	padding: 0;
}

ul {
	list-style-type: none;
}

/*/
/* gridster
/*/
.gridster ul {
	background-color: #EFEFEF;
}

.gridster li {
	font-size: 1em;
	font-weight: bold;
	text-align: center;
	line-height: 100%;
}

.gridster {
	margin: 0 auto;
	opacity: .8;
	-webkit-transition: opacity .6s;
	-moz-transition: opacity .6s;
	-o-transition: opacity .6s;
	-ms-transition: opacity .6s;
	transition: opacity .6s;
}

.gridster .gs-w {
	background: #DDD;
	cursor: pointer;
}

.gridster .player {
	background: #BBB;
}

.gridster .preview-holder {
	border: none !important;
	background: red !important;
}
</style>
<script type="text/javascript">




</script>
<script type="text/javascript" id="code">
var gridster;
$(function() {

gridster = $(".gridster > ul").gridster({
	widget_margins : [ 0, 0 ],
	widget_base_dimensions : [ 50, 50 ]
}).data('gridster');
			
			
			
var Limit_Time =( (new Date('2015-12-29').getTime()) - (new Date().getTime()) ) / 1000;
$('.countdown').ClassyCountdown({
	theme: "flat-colors-very-wide",
	end: ($.now()+Limit_Time) // 남은 시간 
});
			               
			
});
</script>

<div class="row">
		<div class="col-sm-12">
			<div class="well well-lg">
				<h2>KOSTA 108ST E-GORUP EasyWare</h2>
			</div>	
		</div>
		<div class="col-sm-12">
			<div class="well well-lg">
				<h3> 지금까지 남은 시간 ?  </h3> 
				<div class="countdown">
				</div>
			</div>
		</div>
		
</div>
	

	<!--/row-->

