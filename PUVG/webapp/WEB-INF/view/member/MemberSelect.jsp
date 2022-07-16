<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "main.puvg.member.vo.MemberVO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내 정보 보기</title>
		<link href="css/MemberSelect.css" rel="stylesheet" type="text/css" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		<%
			HttpSession Session = request.getSession(false);
			String VNAME = (String)Session.getAttribute("VNAME");
			int VAUTHORITY = (Integer)Session.getAttribute("VAUTHORITY");
		%>
		$(document).ready(function(){
			if(<%= VAUTHORITY%> == 1) {
				$("#update").attr("disabled", false);
			}
			
			$(document).on("click","#update", function(){
				$("#member_update_form").attr({
					'action':'updateMemberForm.puvg',
					'method':'GET'
				}).submit();
			})
			
			
			$(document).on("click","#update_pw", function(){
				var update_pw = window.open('updatePassWord.puvg',"",'width=500, height=400, left=500, top=300');		
			})
		})
		
		
		
		
		</script>
	</head>
	<body>
		<div>
			<jsp:include page ="../sidebar/LeftSidebar.jsp" flush ="true"/>
		</div>
		<%
			List<MemberVO> list = (List<MemberVO>)request.getAttribute("selectmem");
			MemberVO mvo = list.get(0);
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			String a = sdf.format(date);
			String vage = mvo.getVbirth().substring(0,4);
			int age = Integer.parseInt(a) - Integer.parseInt(vage);
			
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 mm월 dd일");
			SimpleDateFormat sdf3 = new SimpleDateFormat("yyyymmdd");
			Date formatbirth = sdf3.parse(mvo.getVbirth());
			String birth = sdf2.format(formatbirth);	
			
			String dbhiredate = (mvo.getVhiredate()).replace("-","");
			Date formathiredate = sdf3.parse(dbhiredate);
			String hiredate = sdf2.format(formathiredate);
			
		%>
		<div class="MemInsertDiv1">
		<div class="main_container">
			<div id="member_photo" style="width:100%; text-align:center;">
				<div id="photo_box">
					<img id="photo" src="/PUVG/uploadImg/<%= mvo.getVimg() %>"/>
				</div>
			</div>
			<div id="select_div">
				<div class="button_div">
					<input type="button" id="update" name="update" value="정보수정" disabled>
					<input type="button" id="update_pw" name="update_pw" value="비밀번호 변경">
				</div>
				<div class="member_info">
					<font size="2" color="#8080ff">사원 아이디 :</font><br>
					<%= mvo.getVnum() %><br>
				</div>
				<div class="member_info">
					<font size="2" color="#8080ff">이름 :</font><br>
					<%= mvo.getVname() %>
				</div>
				<div class="member_info">
					<font size="2" color="#8080ff">나이 :</font><br>
					<%= age %>
				</div>
				<div class="member_info">
					<font size="2" color="#8080ff">생년월일 :</font><br>
					<%= birth %><br>
				</div>
				<div class="member_info">
					<font size="2" color="#8080ff">이메일 :</font><br>
					<%= mvo.getVemail() %>@<%= mvo.getVemail2() %>
				</div>
				<div class="member_info">
				<font size="2" color="#8080ff">주소 :</font><br>
					<%= mvo.getVaddr() %> 
					<%= mvo.getVaddr2() %>
				</div>
				<div class="member_info">
				<font size="2" color="#8080ff">전화번호 :</font><br>
					<%= mvo.getVph() %><br>
				</div>
				<div class="member_info">
					<font size="2" color="#8080ff">부서 :</font><br>
					<%= mvo.getVdept() %><br>
				</div>
				<div class="member_info">
					<font size="2" color="#8080ff">직책 :</font><br>
					<%= mvo.getVrank() %><br>
				</div>
				<div class="member_info">
					<font size="2" color="#8080ff">입사날짜 :</font><br>
					<%= hiredate %><br>
				</div>
				<form id="member_update_form" name="member_update_form">
				<input type="hidden" id="vnum" name="vnum" value="<%= mvo.getVnum() %>">
				</form>
			</div>
		</div>
		</div>
	</body>
</html>