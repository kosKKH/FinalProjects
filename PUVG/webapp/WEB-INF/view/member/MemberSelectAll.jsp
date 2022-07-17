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
		<title>사원 관리</title>
		<link href="css/MemberSelectAll.css" rel="stylesheet" type="text/css" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
			List<MemberVO> list1 = (List<MemberVO>)request.getAttribute("selectall");
			MemberVO mvo1 = list1.get(0);
			int viewpage = 5;
			int nowpage = Integer.parseInt(mvo1.getNowpage());
			int totalcount = Integer.parseInt(mvo1.getTotalcount());
			
			int max = totalcount/15 +1;
		%>
		$(document).ready(function(){
			$(document).on("click",".member_info",function(){
				//alert($(this).children('.tt1').text());
				let vnum = $(this).children('.tt1').text();	
				
				location.href="memberSelectAdmin.puvg?&vnum="+vnum;
			})
			/*
			$(document).on("change","#searchdept",function(){
				//alert("searchdept =" + $("#searchdept").val());
				//alert("value = " +$("#searchdept option:checked").text());
				$("#vdept").val($("#searchdept option:checked").text());
				$("#search_form").attr({
					'action':'memberSearchData.puvg',
					'method':'GET'
				}).submit();
			})
			
			$(document).on("change","#searchrank",function(){
				//alert("searchrank =" + $("#searchrank").val());
				$("#vrank").val($("#searchrank option:checked").text());
				//alert("vrank = " + $("#vrank").val());
				$("#search_form").attr({
					'action':'memberSearchData.puvg',
					'method':'GET'
				}).submit();
			})
			*/
			
			$(document).on("click","#search_btn", function(){
				$("#vdept").val($("#searchdept option:checked").text());
				$("#vrank").val($("#searchrank option:checked").text());
				$("#search_form").attr({
					'action':'memberSearchData.puvg',
					'method':'GET'
				}).submit();
			})
			
			$(document).on("click","#search",function(){
				if ($("#vname").val() == "" && $("#vname").val() == null){
					alert("검색할 이름을 입력해주세요.")
				} else {
					location.href="memberSearch.puvg?&nowpage=1&vname="+ $("#vname").val();
				}
			})
				
		})
		</script>
	</head>
	<body>
		<div>
			<jsp:include page ="../sidebar/LeftSidebar.jsp" flush ="true"/>
		</div>
		<div class="MemInsertDiv1">
			<div class="main_container">
				<div id="selectall_div">
					<div id="member_table">
						<div id="member_search">
							<input type="text" id="vname" name="vname" placeholder="검색어가 없을 시 전체 조회됩니다.">
							<button id="search" name="search">검색</button>
						</div>
						<div id="member_select">
							<form id="search_form" name="search_form">
								<input type="hidden" id="vdept" name="vdept">
								<input type="hidden" id="vrank" name="vrank">
								<select id="searchdept" name="searchdept">
									<option value="0">부서</option>
									<option value="1">총무부</option>
									<option value="2">인사부</option>
									<option value="3">영업부</option>
									<option value="4">경영지원부</option>
									<option value="5">기술지원부</option>
									<option value="6">기술개발부</option>
									<option value="7">연구기획부</option>
									<option value="8">생산관리부</option>
									<option value="9">품질관리부</option>
									<option value="10">해외사업부</option>
								
								</select>
								<select id="searchrank" name="searchrank">
									<option value="0">직급</option>
									<option value="1">사장</option>
									<option value="2">이사</option>
									<option value="3">부장</option>
									<option value="4">과장</option>
									<option value="5">대리</option>
									<option value="6">주임</option>
									<option value="7">신입</option>
								</select>
								<button id="search_btn" name="search_btn">검색</button>
							</form>
						</div>
						<div id="top_div">
							<span class="tt tt1">사원번호</span>
							<span class="tt tt2">이름</span>
							<span class="tt tt3">생년월일</span>
							<span class="tt tt4">나이</span>
							<span class="tt tt5">부서</span>
							<span class="tt tt6">직급</span>
							<span class="tt tt7">고용일</span>
							<span class="tt tt8">연락처</span>
							<span class="tt tt9">근무상태</span>
							<span class="tt tt10">권한</span>
						</div>
						
						<%
							List<MemberVO> list = (List<MemberVO>)request.getAttribute("selectall");
						
							for(int i=0; i<list.size(); i++) {
								MemberVO mvo = list.get(i);
								
								Date date = new Date();
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
								String a = sdf.format(date);
								String vage = mvo.getVbirth().substring(0,4);
								int age = Integer.parseInt(a) - Integer.parseInt(vage);
						%>
							<div class="member_info">
								<span class="tt tt1"><%= mvo.getVnum() %></span>
								<span class="tt tt2"><%= mvo.getVname() %></span>
								<span class="tt tt3"><%= mvo.getVbirth() %></span>
								<span class="tt tt4"><%= age %></span>
								<span class="tt tt5"><%= mvo.getVdept() %></span>
								<span class="tt tt6"><%= mvo.getVrank() %></span>
								<span class="tt tt7"><%= mvo.getVhiredate() %></span>
								<span class="tt tt8"><%= mvo.getVph() %></span>
								<span class="tt tt9"><%= mvo.getVdeleteyn() %></span>
								<span class="tt tt10"><%= mvo.getVauthority() %></span>
							</div>
						<%
							}
						%>
					</div>
				</div>
				<table id="paging_table">
					<tr>
						<td colspan="12">
							<p align="center">
								<a href = "memberSelectAll.puvg?&nowpage=1">◁◁</a>
				<% 
					if (viewpage > max) {
						viewpage = max;
					}
					if(nowpage-2 <= 0){
						for(int i = 1; i<=viewpage; i++){
							if(nowpage == i){
								%>
								<a href  = "memberSelectAll.puvg?&nowpage=<%=i%>"><b><%= i + " " %></b></a>
								<%
							} else {
								%>
										<a href = "memberSelectAll.puvg?&nowpage=<%=i%>"><%= i + " " %></a>
								<%
							}
						}
					} else if (nowpage+2 > max) {
						for(int i = max-(viewpage-1); i<=max; i++){
							if(nowpage == i){
								%>
								<a href  = "memberSelect.puvg?&nowpage=<%=i%>"><b><%= i + " " %></b></a>
								<%
							} else {
								%>
										<a href = "memberSelectAll.puvg?&nowpage=<%=i%>"><%= i + " " %></a>
								<%
							}
						}
					} else {
						for(int i = nowpage-2; i<(nowpage + viewpage -2); i++){
							if(nowpage == i){
								%>
								<a href  = "memberSelectAll.puvg?&nowpage=<%=i%>"><b><%= i + " " %></b></a>
								<%
							} else {
				%>
							<a href = "memberSelectAll.puvg?&nowpage=<%=i%>"><%= i + " " %></a>
				<%
							}
						}
					}
				%>
				
								<a href = "memberSelectAll.puvg?&nowpage=<%=max%>">▷▷</a>
							</p>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>