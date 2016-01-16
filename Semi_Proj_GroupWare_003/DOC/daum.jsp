<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
	function chkId() {
		var idv = document.getElementById("id").value;
		var url = "*.kosta?cmd=result&id=" + idv;
		sendRequest(url, null, res, "get");
	}
	function res() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var res = xhr.responseText;
				res = parseInt(res, 10);
				result(res);
			} else {
				alert("실패" + xhr.status);
			}
		}
	}

	function result(num) {
		if (num == 1) {
			alert("중복된 아이디 입니다.");
		} else {
			alert("사용해도 되는 아이디 입니다.");
		}
	}

	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('roadAddress').value = fullRoadAddr;
						document.getElementById('jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>
</head>
<body>
	<div id="wrap">
		<form method="post" action="*.kosta">
			<input type="hidden" name="cmd" value="memadd">
			<table>
				<tr>
					<td>아이디</td>
					<!--  select count(*) cnt from mem where id=?
								IdCheckAction에서 아이디값을
								request로 받아서
								MemDao로 전달한 후
								public int findID(String id) {
								select count(*) cnt from mem where id=?
								.........
								}
								반환한 값을 idchkRes.jsp로
								1이면 존재합니다. 0이면 사용가능합니다로 표현하게하고
								이 값을 Ajax의 callback에서
								div의 아이디가 res로 전달해서 출력하면 끝 -->
					<td><input type="text" name="id" id="id"> <input
						type="button" value="중복체크" onclick="chkId()">
						<div id=res></div></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd" id="pwd"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="post" name="post"
						placeholder="우편번호"> <input type="button"
						onclick="execDaumPostcode()" value="우편번호 찾기"><br></td>
				</tr>
				<tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="roadAddress" name="roadAddress"
						placeholder="도로명주소"> <input type="text" id="jibunAddress"
						name="jibunAddress" placeholder="지번주소"> <span id="guide"
						style="color: #999"></span></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="가입"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>