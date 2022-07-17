<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!-- import -->    
<%@ page import="main.puvg.board_booseo.vo.BoardVO" %> 
<%@ page import="java.util.List" %>
<%@ page import="org.apache.log4j.LogManager"%>
<%@ page import="org.apache.log4j.Logger" %>    
<!---------------- UTF-8 인코딩  ----------------> 
<% 	request.setCharacterEncoding("UTF-8"); %>    
<%
	//	log4j logger 세팅
	Logger logger = LogManager.getLogger(this.getClass());

	//	freeUpdateForm.jsp 진입 로그
	logger.info("BoardUpdateForm.jsp 진입 >>> : ");
	
	//	listS obj 로 불러오기
	Object obj = request.getAttribute("listS");
	
	//	obj 가 null 이면 return
	if(obj == null) return;
	
	//	list에 obj 담기
	List<BoardVO> list = (List<BoardVO>)obj;
	int nCnt = list.size();
	
	//	fvo 선언 및 list 집어넣기
	BoardVO vbvo = null;
	String subject = "";
	//	select가 조회되면 list fvo에 집어넣기
	if(nCnt == 1){
		vbvo = list.get(0);
		
		String subjectvalue = vbvo.getVbsubject();
		subject = subjectvalue.substring(5, subjectvalue.length());
	}	//	end of if(nCnt == 1)
	
%>
<!DOCTYPE html>
<!---------------------- html ------------------------>
<html>


<!---------------------- head ------------------------>
<head>


<meta charset="UTF-8">
<!---------------------- title ------------------------>
<title><%=vbvo.getVbsubject() %></title>
<!-- 디바이스 환경에 맞는 화면 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 부트스트랩 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery CDN -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">	
	//	ready()
	$(document).ready(function(){
		
		// ready 로그
		console.log("ready() >>> : ");
		
		//	updateBtn click event
		$(document).on('click', '#updateBtn', function(){
			
			//	selectBtn 클릭 로그
			console.log('updateBtn >>> : ');
			
			//	자유게시판 게시글 보기
			$('#boardUpdate').attr({
				"method":"POST",
				"action":"BoardUpdate.puvg",
				"enctype":"multipart/form-data"
			}).submit();
			
		});	//	end of updateBtn click event
	});
</script>
<style type="text/css">
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
	width:852px; 
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
	width : 86px;
	margin : 5px;
}

#button_div {
	width : 852px;
	margin-left : 50px;
	text-align:right;
}

#updateBtn{
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
<!---------------------- head End -------------------->

<!---------------------- body ------------------------>
<body>
<div>
	<jsp:include page="../sidebar/LeftSidebar.jsp" flush= "true"/> 
</div>
<div class="boardSallDiv1">
	<div style="margin:20px;">
	<div style="width:100%; height:100px; position:static;"></div>
		<div id="board_head"><font size="4"><b>게시판 글 수정하기</b></font></div>
		<form name="boardUpdate" id="boardUpdate">
		<input type="hidden" name="vbnum" id="vbnum" value="<%= vbvo.getVbnum() %>">
		<div id="board_subject">
			<select name="vbsubject" id="vbsubject">
        	<option value="[공지]">[공지]</option>
        	<option value="[경조사]">[경조사]</option>
        	<option value="[개인]">[개인]</option>		        	
         	</select>
         	<input type="text" name="vbsubject" id="vbsubject" placeholder="제목을 입력해주세요." value="<%= subject %>">
		</div>
		<div id="board_photo">
			<div class="title"><font style="color:white;">사진</font></div>
			<div id="photo_div">
				<img id="photo" src="/PUVG/uploadImg/<%= vbvo.getVfile() %>"/>
				<span id="holder"><font style="color:gray;"></font></span>
			</div>
			<div id="board_insert_img">
				<input type="file" name="file" id="file" accept="image/*" onchange="preview(this)">
			</div>
		</div>
		<div id="board_content">
			<div class="title"><font style="color:white;">내용</font></div>
			<textarea name="vbcontent" id="vbcontent"><%= vbvo.getVbcontent()%></textarea>
		</div>
		
		<div id="button_div">
			<input type="button" value="수정하기" id="updateBtn">
		</div>
		
		
		</form>
	</div>
</div>

</body>
</html>