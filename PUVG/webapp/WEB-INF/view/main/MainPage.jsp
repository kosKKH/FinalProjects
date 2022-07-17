<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "main.puvg.member.vo.MemberVO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>PUVG GroupWare</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript">
		<%
			List<MemberVO> list1 = (List<MemberVO>)request.getAttribute("newmember");
			List<MemberVO> list2 = (List<MemberVO>)request.getAttribute("birthmember");
			List<MemberVO> list3 = (List<MemberVO>)request.getAttribute("mydept");
			List<MemberVO> list4 = (List<MemberVO>)request.getAttribute("myinfo");
			MemberVO myinfo = list4.get(0);
			
			HttpSession Session = request.getSession(false);
			String VDEPT = (String)Session.getAttribute("VDEPT");
		
		%>
		</script>
		<style type="text/css">
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
		.notosanskr * { 
		 font-family: 'Noto Sans KR', sans-serif;
		}
		
		.mainpageDiv{
			width : 1400px;
			height : 900px;
			border : 1px solid #eee;
			box-shadow: 3px 3px 5px 1px rgba(0, 0, 0, .1);
			margin-left : 400px;
			margin-right : auto;
			margin-bottom : 100px;
			background : #ececf6;
			display : inline-block;
			
		}
		
		.maincontentDiv{
			width : 680px;
			height : 430px;
			box-shadow: 3px 3px 5px 1px rgba(0, 0, 0, .1);
			margin : 10px;
			float:left;
			 
		}
		
		.monthDiv {
			width : 660px;
			height : 200px;
			margin : 7.5px 10px 7.5px 10px;
			border : 1px solid #8080FF;
		}
		
		.resultDiv {
			font-family: 'Noto Sans KR', sans-serif;
			font-size:x-large;
			padding : 5px;
		}
		
		.mydept {
			font-family: 'Noto Sans KR', sans-serif;
			margin : 20px;
			border : 1px solid #8080FF;
			height : 348px;
		}
		
		.myinfo {
			font-family: 'Noto Sans KR', sans-serif;
			margin : 20px;
			border : 1px solid #8080FF;
			height:380px;
			
		}
		
		.imgDiv {
			width:200px;
			height : 266px;
			background : #333;
			margin-left:20px;
			display:inline-block;
		}
		
		#photo{
			max-width:200px;
   			max-height:266px;
		}
		
		.subject {
			width : 100px;
			float : left;
			text-align : center;
		}
		</style>
	</head>
	<body>
		<div>
			<jsp:include page ="../sidebar/LeftSidebar.jsp" flush ="true"/>
		</div>
		<div style="width:100%; height:60px; position:static;"></div>
		<div class="mainpageDiv">
			<div class="maincontentDiv">
				<div class="myinfo">
					<div style="width:100%; text-align:center;">
						<font size="4"><b>내 정보</b></font><br>
					</div>
					<div>
						<div class="imgDiv">
							<img id="photo" src="/PUVG/uploadImg/<%= myinfo.getVimg() %>"/>
							
						</div>
						<div style="display:inline-block; width:400px; font-size:x-large">
						<div class="subject">사원번호  </div>: <%= myinfo.getVnum() %> <br>
						<div class="subject">이름 </div>: <%= myinfo.getVname() %> <br>
						<div class="subject">부서 </div>: <%= myinfo.getVdept() %> <br>
						<div class="subject">직급 </div>: <%= myinfo.getVrank() %> <br>
						<div style="float:right;"><%= myinfo.getVdeleteyn() %> 중 </div>
						</div>
					</div>
					<div style="width:100%; text-align:right;">
					<a href="memberSelect.puvg" style="margin-right:20px;"><font size="2" color="gray">내 정보 보기</font></a>
				</div>
				</div>
				
			</div>
			<div class="maincontentDiv">
				<div style="margin:10px;">
					<jsp:include page ="Weather.jsp" flush ="true"/>
				</div>
			</div>
			<div class="maincontentDiv">
				<div style="text-align:center; margin-top:20px;">
				<font size="5"><b><%= VDEPT %> 연락처</b></font><br>
				</div>
				<div class="mydept">
					<div style="text-align : justify; margin:10px;">
					<%
						for(int i=0; i<list3.size(); i++) {
							MemberVO mydept = list3.get(i);
					%>
						<font size="4"><%= mydept.getVnum() %> 
						<%= mydept.getVname() %> 
						<%= mydept.getVph() %> 
						<%= mydept.getVrank() %> 
						<%= mydept.getVdeleteyn() %></font> <br>
					<%	
						}
					%>
					</div>
				</div>
			</div>
			<div class="maincontentDiv">
				<div class="monthDiv">
					<div style="width:100%; text-align:center;">
						<font size="4"><b>이번달 생일 예정자</b></font><br>
						<font size="2" style="color:gray;">기쁨과 축하의 메세지를 보내주세요!</font>
					</div>
					<div class="resultDiv">
						<%
						for (int i=0; i< 3; i++) {
							MemberVO birthmvo = list2.get(i);
							String month = (birthmvo.getVbirth()).substring(4,6);
							String day = (birthmvo.getVbirth()).substring(6,8);
							
							
							
						%>
							<font size="2"><%= month%>월 <%=day %>일  <%= birthmvo.getVdept() %>/<%= birthmvo.getVrank() %>     <%= birthmvo.getVname() %>님</font><br>
						<%
						}
						%>
					
					</div>
				</div>
				<div class="monthDiv">
					<div style="width:100%; text-align:center;">
						<font size="4"><b>이달의 신입사원</b></font><br>
						<font size="2" style="color:gray;">모두 따듯한 격려와 응원의 메세지를 보내주세요!</font>
					</div>
					<div class="resultDiv">
						<%
						for (int i=0; i< 3; i++) {
							MemberVO newmvo = list1.get(i);
						%>
							<font size="2"><%= newmvo.getVdept() %>/<%= newmvo.getVrank() %>     <%= newmvo.getVname() %>님</font><br>
						<%
						}
						%>
					
					</div>
				</div>
			</div>
		</div>
	</body>
</html>