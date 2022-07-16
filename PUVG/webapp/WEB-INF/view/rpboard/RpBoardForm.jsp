<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="main.puvg.rpboard.vo.RpBoardVO" %> 
<%@ page import="main.puvg.board_booseo.vo.BoardVO" %> 
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>

<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		//prbcontent 길이 제한 200byte
		$("#vrpcontent").keyup(function(){
			cut_200(this);
		});
		
		// 댓글 전체 불러오기 
		selectAll();
		
		// 댓글 등록
		$(document).on("click", "#insertRBtn", function(){
			if($("#vrpcontent").val() == null || $("#vrpcontent").val() == "") {
				alert("댓글 내용을 입력해주세요.");
			} else {
				console.log("insertRBtn >>> : ");
				
				let insertURL = "RpBoardInsert.puvg";		
				let method = "POST";
				let dataParam = {
						vbnum: $("#vbnum").val(),
						vname: $("#vname").val(),
						vrpcontent: $("#vrpcontent").val(),
				};
		
				/*serialize() 함수는 form태그 안에 있는 데이터만 넘어감 
					그래서 hidden으로 form태그 안에 전부 받아서 넘겨야함 */
	
				dataParam = $("#rboardForm").serialize();
				console.log("dataParam >>> : " + dataParam);
				
				$.ajax({
					url: insertURL,
					type: method,
					data: dataParam,
					success: whenSuccess,
					error: whenError
				});
				
				function whenSuccess(resData){	
					//alert("resData >>> : " + resData);	
					if ("GOOD" == resData){
						// 입력데이터 초기화 함수호출 
						//alert("resData <<<<<<<<<<>> : " + resData);	
						rboardFormData();
						//location.reload();
						selectAll();
					}
				}
				function whenError(e){
					alert("e >>> : " + e.responseText);
				}
			}
			//selectAll();
		});
		
		// 댓글 삭제		
		$(document).on("click", ".deleteBtn", function(){
			console.log("D >>> : ");
			
			var vrpnumV = $(this).parents("li").attr("dataNum");
			//alert(" vrpnumV >>> : " + vrpnumV);
			var target = $(this).parents(".rbmemoItem");
			console.log("target >>> : " + target);
			
			let deleteURL = "RpBoardDelete.puvg";
			let method = "POST";
			let dataParam = {
				vrpnum: $('#vrpnum').val(vrpnumV),				
			};		
			dataParam = $("#rboardForm").serialize();
			console.log("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: deleteURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){					
				console.log("resData >>> : " + resData);				
				if ("GOOD" == resData){
					alert("댓글이 삭제되었습니다.");
					target.remove();
				}	
			}
			function whenError(e){
				console.log("e >>> : " + e.responseText);
			}
		});
	});
	
	
	// 게시글 번호로 댓글 전체조회 ============================================
	function selectAll(){
					
		console.log("SALL >>> : ");
		
		let selectAllURL = "RpBoardSelectAll.puvg";
		let method = "POST";
		let dataParam = {
			vbnum: $("#vbnum").val(),				
		};		
		dataParam = $("#rboardForm").serialize();
		console.log("dataParam >>> : " + dataParam);
		
		$.ajax({
			url: selectAllURL,
			type: method,
			data: dataParam,
			success: whenSuccess,
			error: whenError
		});
		
		function whenSuccess(resData){	
			console.log("resData >>> : " + resData);
			console.log("whenSuccess RpBoardSelectAll resData >>> : " + resData);
			
			if(isEmpty(resData)){
				return false;
			}
			
			let v = resData.split("&");
			for(let i=0; i < v.length; i++){
				console.log(v[i]);
				let vv = v[i].split(",");
				let j=0
				for (; j < vv.length-1; j++){
					console.log("vv[0] >>> : " + vv[0]);
					console.log("vv[1] >>> : " + vv[1]);
					console.log("vv[2] >>> : " + vv[2]);
					console.log("vv[3] >>> : " + vv[3]);					
				}
				addNewItem(vv[0], vv[1], vv[2], vv[3]);
			}
		}
		function whenError(e){
			console.log("e >>> : " + e.responseText);
		}	
	}
	// 게시글 번호로 댓글 전체조회 ============================================
		
	//새로운 글 화면에 추가	=================================================
	function addNewItem(num, writer, content, datetime){
		
		//데이터 체크
		if(isEmpty(num)) return false;
		
		// 새로운 글이 추가될 li태그 
		var newLi = $("<li>");
		newLi.attr("dataNum", num);
		newLi.addClass("rbmemoItem");
		// 작성자 정보가 지정될 <p> 태그 
		var writerP = $("<p>");
		writerP.addClass("writer");
		// 작성자 정보의 이름 
		var nameSpan = $("<span>");
		nameSpan.addClass("name");
		nameSpan.html(decodeURIComponent(writer) + "님");
		// 작성일시 
		var dateSpan = $("<span>");
		dateSpan.html(" / " + datetime + " ");
		// 삭제 버튼 
		var delInput = $("<input>");
		delInput.attr({"type":"button", "value":"X"});
		delInput.addClass("deleteBtn");
		// 내용
		var contentP = $("<p>");
		contentP.html(decodeURIComponent(content));
		
		// 조립하기
		writerP.append(nameSpan).append(dateSpan).append(delInput);
		newLi.append(writerP).append(contentP);
		$("#rboardlist").append(newLi);
	}
	// 새로운 글 화면에 추가	=================================================
	
	// 댓글 길이 체크  ========================================================
	//한글 포함 문자열 길이
	function getTextLength(s){
		var len = 0;
		for(var i=0; i < s.length; i++){
			if(escape(s.charAt(i)).length == 6){
				len++;
			}
			len++;
		}
		return len;
	}
	function cut_200(obj){
		var t = $(obj).val();
		var l = t.length;
		while(getTextLength(t) > 200){
			l--;
			t= t.substring(0, l);
		}
		$(obj).val(t);
		$('.bytes').text(getTextLength(t));
	}
	// 댓글 길이 체크  ========================================================
	
	//댓글 등록 후 입력창 초기화
	function rboardFormData(){
		//alert("rboardFormData <<<<<<<<<<>> : ");	
		$("#vname").val("");
		$("#vrpcontent").val("");
	}
	
	//데이터 체크
	function isEmpty(val){
		if(typeof val=="undefined" || val==null || val==""){
			return true;
		}else{
			return false;
		}
	}

