<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="main.puvg.board_like.vo.BoardLikeVO" %>

 <%@ page import="java.util.List" %>
 
<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%request.setCharacterEncoding("UTF-8"); %>
<% 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("BoardLikeForm.jsp 페이지 >>> : ");
	
	Object obj = request.getAttribute("listAll");
	if(obj == null) return;
	
	List<BoardLikeVO> list = (List<BoardLikeVO>)obj;
	int nCnt = list.size();
	
	String nCnt_1 =  "0";
	String nCnt_2 =  "0";

	BoardLikeVO _vblvo = null;
	if (nCnt == 1) {
		_vblvo = list.get(0);
		
		nCnt_1 = _vblvo.getVblike_cnt_1();
		nCnt_2 = _vblvo.getVblike_cnt_2();

	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	
	$(document).on("click", "#vblike_cnt_1", function(e){
	//alert("vblike_cnt_1 >>> :" + $(this).val());
	e.preventDefault();
	/* e.preventDefault : html 에서 a 태그나 submit 태그의 고유의 동작
	( 페이지를 이동시킨다거나 form 안에 있는 input 등을 전송한다던가)를 중단시킨다  */
	
	// 여기서 이게 없으면 화면이 순간적으로 리로드가 됨
	
	let boardLikeURL = "BoardLikeInsert_1.puvg";
	let reqType = "POST"
	let dataParam = {
			vblike_cnt_1 : $(this).val(),
			vmnum: $("#vmnum").val(),
			vbnum: $("#vbnum").val(),
	};
	//dataParam = $("#likeForm").serialize();
	console.log("dataParam >>> :" + dataParam);
	
	$.ajax({
		url: boardLikeURL,
		type: reqType,
		data: dataParam,
		success: whenSuccess
	});
	function whenSuccess(resData) {
		//alert("resData >>> :" + resData);
		console.log("resData >>> :" + resData);
		$("#like_1").text(resData).val();
	}
	}); //pblike_cnt_1 end


	$(document).on("click", "#vblike_cnt_2", function(e){
		//alert("vblike_cnt_2 >>> :" + $(this).val());
		e.preventDefault();
		/* e.preventDefault : html 에서 a 태그나 submit 태그의 고유의 동작
		( 페이지를 이동시킨다거나 form 안에 있는 input 등을 전송한다던가)를 중단시킨다  */
		
		// 여기서 이게 없으면 화면이 순간적으로 리로드가 됨
		
		let boardLikeURL = "BoardLikeInsert_2.puvg";
		let reqType = "POST"
		let dataParam = {
				vblike_cnt_2 : $(this).val(),
				vmnum: $("#vmnum").val(),
				vbnum: $("#vbnum").val(),
		};
		//dataParam = $("#likeForm").serialize();
		console.log("dataParam >>> :" + dataParam);
		
		$.ajax({
			url: boardLikeURL,
			type: reqType,
			data: dataParam,
			success: whenSuccess
		});
		function whenSuccess(resData) {
			//alert("resData >>> :" + resData);
			console.log("resData >>> :" + resData);
			$("#like_2").text(resData).val();
		}
		}); //pblike_cnt_2 end

});
</script>

<style type="text/css">
	#like_form {
		text-align:center;
		margin-top : 50px;
	}
	
	.emoticon {
		width : 100px;
		height : 100px;
		display: inline-block;
	
	}
	#vblike_cnt_1, #vblike_cnt_2 {
		width : 70px;
		height : 70px;
		margin : auto;
	}
</style>
</head>
<body>
<div id="like_form">
	<form name="likeForm" id="likeForm">
		<input type="hidden" name="vmnum" id="vmnum" value="<%= "M202205200001" %>" />
		<input type="hidden" name="vbnum" id="vbnum" value="<%= "B0001" %>" />
		<div class="emoticon">
			<input 	type="image" src="/PUVG/like_icon/good.png" width="35px" height="35px" 
				class="vblike_cnt_1" name="vblike_cnt_1"  id="vblike_cnt_1" value="01" /><br>
			<span id="like_1"><%= nCnt_1 %></span>
		</div>
		<div class="emoticon">
			<input 	type="image" src="/PUVG/like_icon/bad.png" width="35px" height="35px" 
				class="vblike_cnt_2" name="vblike_cnt_2" id="vblike_cnt_2" value="02" /><br>
			<span id="like_2"><%= nCnt_2 %></span>
		</div>
	</form>
</div>
</body>
</html>
