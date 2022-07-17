<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD : 게시판 : 글쓰기 </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$(document).on("click", "#vbBtn", function(){
			console.log("vbBtn >>> : ");								
			$('#boardForm').attr({
				'action':'BoardInsertForm.puvg',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});
	});	
	
	function preview(input){
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function(event) {
				document.getElementById('photo').src = event.target.result;
				$("#holder").text("");
				
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('photo').src = "";
			$("#holder").text("사진이 등록되지 않았습니다.");
		}
	}
</script>
<style type="text/css">

.tt {
	background: skyblue;
	text-align: center;
}

.boardSallDiv1{
	width : 1000px;
	height : 1500px;
	border : 1px solid #eee;
	box-shadow: 3px 3px 5px 1px rgba(0, 0, 0, .1);
	margin-left : auto;
	margin-right : auto;
	margin-bottom : 100px;
	background : #fff;
}

#board_head{
	width : 100%;
	text-align : center;
	margin-bottom : 50px;
}

#board_subject{
	width : 100%;
	margin-bottom : 20px;
	margin-left:50px;
}

input {
	width : 80%;
	height : 20px;
}

select {
	height : 26px;
}

#vbcontent{
	width:848px; 
	height:300px;
	font-size:large;
}
#board_content{
	margin-left:50px;
}

#board_photo{
	margin-left:50px;
	margin-bottom:30px;
}

.title {
	width : 852px; 
	text-align:center; 
	background:#8080ff;
	border : 1px solid black;
}

#photo_div {
	width : 852px; 
	border : 1px solid black;
	text-align : center;
}

#photo {
	max-width:500px;
    max-height:500px;
}

#board_insert_img {
	width : 852px;
	text-align : right;
}

#file {
	height : 30px;
	width : 75px;
	margin : 5px;
}

#button_div {
	width : 852px;
	margin-left : 50px;
	text-align:right;
}

#vbBtn{
width : 100px;
height : 30px;
margin-top : 10px;
background : #6165f8;
color : #fff;
border : 1px solid #6165f8;
border-radius : 10px;
font-size : 12pt;
transition:0.3s;
margin-right : 20px;
	
}
</style>
</head>
<body>
<div>
	<jsp:include page="../sidebar/LeftSidebar.jsp" flush= "true"/> 
</div>
<div class="boardSallDiv1">
	<div style="margin:20px;">
	<div style="width:100%; height:100px; position:static;"></div>
		<div id="board_head"><font size="4"><b>게시판 글쓰기</b></font></div>
		<form name="boardForm" id="boardForm">
		<div id="board_subject">
			<select name="vbsubject" id="vbsubject">
        	<option value="[공지]">[공지]</option>
        	<option value="[경조사]">[경조사]</option>
        	<option value="[개인]">[개인]</option>		        	
         	</select>
         	<input type="text" name="vbsubject" id="vbsubject" placeholder="제목을 입력해주세요.">
		</div>
		<div id="board_photo">
			<div class="title"><font style="color:white;">사진</font></div>
			<div id="photo_div">
				<img id="photo"/>
				<span id="holder"><font style="color:gray;">사진이 등록되지 않았습니다.</font></span>
			</div>
			<div id="board_insert_img">
				<input type="file" name="file" id="file" accept="image/*" onchange="preview(this)">
			</div>
		</div>
		<div id="board_content">
			<div class="title"><font style="color:white;">내용</font></div>
			<textarea name="vbcontent" id="vbcontent"></textarea>
		</div>
		
		<div id="button_div">
			<input type="button" value="등록" id="vbBtn">
		</div>
		
		
		</form>
	</div>
</div>
</body>
</html>