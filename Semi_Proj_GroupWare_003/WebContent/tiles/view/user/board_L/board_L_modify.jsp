<%-- 
    작업 날짜 : 2015. 10.20.
    구현 내용 :   이홍택 게시판 글쓰기 폼
  
  @author By kosta 
--%>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<!-- Your META here -->
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0"
	name="viewport">
<!-- Stylesheets -->
<link rel="stylesheet" href="j-folder/css/demo.css">
<link rel="stylesheet" href="j-folder/css/font-awesome.min.css">
<link rel="stylesheet" href="j-folder/css/j-forms.css">
<!-- Scripts -->
<script src="j-folder/js/jquery.1.11.1.min.js"></script>
<!--[if lt IE 10]>
			<script src="j-folder/js/jquery.placeholder.min.js"></script>
		<![endif]-->
</head>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- struts tag 선언 -->
<!-- Resoures 선언 -->
<link href="<c:url value='/resources/[필요한 CSS파일경로명]' />"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<c:url value='/resources/[필요한 JS파일경로명]'/>"></script>
<div class="wrapper wrapper-640">
	<script src="resources/layout/js/common.js"></script>


	<form method="post" action="board_L_modify?cmd=update" id="f" class="j-forms">
		<div class="header">
			<h2>게시글 수정</h2>
			<br />
		</div>
		<!-- end /.header-->

		<div class="content">
			<!-- start name email -->
			<div class="j-row">
				<!-- start subject -->
				<div class="input-group">
					<span class="input-group-addon">제목</span> <input type="text"
						class="form-control" placeholder="제목을 입력하세요."
						aria-describedby="sizing-addon2" id="board_title"
						name="board_title" value="${vo.board_title}">
				</div>
				<br />

				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon2">이름</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2" value=" ">
					<span class="input-group-addon" id="sizing-addon2">부서</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2" value="">
					<span class="input-group-addon" id="sizing-addon2">직급</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2"
						value=" "> <span
						class="input-group-addon" id="sizing-addon2">메일주소</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2"
						value="">
				</div>
			</div>
			<br />
			<div class="divider gap-bottom-25"></div>

			<!-- start textarea -->
			<div class="unit">
				<textarea class="form-control" rows="25" name="board_content" >${vo.board_content}</textarea>
			<input type="hidden" value="${vo.board_num}" name="board_num" id="board_num">
			<script type="text/javascript">
					CKEDITOR.replace( 'board_content' );
			</script>
			</div>
			<!-- end textarea -->

		
		</div>
		<!-- end /.content -->
		<br />
			<div class="footer">
				<button class='btn btn-info' data-toggle="tooltip" type="submit"
					data-placement="top" >수정</button>
				<a  class='btn btn-danger' role="button" href="board_L_modify?cmd=delete&board_num=${vo.board_num}" >삭제<a>
				<button type="button" class="btn btn-primary" data-toggle="tooltip"
					data-placement="top" title="게시판 목록으로 돌아갑니다."
					onclick="goUrl('board_L_list')">목록으로</button>


			</div>
			<!-- end /.footer -->
	</form>


</div>