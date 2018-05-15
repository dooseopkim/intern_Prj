<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/user/user.css">
<link rel="stylesheet" href="/css/user/login.css">
<script src="/js/user/login.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
</head>
<body>
	<jsp:include page="../userMenu.jsp" />
	<nav class="fh5co-nav" role="navigation">
	<div class="container-wrap">
		<div class="top-menu">
			<div class="row">
				<div class="col-xs-2">
					<div id="fh5co-logo">
						<a href="main.do">人Turn</a>
					</div>
				</div>
				<div class="col-xs-10 text-right menu-1">
					<ul>
						<li class=""><a href="main.do">홈</a></li>
						<li class="has-dropdown"><a href="intro1.do">소개</a>
							<ul class="dropdown">
								<li><a href="intro1.do">사업소개</a></li>
								<li><a href="intro2.do">서비스소개</a></li>
							</ul></li>
						<li><a href="mentor.do">멘토찾기</a></li>
						<li><a href="mentee.do">멘티찾기</a></li>
						<li><a href="freeBoard.do">자유게시판</a></li>
						<li class="has-dropdown"><a href="#">이용안내</a>
							<ul class="dropdown">
								<li><a href="#">자주 묻는 질문</a></li>
								<li><a href="csBoard.do">고객서비스</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</nav>

		<div class="page-login">
			<!-- 로그인 창 -->
			<div class="row">
				<h2 class="login-h2">회원 로그인</h2>
				<div class="col-sm-6 box-login">
					<form action="" method="post">
						<fieldset>
							<!-- <legend>로그인</legend> -->
							<label for="loginId" class="invisible">아이디</label>
							<input type="text" name="loginId" id="loginId" placeholder="아이디" title="아이디 입력">
							<label for="password" class="invisible">비밀번호</label>
							<input type="password" name="password" id="password" placeholder="비밀번호" title="비밀번호 입력">
							<input type="button" id="btn_login" class="btn btn-outline-success" value="로그인">
						</fieldset>
					</form>
				</div>

				<!-- 카카오/네이버 로그인 -->
				<div class="col-sm-6 box-snsLogin">
					<form name="SnsLoginForm" id="SnsLoginForm" action="snsLogin.do" method="post">
						<ul class="snsLoginList">
							<li><a id="kakaoIdLogin" href="javascript:loginWithKakao()">
									<img src="/images/btn/login_kakao.png" />
							</a></li>
							<li><a id="naverIdLogin"> <img alt="login_naver.png"
									src="/images/btn/login_naver.png">
							</a></li>
						</ul>
						<p>※ 공용 PC에서 SNS 로그인 사용 후 로그아웃 시 SNS 로그아웃을 확인하세요.</p>
					<input type="hidden" name="snsLoginId" id="snsLoginId">
					<input type="hidden" name="snsTypeCode" id="snsTypeCode">
					</form>
				</div>
			</div>

			<!-- 회원가입, ID 및 비밀번호 찾기 -->
			<div>
				<ul class="utill-login">
					<li class="btn-join"><a href="javascript:void(0);"
						onclick="javascript: window.location='signUp.do' ; return false ;"><strong>회원가입</strong> 아직 회원이 아니신가요?</a></li>
					<li class="find-id"><a href="javascript:void(0);"
						onclick="javascript: window.location='searchIdForm.do' ; return false ;"><strong>아이디 찾기</strong> 아이디를 분실하셨나요?</a></li>
					<li class="find-pw"><a href="javascript:void(0);"
						onclick="javascript: window.location='searchPw.do' ; return false ;"><strong>비밀번호 찾기</strong> 비밀번호를 분실하셨나요?</a></li>
				</ul>
			</div>
		</div>

	<script type='text/javascript'>
	/* 카카오아이디로로그인 */
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('{JavaScript키}');
	// 카카오 로그인 버튼을 생성합니다.
	function loginWithKakao() {
		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({
			success : function(authObj) {
				alert(JSON.stringify(authObj));
				alert("로그인 성공");
				location.href="/";
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	};
	//]]>

	/* 네이버아디디로로그인 초기화 Script */
	var naverLogin = new naver.LoginWithNaverId({
		clientId : "{clientId}",
		callbackUrl : "{callbackUrl}",
		isPopup : true, /* 팝업을 통한 연동처리 여부 */
		loginButton : {
			color : "green",
			type : 4,
			height : 50
		}
	/* 로그인 버튼의 타입을 지정 */
	});

	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	</script>

</body>
</html>