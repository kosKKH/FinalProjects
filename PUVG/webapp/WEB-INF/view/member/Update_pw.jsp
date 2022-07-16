<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 변경</title>
		<style type="text/css">
		
		#pw_box {
			margin-top:60px;
		}
		.input_box {
			width: 300px;
			height : 40px;
			margin-bottom : 20px;
		}
		
		</style>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("keyup","#vpw_chk",function(){
				if($("#vpw").val() != null){
					if($("#vpw").val() == $("#vpw_chk").val()){
						$("#check").html("비밀번호가 일치합니다.")
					} else {
						$("#check").html("비밀번호가 다릅니다.")
					}
				}
			})
			
			$(document).on("keyup","#vpw",function(){
				if($("#vpw_chk").val() != null){
					if($("#vpw").val() == $("#vpw_chk").val()){
						$("#check").html("비밀번호가 일치합니다.")
					} else {
						$("#check").html("비밀번호가 다릅니다.")
					}
				}
			})
			
			$(document).on("click","#change_btn",function(){
				if($("#vpw").val() == "" || $("#vpw").val() == null) {
					alert("비밀번호를 입력해주세요.");
				} else if ($("#vpw_chk").val() !=  $("#vpw").val()){
					alert("비밀번호가 일치하는지 확인해주세요.")
				} else if(($("#vpw").val()).length < 8){
					alert("비밀번호는 8 ~ 20 자리로 입력해주세요.")
				} else {
					var pw = $("#vpw").val();
					$.ajax({
						url : "UpdatePassWord.puvg",
						type : "POST",
						data : {vpw : pw},
						success : whensuc,
						error : whenerr
					});
					
					function whensuc(resdata) {
						if(resdata == "success") {
							alert("비밀번호가 변경 되었습니다.");
							window.close();
						} else {
							alert("비밀번호 변경 중 오류가 발생하였습니다. 다시 시도해 주세요.");
							window.close()
						}
					}
					
					function whenerr(e) {
						alert("에러 발생 : " + e.responseText);
					}
				}
			})
		})

		</script>
	
	</head>
	<body>
		<div style="text-align:center;">
			<font size="4">비밀번호 변경</font><hr>
			<div id="pw_box">
				<form id="pw_update_form" name="pw_update_form">
					<font size="3">새 비밀번호</font><br>
					<input type="password" id="vpw" name="vpw" class="input_box" maxlength="20" placeholder="비밀번호는 8 ~ 20 자리로 입력해주세요."><br>
				</form>
					<font size="3">비밀번호 확인</font><br>
					<input type="password" id="vpw_chk" name="vpw_chk" class="input_box" maxlength="20"><br>
					<font size="2" color="gray"><span id="check"></span><br></font>
					<input type="button" id="change_btn" name="change_btn" value="변경하기" style="margin-top:20px;">
			</div>
		</div>
	</body>
</html>