</script>
<style type="text/css">
#rbwriterdiv {
	text-align:center;
}

#vrpcontent {
	font-size:large;
	width:800px;
	height:80px;
}

#insertRBtn {
	margin-top : 10px;
	background : #6165f8;
	color : #fff;
	border : 1px solid #6165f8;
	border-radius : 10px;
	font-size : 12pt;
	transition:0.3s;
	margin-right : 80px;
	width: 100px;
    height: 35px;
    margin-bottom : 20px;
}
</style>
</head>
	<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		Logger logger = LogManager.getLogger(this.getClass());
		logger.info("RpRboardForm.jsp 페이지 >>> : ");
	
		String vbnum = request.getParameter("vbnum");
		logger.info("RpRboardForm.jsp vbnum >>> : " + vbnum);
		String vname = request.getParameter("vname");
		
		HttpSession Session = request.getSession(false);
		String VNAME1 = (String)Session.getAttribute("VNAME");

	%>
	<hr>
		<div id="rbwriterdiv">
			<form name="rboardForm" id="rboardForm">
				<div>
					<input type="hidden" name="vname" id="vname" value="<%=vname %>"/>
					<input type="hidden" name="vbnum" id="vbnum" value="<%=vbnum%>">
					<input type="hidden" name="vrpnum" id="vrpnum">
				</div>
				<div>
					<div style="height:86px; display: inline-block;">
						<div style="top:0px; float: left; margin-right:5px;">
							<font style="top:0px;"><%= VNAME1 %>님</font>
						</div>
						<textarea name="vrpcontent" id="vrpcontent" style="resize: none"></textarea>
					</div>	
					<div>
						<span class="bytes">0</span>bytes
					</div>
					<div style="text-align:right;">
						<input type="button" value="댓글등록" id="insertRBtn">
						<hr>
					</div> 
					
				</div>
				<div style="text-align:left;">
					<ul name="rboardlist" id="rboardlist">
						<!-- 여기에 동적 생성 요소가 들어온다. -->
					</ul>
				</div>
			</form>
		</div>
	</body>
</html>