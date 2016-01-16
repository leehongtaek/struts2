<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->
<%@ taglib prefix="s" uri="/struts-tags"%><!-- struts tag 선언 -->

	<!-- 모듈 메뉴바 시작  -->
	<ul class="nav nav-pills nav-stacked list-group">
		<li><a href="#" data-toggle="collapse" data-target="#list1"
			aria-expanded="false" aria-controls="list1"
			class="list-group-item active collapsed"> HUMAN RESOURCE MANAGER MODE</a>
			<ul id="list1" class="nav collapse" aria-expanded="false">
				<li><a href="#" class="list-group-item"> 부서 관리 </a></li>
				<li><a href="#" class="list-group-item"> 회원 관리 </a></li>
				<li><a href="#" class="list-group-item"> 권한 관리 </a></li>
				<li><a href="#" class="list-group-item"> 인사 고과  관리 </a></li>
				<li><a href="#" class="list-group-item"> 블랙 리스트 관리   </a></li>
				<li><a href="#" class="list-group-item"> 출장 업무자 실시간  추적 관리   </a></li>
			</ul>
		</li>
	</ul>
	<!-- 모듈 메뉴바 끝  -->
	
	<!-- 모듈 메뉴바 시작  -->
	<ul class="nav nav-pills nav-stacked list-group">
		<li><a href="#" data-toggle="collapse" data-target="#list2"
			aria-expanded="false" aria-controls="list2"
			class="list-group-item active collapsed"> SECURITY MANAGER </a>
			<ul id="list2" class="nav collapse" aria-expanded="false">
				<li><a href="#" class="list-group-item"> 보고서 문서 열람 로그 </a></li>
				<li><a href="#" class="list-group-item"> 파일 다운로드 내역 조회  </a></li>
				<li><a href="#" class="list-group-item"> 사내망 채팅 내역 조회 </a></li>
				<li><a href="#" class="list-group-item"> 커뮤니티 내역 조회 </a></li>
				<li><a href="#" class="list-group-item">  </a></li>
				<li><a href="#" class="list-group-item">Menu4-5</a></li>
			</ul>
		</li>
	</ul>
	<!-- 모듈 메뉴바 끝  -->
	
	<!-- 모듈 메뉴바 시작  -->
	<ul class="nav nav-pills nav-stacked list-group">
		<li><a href="#" data-toggle="collapse" data-target="#list3"
			aria-expanded="false" aria-controls="list3"
			class="list-group-item active collapsed"> Performance Manager</a>
			<ul id="list3" class="nav collapse" aria-expanded="false">
				<li><a href="#" class="list-group-item"> 모듈별  속도 모니터링 </a></li>
				<li><a href="#" class="list-group-item"> 세션 관리자 </a></li>
				<li><a href="#" class="list-group-item"> 접속자 로그  </a></li>
				<li><a href="#" class="list-group-item"> 모니터링 관련 통계 </a></li>
				<li><a href="#" class="list-group-item"></a> ------  </li>
			</ul>
		</li>
	</ul>
	<!-- 모듈 메뉴바 끝  -->
	
	<!-- 모듈 메뉴바 시작  -->
	<ul class="nav nav-pills nav-stacked list-group">
		<li><a href="#" data-toggle="collapse" data-target="#list4"
			aria-expanded="false" aria-controls="list4"
			class="list-group-item active collapsed"> MODULE MANAGER  </a>
			<ul id="list4" class="nav collapse" aria-expanded="false">
				<li><a href="#" class="list-group-item"> TIMECARD MANAGER </a></li>
				<li><a href="#" class="list-group-item"> Contract MANAGER </a></li>
				<li><a href="#" class="list-group-item"> Scheduler MANAGER </a></li>
				<li><a href="#" class="list-group-item"> ROOM_RENT MANAGER </a></li>
				<li><a href="#" class="list-group-item"> Report MANAGER </a></li>
				
			</ul>
		</li>
	</ul>
	<!-- 모듈 메뉴바 끝  -->
	
	
	
	<ul class="list-group">
		<li class="list-group-item"><a href="#" class="list-group-item"
			data-toggle="collapse" data-target="#bookMenu"> MENU 5 <i
				class="glyphicon glyphicon-chevron-down"></i></a>
			<ul class="nav nav-stacked collapse in" id="bookMenu">
				<li><a class="list-group-item" href="#"> 리스트 1 <span
						class="badge badge-info">4</span></a></li>
				<li><a class="list-group-item" href="#"> 리스트 2</a></li>
			</ul></li>
	</ul>