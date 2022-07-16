<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>PUVG GroupWare</title>
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<link href="css/LoginPage.css" rel="stylesheet" type="text/css" />
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("click","#login_btn",function(){
				var id = $("#mem_id").val();
				var pw = $("#mem_pw").val();
				$.ajax({
					url : "logincheck.puvg",
					type : "POST",
					data : {vnum : id, vpw : pw},
					success : whensuc,
					error : whenerr
				});
				
				function whensuc(resdata) {
					if(resdata == "success") {
						location.href="memberChart.puvg";
					} else {
						alert("아이디 혹은 비밀번호가 잘못 되었습니다.")
					}
				}
				function whenerr(e) {
					alert("에러 발생 : " + e.responseText);
				}
			})
		});
		
		</script>
<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
}


body{
margin:0;

}

.loginDiv1{
width: 100vw;
height: 100vh;
border : 1px solid #333;
position:fixed;
background-image : url("img/로그인페이지.png");
}

.loginDiv2{
width:400px;
height:100%;
display: inline-block;
float:right;
background : #6165f8;
box-shadow: -10px 0px 10px 0px rgba(0, 0, 0, .1);
}

.loginDiv3{
width:350px;
height : 700px;
margin-left:auto;
margin-right:auto;
text-align:center;
padding-top:200px;
}

.loginInput{
width : 260px;
height : 50px;
margin-bottom : 15px;
padding-left:20px;
padding-right:20px;
font-family: 'Noto Sans KR', sans-serif;
font-size:20px;
}

.loginInput:focus{
outline:none;
}

.loginbtn{
margin-top : 30px;
background : #9093fa;
color : #fff;
font-size : 14pt;
padding-top : 15px;
padding-bottom : 15px;
padding-left : 130px;
padding-right : 130px;
margin-bottom : 20px;
transition:0.3s;
border:none;
}
.loginbtn:hover{
background : #fff;
color : #6165f8;
}
.loginbtn:focus{
outline:none;
}

.loginSpan1{
color:#fff;
font-size:12px;
}

.space{
padding-left:10px;
padding-right:10px;
}

.loginDiv4{
color:#fff;
font-size:10px;
opacity:0.5;
bottom:20px;
letter-spacing: 10px;
text-align:center;
margin-top:430px;
}

</style>
		
		
</head>
<body>

<div class="loginDiv1">
	<div class="loginDiv2">
		<div class="loginDiv3">
			<div id="login_form">
				<input type="text" id="mem_id" name="mem_id" class="loginInput" placeholder="아이디"><br>
				<input type="password" id="mem_pw" name="mem_pw" class="loginInput" placeholder="비밀번호"><br>
				<input type="button" id="login_btn" name="login_btn" class="loginbtn" value="login"><br>
				<span class="loginSpan1">
					<span id="insert">회원가입</span><span class="space">ㅣ</span>
					<span id="serchID">아이디 찾기</span><span class="space">ㅣ</span>
					<span id="serchPW">비밀번호 찾기</span>
				</span>
				<div class="loginDiv4">
				2022ⓒKOSMO108 PUVG
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>