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

	//	freeSelectAll.jsp 진입 로그
	logger.info("BoardSelectAll.jsp 진입 >>> : ");
	
	//	ListAll getAttribute
	Object obj = request.getAttribute("ListAll");
	//	list에 FreeVO listAll값 넣기
	List<BoardVO> list = (List<BoardVO>)obj;
	
	//	nCnt = 전체 조회 건수
	int nCnt = list.size();
	
	//	전체조회 건수 문자열
	String nCntS = " ::: 전체 조회 건수 " + nCnt + " 건";
%>    
<!DOCTYPE html>
<!---------------------- html ------------------------>
<html>


<!---------------------- head ------------------------>
<head>


<meta charset="UTF-8">
<!---------------------- title ----------------------->
<title>부서 게시판판 글 목록</title>


<!-- 디바이스에 맞는 화면 설정 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 부트스트랩 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- script -->
<script type="text/javascript">

	//	ready()
	$(document).ready(function(){
		//	콘솔 로그
		console.log("ready >>> : ");
		
		//	insertBtn click event
		$(document).on('click', '#insertBtn', function(){
			
			//	insertBtn 클릭 로그
			console.log('insertBtn >>> : ');
			
			//	자유게시판 글 쓰기로 이동
			location.href="BoardInsert.puvg";
		});	//	end of insertBtn click event
		
		//	deleteBtn click event
		$(document).on('click', '#deleteBtn', function(){ 
			
			//	deleteBtn 클릭 로그
			console.log('deleteBtn >>> : ');
			
			//	자유게시판 게시글 보기
			$('#boardList').attr({
				"method":"GET",
				"action":"BoardDelete.puvg",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
		});	//	end of deleteBtn click event
		
		//	selectBtn click event
		$(document).on('click', '#selectBtn', function(){
			
			//	selectBtn 클릭 로그
			console.log('selectBtn >>> : ');
			
			//	자유게시판 게시글 보기
			$('#boardList').attr({
				"method":"GET",
				"action":"BoardSelect.puvg",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
		});	//	end of selectBtn click event
		
	});	//	end of ready()
	
	
	// 태그안에 속성으로 클래스에 해당하는 값은 css와 jQuery 자바스크립트에서 .(클래스의 값)으로 표현한다.
	// 태그안에 속성으로 클래스에 해당하는 값은 css와 jQuery 자바스크립트에서 #(id)로 표현한다. 
	</script>
<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
}

.boardSallDiv1{
width : 1000px;
height : 800px;
border : 1px solid #eee;
box-shadow: 3px 3px 5px 1px rgba(0, 0, 0, .1);
margin-left : auto;
margin-right : auto;
margin-top : 20px;
margin-bottom : 100px;
background : #fff;
}


.boardSallTable{
margin-left:auto;
margin-right:auto;
text-align:center;
margin-top : 50px;
font-size:14px;
color : #49494a;
border-collapse: collapse;
}

.boardSallTd1_1{
width:50px;
height : 50px;
font-weight: 700;
}

.boardSallTd2_1{
width:80px;
height : 50px;
font-weight: 700;
}

.boardSallTd3_1{
width:80px;
height : 50px;
font-weight: 700;
}

.boardSallTd4_1{
width:300px;
height : 50px;
font-weight: 700;
}

.boardSallTd5_1{
width:100px;
height : 50px;
font-weight: 700;
}

.boardSallTd6_1{
width:100px;
height : 50px;
}

.boardSallTd1_2{
width:50px;
height : 50px;
}

.boardSallTd2_2{
width:80px;
height : 50px;
}

.boardSallTd3_2{
width:80px;
height : 50px;
}

.boardSallTd4_2{
width:230px;
height : 50px;
text-align:left;
}

.boardSallTd5_2{
width:100px;
height : 50px;
}

.boardSallTd6_2{
width:100px;
height : 50px;
}

.boardSallbtn{
margin-top : 10px;
background : #6165f8;
color : #fff;
border : 1px solid #6165f8;
border-radius : 10px;
font-size : 12pt;
padding-top : 10px;
padding-bottom : 10px;
padding-left : 40px;
padding-right : 40px;
transition:0.3s;
margin-right : 20px;
}

.boardSallbtn:hover{
background : #2528f1;
}

.boardSallbtn:focus{
background : outline;
}

td{
border-bottom : 1px solid #eee;
}

.boardSallDiv2{
width : 550px;
float:left;
}
.boardSallDiv3{
width : 180px;
float:right;
text-align:right;
}

.boardSallDiv4{
border : 1px solid #fff;
margin-top : 50px;
}

.boardSallDiv5{
width : 750px;
border : 1px solid #fff;
margin-right : auto;
margin-left : auto;
margin-top : 50px;
}

</style>
	</head>
	<body>
	<div>
	<jsp:include page="../sidebar/LeftSidebar.jsp" flush= "true"/> 
	</div>

<form name="boardList" id="boardList">
<div class="boardSallDiv1">
	<div class="boardSallDiv5">
	<div class="boardSallDiv2">
		<button type="button" id="selectAllBtn" class="boardSallbtn">글 목록</button>
		<button type="button" id="selectBtn" class="boardSallbtn">글 내용 보기</button>
		<button type="button" id="deleteBtn" class="boardSallbtn">글 삭제</button>
	</div>
	<div class="boardSallDiv3">
		<button type="button" id="insertBtn" class="boardSallbtn">글 쓰기</button>
	</div>
	</div>
	<div class="boardSallDiv4">
		<table class="boardSallTable">
			<tr>
				<td class="boardSallTd1_1">
					<input type="checkbox" name="chkAll" id="chkAll"></td>
				<td class="boardSallTd2_1">
					순번
				</td>
				<td class="boardSallTd3_1">
					글 번호
				</td>
				<td class="boardSallTd4_1">
					글 제목
				</td>
				<td class="boardSallTd5_1">
					작성자
				</td>
				<td class="boardSallTd6_1">
					날짜
				</td>
			</tr>
			<%
			for(int i=0; i<nCnt; i++){		
				BoardVO _vbvo = list.get(i);	
			%>
			<tr>
				<td class="boardSallTd1_2">
					<input type="checkbox" id="vbnum" name="vbnum" class="vbnum" value=<%= _vbvo.getVbnum() %> />
				<td class="boardSallTd2_2">
					<%= i + 1 %>
				</td>
				<td class="boardSallTd3_2">
					<%= _vbvo.getVbnum() %>
				</td>
				<td class="boardSallTd4_2">
					<%= (_vbvo.getVbsubject()).replace(","," ") %>
				</td>
				<td class="boardSallTd5_2">
					<%= _vbvo.getVname() %>
				</td>
				<td class="boardSallTd6_2">
					<%= _vbvo.getInsertdate() %>
				</td>
			</tr>
			<%
			}//end of for
			%>	
		</table>
	</div>
</div>
</form>	
	
	</body>
	</html>