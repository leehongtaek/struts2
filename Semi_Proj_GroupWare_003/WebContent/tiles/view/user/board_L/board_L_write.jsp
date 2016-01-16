<%-- 
    작업 날짜 : 2015. 10.20.
    구현 내용 :   이홍택 게시판 글쓰기 폼
  
  @author By kosta 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%>
<script src="resources/layout/js/common.js"></script>



	<form method="post" action="insert" id="f" class="j-forms">
		<div class="header">
			<h2>게시판 글쓰기</h2>
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
						name="board_title">
				</div>
				<br />

				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon2">이름</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2" value=" ${sessionScope.mem_name}">
					<span class="input-group-addon" id="sizing-addon2">부서</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2" value=" ${sessionScope.dept_num}">
					<span class="input-group-addon" id="sizing-addon2">직급</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2"
						value=" ${sessionScope.position_num}"> <span
						class="input-group-addon" id="sizing-addon2">메일주소</span> <input
						type="text" class="form-control" placeholder="from DB"
						aria-describedby="sizing-addon2"
						value=" ${sessionScope.mem_email}">
				</div>
			</div>
			<br />
			<div class="divider gap-bottom-25"></div>
			
			<!-- start textarea -->
			<div class="unit">
				<textarea name="board_content" id="board_content" class="form-control" rows="20"></textarea>
			</div>
			<script type="text/javascript">
					CKEDITOR.replace( 'board_content' );
			</script>
			<!-- end textarea -->

			<!-- start file -->
			<%-- <div class="unit">
				<label class="input append-big-btn"> 
				<label class="icon-left" for="file_input"> 
				<i class="fa fa-download"></i>
				</label>
					<div class="file-button">
						파일 업로드 <input type="file" name="file"
							onchange="document.getElementById('file_input').value = this.value;">
					</div> <br /> <input type="text" id="file_input" readonly=""
					placeholder="파일이 선택되지 않았습니다."> <span class="hint">고용량의
						파일은 압축을 하여 업로드 바랍니다.</span>
				</label>
			</div> --%>
			<!-- end file -->

		</div>
		<!-- end /.content -->
		<br />
		<div class="footer">
			<button type="submit" class="btn btn-primary" data-toggle="tooltip"
				data-placement="top" title="게시글을 등록합니다.">확인</button>



			<button type="button" class="btn btn-warning" data-toggle="tooltip"
				data-placement="top" onclick="goUrl('board_L_list')"
				title="작성을 취소하고 게시판 목록으로 돌아갑니다.">취소</button>

		</div>
		<!-- end /.footer -->
	</form>

	<%-- <script type="text/javascript">
		// form유효성 검사 이후 폼의 데이터를 전송하는 스크립트
		function sendForm() {
			// 여기서 나중에 지난 시간에 했던 유효성 검사
			document.getElementById("f").submit();
		}
		function goList(url, param) {
			if (!param)
				url = url;
			else
				url = url + "?" + param;
			location = url;
		}
	</script> --%>