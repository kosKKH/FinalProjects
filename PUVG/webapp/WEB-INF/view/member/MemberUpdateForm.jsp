<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "main.puvg.member.vo.MemberVO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>PUVG 사원 정보 수정</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="css/MemberInsertForm.css" rel="stylesheet" type="text/css"/> 
		<script type="text/javascript">
		<%
			HttpSession Session = request.getSession(false);
			String VNAME = (String)Session.getAttribute("VNAME");
			int VAUTHORITY = (Integer)Session.getAttribute("VAUTHORITY");
			
			if (VAUTHORITY == 0) {
				%>
				alert("권한이 없습니다.");
				history.go(-1);
				<%
			}
		
			
			List<MemberVO> list = (List<MemberVO>)request.getAttribute("updatelist");
			MemberVO mvo = list.get(0);
			
			String dbhiredate = (mvo.getVhiredate()).replace("-","");
		%>
		$(document).ready(function(){
			$("#add_code").on("click",function(){
				new daum.Postcode({
					oncomplete: function(data) {
					    $("#add_code").val(data.zonecode); //5자리 새우편번호 사용
					    $("#vaddr").val(data.roadAddress); //도로명 주소
					    //$("#vaddr2").val(data.jibunAddress); //지번주소			
					}
				}).open();
			});
			
			$("#vemail3").on("change",function(){	
				$("#vemail3 option:selected").each(function () {
					if($(this).val()== '1'){ 						
							$("#vemail2").val('');
							$("#vemail2").attr("readonly",false);				
					}else{ 
							$("#vemail2").val($(this).text());
							$("#vemail2").attr("readonly",true);
					}
				}); 
			});
			
			$("#member_update").on("click", function(){
				if($("#vname").val() == null || $("#vname").val() == ""){
					alert("이름을 입력해주세요.")
				} else if($("#vbirth").val() == null || $("#vbirth").val() == ""){
					alert("생년월일을 입력해주세요.")
				} else if($("#vph").val() == null || $("#vph").val() == ""){
					alert("전화번호를 입력해주세요.")
				} else if($("#vaddr").val() == null || $("#vaddr").val() == ""){
					alert("주소를 입력해주세요.")
				} else if($("#vaddr2").val() == null || $("#vaddr2").val() == ""){
					alert("상세주소를 입력해주세요.")
				} else if($("#vemail").val() == null || $("#vemail").val() == ""){
					alert("이메일을 입력해주세요.")
				} else if($("#vemail2").val() == null || $("#vemail2").val() == ""){
					alert("이메일 주소를 확인해주세요.")
				} else if($("#vhiredate").val() == null || $("#vhiredate").val() == ""){
					alert("입사날짜를 입력해주세요.")
				} else if($("#vdept").val() == null || $("#vdept").val() == ""){
					alert("부서를 입력해주세요.")
				} else if($("#vrank").val() == null || $("#vrank").val() == ""){
					alert("직책을 입력해주세요.")
				} else {
					$("#member_update_form").attr({
						"action":"memberUpdate.puvg",
						"method":"POST"
					}).submit();
				}
			})
		});
		
		function preview(input){
			if(input.files && input.files[0]) {
				
				
				var reader = new FileReader();
				
				reader.onload = function(event) {
					document.getElementById('photo').src = event.target.result;
					
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('photo').src = "";
			}
		}
		
	
		</script>
	</head>
	<body>
		<div>
			<jsp:include page ="../sidebar/LeftSidebar.jsp" flush ="true"/>
		</div>
		<div class="MemInsertDiv1">
		<form id="member_update_form" name="member_update_form" enctype="multipart/form-data">
			<table class="MemInsertTable1" >
				<tr>
					<td class=MemInsertTD0>
						<div class="MemInsertDiv3">
						<img id="photo" src="/PUVG/uploadImg/<%= mvo.getVimg() %>"/>
						</div>
					</td>
				<tr>
					<td class="MemInsertTD1"><span class="MemInsertSpan1"></span><br><br>
						<font size="2" color="#c0c0c0">파일 변경을 원하시면 새로운 파일을 업로드 해주세요.</font>
						<input type="file" id="vfile" name="vfile" accept="image/*" onchange="preview(this)" class="fileIMG"/>
					</td>
				</tr>
				<tr>
					<td class="MemInsertTD2"><input type="text" id="vnum" name="vnum" class="MemInsertI1" placeholder="사원 번호" value="<%=mvo.getVnum()%>" readonly/></td>
				</tr>
				<tr>
					<td class="MemInsertTD2"><input type="text" id="vname" name="vname" class="MemInsertI1" placeholder="이름" value="<%=mvo.getVname()%>"/></td>
				</tr>
				<tr>
					<td class="MemInsertTD2"><input type="text" id="vbirth" name="vbirth" class="MemInsertI1" placeholder="생년월일 (yyyymmdd)" maxlength="8" value="<%=mvo.getVbirth()%>"/></td>
				</tr>
				<tr>
					<td class="MemInsertTD2"><input type="text" id="vph" name="vph" class="MemInsertI1" placeholder="전화번호 (###-####-####)" maxlength="13" value="<%=mvo.getVph()%>"/></td>
				</tr>
				<tr>
					<td class="MemInsertTD2"><input type="text" id="add_code" name="add_code" class="MemInsertI3" placeholder="우편번호" readonly/><br>
					<!-- 
					<button type="button" id="addr_btn" name="addr_btn" class="MemInsertbtn1">우편번호 검색</button></td>
					 -->
					<input type="text" id="vaddr" name="vaddr" class="MemInsertI4" placeholder="도로명/지번주소" readonly value="<%=mvo.getVaddr()%>"/><br>
					<input type="text" id="vaddr2" name="vaddr2" class="MemInsertI4" placeholder="나머지주소" maxlength="30" value="<%=mvo.getVaddr2()%>"/><br>
				</tr>
				<tr>
					<td class="MemInsertTD2">
					<input type="text" id="vemail" name="vemail" class="MemInsertI2"  placeholder="이메일" maxlength="20" value="<%=mvo.getVemail()%>"/> @
					<input type="text" id="vemail2" name="vemail2" class="MemInsertI2"  placeholder="주소 직접 입력" maxlength="20" value="<%=mvo.getVemail2()%>"/>
					<select id="vemail3" name="vemail3" class="MemInsertS1">
						<option value="1" selected>직접입력</option>
				       	<option value="naver.com">naver.com</option>	       	   
				      	<option value="gmail.com">gmail.com</option>
				      	<option value="daum.net">daum.net</option>	
					</select></td>
				</tr>
			</table>
			<hr>
			<table class="MemInsertTable1">
				<tr>
					<td class="MemInsertTD2"><input type="text" id="vhiredate" name="vhiredate" class="MemInsertI1" placeholder="입사 날짜(yyyymmdd)" maxlength="8" value="<%=dbhiredate%>"/></td>
				</tr>
				<tr>
					<td class="MemInsertTD2">
					<input type="text" id="vdept" name="vdept" class="MemInsertI1" placeholder="부서" maxlength="10" value="<%=mvo.getVdept()%>"/></td>
				</tr>
				<tr>
					<td class="MemInsertTD2">
					<input type="text" id="vrank" name="vrank" class="MemInsertI1" placeholder="직책" maxlength="10" value="<%=mvo.getVrank()%>"/></td>
				</tr>
				<tr>
					<td class="MemInsertTD2">
					<input type="text" id="vdeleteyn" name="vdeleteyn" class="MemInsertI1" placeholder="근무상태" maxlength="10" value="<%=mvo.getVdeleteyn()%>""/></td>
				</tr>
				<tr>
					<td class="MemInsertTD2">
					<input type="text" id="vauthority" name="vauthority" class="MemInsertI1" placeholder="직책" maxlength="10" value="<%=mvo.getVauthority()%>"/></td>
				</tr>
			</table>
		</form>
		<div class="MemInsertDiv2">
			<button type="button" id="member_update" name="member_update" class="MemInsertbtn2" >수정하기</button>
		</div>
		</div>

	</body>
</html>