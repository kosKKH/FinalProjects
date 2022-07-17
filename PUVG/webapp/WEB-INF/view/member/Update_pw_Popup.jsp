<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 변경</title>
		<style type="text/css">
		#pw_insert_form {
			margin-top:60px;
		}
		
		.input_box {
			width: 300px;
			height : 40px;
			margin-top : 20px;
			margin-bottom : 20px;
		}
		
		</style>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		<%
		HttpSession Session = request.getSession(false);
		String VID = (String)Session.getAttribute("VID");
		%>
		
		$(document).ready(function(){
			$(document).on("click","#pw_btn",function(){
				var id = $("#vnum").val();
				var pw = $("#vpw").val();
				
				
				$.ajax({
					url : "pwcheck.puvg",
					type : "POST",
					data : {vnum : id, vpw : pw},
					success : whensuc,
					error : whenerr
				});
				
				function whensuc(resdata) {
					if(resdata == "success") {
						alert("인증 되었습니다.");
						location.href="changePassWord.puvg";
					} else {
						alert("비밀번호가 잘못 되었습니다.");
					}
				}
				
				function whenerr(e) {
					alert("에러 발생 : " + e.responseText);
				}
			})
		})
		</script>
	</head>
	<body>

	<div style="text-align:center;">
		<font size="4">비밀번호 변경</font><hr>
		<div id="pw_insert_form">
			<font size="2">현재 설정된 비밀번호를 입력해주세요.</font><br>
			<form id="login_check" name="login_check">
				<input type="hidden" id="vnum" name="vnum" value="<%= VID %>">
				<input type="password" id="vpw" name="vpw" class="input_box"><br>
				<input type="button" id="pw_btn" name="pw_btn" value="확인"><br>
			</form>
		</div>
	</div>
	</body>
</html>