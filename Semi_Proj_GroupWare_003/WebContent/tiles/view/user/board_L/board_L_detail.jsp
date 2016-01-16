<%-- 
    작업 날짜 : 2015. 10.20.
    구현 내용 :   이홍택 게시판 글쓰기 폼
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->
<link rel="stylesheet" href="j-folder/css/demo.css">
<link rel="stylesheet" href="j-folder/css/font-awesome.min.css">
<link rel="stylesheet" href="j-folder/css/j-forms.css">
<!-- Scripts -->
<script type="text/javascript" >
function goUrl(url) {
	location= url;
}
</script>
<script src="j-folder/js/jquery.1.11.1.min.js"></script>
<div class="wrapper wrapper-640">

	
		<div class="dropdown">
			<button class="btn btn-default dropdown-toggle" type="button"
				id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
				카테고리 선택 <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">게시판1</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">게시판2</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">게시판3</a></li>
			</ul>
		</div>
		<div class="header">
			<h2>게시판</h2>
			<br />
		</div>
		<!-- end /.header-->

		<div class="content">

			<!-- start name email -->
			<input class="form-control" type="text" readonly placeholder=${vo.board_title}><br />
			<div class="input-group">

				<span class="input-group-addon" id="sizing-addon2">이름</span> <input
					type="text" class="form-control" placeholder="from DB"
					aria-describedby="sizing-addon2" readonly> <span
					class="input-group-addon" id="sizing-addon2">부서</span> <input
					type="text" class="form-control" placeholder="from DB"
					aria-describedby="sizing-addon2" readonly> <span
					class="input-group-addon" id="sizing-addon2">직급</span> <input
					type="text" class="form-control" placeholder="from DB"
					aria-describedby="sizing-addon2" readonly> <span
					class="input-group-addon" id="sizing-addon2">메일주소</span> <input
					type="text" class="form-control" placeholder="from DB"
					aria-describedby="sizing-addon2" readonly>
			</div>
		</div>
		<div class="divider gap-bottom-25"></div>
		<br />
		<!-- start textarea -->
		<div class="unit">
			<textarea class="form-control" rows="25" id="board_content" name="board_content" readonly>${vo.board_content}</textarea>
		</div>
		<script type="text/javascript">
					CKEDITOR.replace( 'board_content' );
		</script>
		<!-- end textarea -->
		<br />
</div>
<!-- end /.content -->

<div class="footer">
	<button  class='btn btn-info' type="button" onclick="goUrl('board_L_modify?cmd=list&board_num=${vo.board_num}')">수정</button>
	<!-- <button  class='btn btn-danger'>삭제</button> -->
	<button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="게시판 목록으로 돌아갑니다." onclick="goUrl('board_L_list')" >목록으로</button>

</div>
<!-- end /.footer -->

