<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.puvg.approval.vo.ApprovalListVO"%>  
<%@ page import="java.util.List"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
	Object obj = request.getAttribute("listAll");
	List<ApprovalListVO> list = (List<ApprovalListVO>) obj;
	
	int nCnt = list.size();
	int sums = 0;
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link href="css/DivSetting.css" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
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
width:100px;
height : 50px;
}

.boardSallTd4_2{
width:230px;
height : 50px;
text-align:center;
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

a, a:hover, a:link, a:active{
		text-decoration: none;
		color: black;
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
		<input type="button" id="selectAllBtn" class="boardSallbtn"  value="임시파일" onclick= "location.href = 'ApprovalTempSelectAll.puvg'">
	</div>
	</div>
	<div class="boardSallDiv4">
		<table class="boardSallTable">
			<tr>
				<td class="boardSallTd2_1">
					결재양식
				</td>
				<td class="boardSallTd3_1">
					올린이
				</td>
				<td class="boardSallTd4_1">
					올린시간
				</td>
			</tr>
			<%
			for(int i=0; i<nCnt; i++){		
				ApprovalListVO avo = list.get(i);	
			%>
			<tr>
				<td class="boardSallTd3_2">
					<a href="Appr1DocSelect.puvg"><%= avo.getVsubject()%></a>
				</td>
				<td class="boardSallTd4_2">
					<%= avo.getVname()%>
				</td>
				<td class="boardSallTd5_2">
					<%= avo.getInsertdate()%>
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