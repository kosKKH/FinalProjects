<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="main.puvg.board_booseo.vo.BoardVO" %> 

<%@ page import="java.util.List" %> 

<% request.setCharacterEncoding("UTF-8");%> 
<%	
	Object obj = request.getAttribute("listS");
	if (obj == null) return;

	List<BoardVO> list = (List<BoardVO>)obj;	
	int nCnt = list.size();
	
	BoardVO _vbvo = null;
	if (nCnt == 1){
		_vbvo = list.get(0);
	}	
	
	HttpSession Session = request.getSession(false);
	String VNUM = (String)Session.getAttribute("VID");
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

#board_table {
	width:800px;
	margin:50px;
	
}

#kbcontent{
	width : 600px;
	height : 100px;
	font-size : large;
}

#button_box {
	width:100%;
	height : 80px;
}

#updateBtn, #deleteBtn {
	margin-top : 10px;
	background : #6165f8;
	color : #fff;
	border : 1px solid #6165f8;
	border-radius : 10px;
	font-size : 12pt;
	transition:0.3s;
	width: 100px;
    height: 35px;
    margin-bottom : 20px;
} 
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){	
		
		
		//  insertBtn
		$(document).on("click", "#insertBtn", function(){
			location.href="BoardInsert.puvg";
			});
		
		// selectBtn
		$(document).on("click", "#selectAllBtn", function(){		
			$("#boardSelect")
			.attr({"method":"GET"
				   ,"action":"BoardSelectAll.puvg"})
				   .submit();		
		});
		
		//  updateBtn
		$(document).on("click", "#updateBtn", function(){
			$("#boardSelect")
			.attr({ "method":"POST"
				,"action":"BoardUpdateForm.puvg"
				,"enctype":"application/x-www-form-urlencoded"
				}).submit();
		});
			
//	deleteBtn click event
	$(document).on('click', '#deleteBtn', function(){ 
		
		//	deleteBtn 클릭 로그
		console.log('deleteBtn >>> : ');
		
		//	자유게시판 게시글 보기
		$('#boardSelect').attr({
			"method":"GET",
			"action":"BoardDelete.puvg",
			"enctype":"application/x-www-form-urlencoded"
		}).submit();
		
	});	//	end of deleteBtn click event
	
	});
		
</script>
</head>
<body>
<div>
	<jsp:include page="../sidebar/LeftSidebar.jsp" flush= "true"/> 
</div>
<div style="width:100%; height:100px; position:static;"></div>
<div class="boardSallDiv1">
<div>
<form name="boardSelect" id="boardSelect">
<table style="border:1px solid #8080FF;" id="board_table">
<tr>
<td style="background-color:#8080FF">
<font size="4" style="color:black;"><b><%= (_vbvo.getVbsubject()).replace(","," ") %></b></font>
<input type="hidden" name="vbnum" id="vbnum" value="<%= _vbvo.getVbnum() %>" />
</td>
</tr>
<tr>
<td align="left">
	<div style="display: inline-block; margin-right:20px">
		<font size="1" style="color:gray;"> 작성자 : <%=  _vbvo.getVname() %> </font>
	</div>
	<div style="display: inline-block; margin-right:20px; float:right;" >
		<font size="1" style="color:gray;"> 최초작성일 : <%= _vbvo.getInsertdate() %> </font>
	</div>
	<div style="display: inline-block; margin-right:20px; float:right;">
		<font size="1" style="color:gray;"> 최종수정일 : <%= _vbvo.getUpdatedate() %> </font>
	</div>
</td>
</tr>
<tr>
<td align="center"> 
<img src="/PUVG/uploadImg/<%= _vbvo.getVfile() %>" border="1" style="max-width:500px; max-height:500px" alt="image"><hr>
</td>
</tr>
<tr>
<td align="center">
<textarea name="kbcontent" id="kbcontent" readonly><%= _vbvo.getVbcontent() %>			
</textarea>
</td>
</tr>
<tr>
<td align="left">

</td>
</tr>
</table>
</form>
</div>
<!-- 좋아요 처리하는 루틴 -->
<jsp:include page="/BoardLikeForm.puvg">
	<jsp:param value="<%= _vbvo.getVbnum() %>" name="vbnum"/>
	<jsp:param value="<%= VNUM %>" name="vmnum"/>
</jsp:include>

	<div id="button_box" style="text-align:right;">		
		<button type="button" id="updateBtn" style="margin-right:20px;" >수정하기</button>
		<button type="button" id="deleteBtn" style="margin-right:100px;" >삭제하기</button>
	</div>

<!-- 댓글 처리 하는 루틴  --> 
<jsp:include page="/RpBoardForm.puvg">
	<jsp:param value="<%=_vbvo.getVbnum() %>" name="vbnum"/>
</jsp:include>	
</div>
</body>
</html>