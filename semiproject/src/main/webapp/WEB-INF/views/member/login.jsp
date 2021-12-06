<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background-color: white;
}

.header {
	background-color: white;
}

.login-form {
	width: 300px;
	background: #EEEFF1;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
	border-radius: 5px;
	padding: 30px;
}

.text-field {
	font-size: 14px;
	width: 100%;
	border: none;
	border-radius: 5px;
	padding: 10px;
	margin-bottom: 10px;
	margin-top: 10px;
}

.form-check mb-0 {
	font-size: 14px;
}

.submit-btn {
	font-size: 14px;
	background-color: #1BBC9B;
	color: white;
	width: 100%;
	border-radius: 5px;
	border: none;
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 20px;
}

.links {
	text-align: center;
}

.links a {
	font-size: 12px;
	color: #9B9B9B;
}
</style>

<style>
a {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:focus {
	text-decoration: none;
}

a:hover, a:active {
	text-decoration: none;
}
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js"
	type="text/javascript"></script>

</head>
<br>
<body>
	<div align="center">
		<h1 style="margin-top: 0px; padding: 10px">
			<a href="main.do" style="text-decoration: none; color: black;">Our Own Trip</a>
		</h1>
	</div>
	<br>

	<div class="login-form">
      <form action="loginAf.do" method="post">
      <h2 align="center" style="margin-top: 0px; margin-bottom: 40px">로그인</h2>
        <input type="text" id="id" name="id" class="text-field" placeholder="아이디">
        <!-- Checkbox -->
            <div class="form-check mb-0">
              <input class="form-check-input me-2" type="checkbox" id="chk_save_id" />
              <label class="form-check-label" for="form2Example3">
                id 저장
              </label>
            </div>
        <input type="password" name="pwd" class="text-field" placeholder="비밀번호">
        <input type="submit" value="로그인" class="submit-btn">
        <div class="links">
        <a href="#" onclick="account()">회원이 아니신가요?</a>
        </div>
      </form>
</div>

	<script type="text/javascript">
		function account() { // 회원가입 버튼을 누르면 실행되는 메소드이며, 데이터값을 갖고 regi.jsp로 이동
			location.href = "regi.do";
		}
		/*
		 session : Java -> 서버에서 사용, 회원정보를 기억할 때, 방문횟수 = object가 저장
		 cookie	: JavaScript -> client id저장할 때 많이 사용 = String
		 */

		let user_id = $.cookie("userId"); // 객체 user_id에 키값이 "userId"인 쿠키를 생성.
		if (user_id != null) { // 저장된 쿠키가 있을 때, 유저가 아이디를 적었을 때
			$("#id").val(user_id);
			//	$("#chk_save_id").attr( "checked", "checked" ) // attr(attribute명, attribute값)
			$("#chk_save_id").prop("checked", true);
		}

		$("#chk_save_id").click(function() { // save id를 체크했을 때 실행되는 메소드
		//	alert("check click");

			if ($("#chk_save_id").is(":checked") == true) { // save id가 체크가 되어있을 때
				if ($("#id").val().trim() == "") { // 공백을 제거한 입력한 id값이 빈칸일때
					alert("id를 입력해 주십시오"); // 알림창을 다음과 같이 출력
					$("#chk_save_id").prop("checked", false); // 체크되어있던 save id의 체크를 없앤다.
				} else {
					$.cookie("userId", $("#id").val().trim(), {
						expires : 7,
						path : './'
					});
					// 키값이 "userId"이고 키에 대한 value값은 "$("#id").val().trim()"이 된다.  
					// {expires:7}은 7일간의 유효기간이며, 기간이 지나면 만료된다. {path:'./'}은 전체 사이트에 유효하게 설정해준다.
				}
			} else {
				$.removeCookie("userId", {
					path : './'
				}); // save id가 체크가 되어있지 않다면 전체 사이트에 유효한 쿠키를 삭제한다.
			}

		});
	</script>


</body>
</html>









