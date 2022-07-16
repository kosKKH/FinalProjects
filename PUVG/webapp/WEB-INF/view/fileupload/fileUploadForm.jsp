<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="org.apache.log4j.LogManager" %> 
<%@ page import="org.apache.log4j.Logger" %> 

<% request.setCharacterEncoding("UTF-8"); %>  
<%Logger logger = LogManager.getLogger(this.getClass());%>  
<%

logger.info("로그 찍히는지 확인 >>>>>>>>>>");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#btn").click(function(){
			alert("파일 보내기")
			$("#f_writeForm").attr({
				"action":"fileuploadInsert.puvg",
				"method":"POST",
				"enctype":"multipart/form-data"
			}).submit();
		});
	});

</script>
</head>
<body>

<form id="f_writeForm">
	<table id="boardWrite">	
		<tr>
			<td>이름(메세지)</td>
			<td><input type="text" name="message" id="message"></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td><input type="file" name="multifile" id="multifile"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" id="btn">보내기</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>