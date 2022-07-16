<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	// 메뉴버튼 ================================================================	
	/*	
	$(".scheduleBoardImg_Menue").click(function(){
		if (!confirm("게시판으로 이동할까요?")) {
	    } else {
	    	location.href="scheduleBoardSelectAll.puvg";
	    }
	});
	*/

	$(".scheduleBoardImg_Menue").mouseover(function(){
		$(".scheduleBoardIconSPAN").fadeIn();
	});
	
	$(".scheduleBoardImg_Menue").mouseout(function(){
		$(".scheduleBoardIconSPAN").fadeOut();
	});
	// 메뉴버튼 ================================================================		
});
</script>

<style type="text/css">

.scheduleBoardIcon1{
width:1050px;
margin-left : auto;
margin-right : auto;
margin-top : 50px;
}

.scheduleBoardIcon2{
width : 350px;
height : 60px;
margin-left : auto;
margin-right : auto;
text-align:center;
margin-bottom : 10px;
margin-right : 20px;
vertical-align: middle;
line-height:60px;
}

.scheduleBoardIconTD1{
width : 250px;
text-align:right;
color : #6165f8;
font-family: 'Noto Sans KR', sans-serif;
font-size : 20px;
}

.scheduleBoardIconSPAN{
display:none;
}

.scheduleBoardImg_Menue{
width : 60px;
height : 60px;
float:right;
}

</style>
</head>
<body>

<div class="scheduleBoardIcon1">
	<div class="scheduleBoardIcon2">
		<table >
			<tr>
				<td class="scheduleBoardIconTD1"><span class="scheduleBoardIconSPAN">일정관리 게시판 보기</span></td>
				<td class="scheduleBoardIconTD2"><img src = "/PUVG/img/menuIcon.png" class="scheduleBoardImg_Menue" /></td>
			</tr>
		</table>
	</div>
</div>

</body>
</html>