<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.log4j.LogManager" %> 
<%@ page import="org.apache.log4j.Logger" %> 



<% request.setCharacterEncoding("UTF-8");%>
<% 
    Logger logger = LogManager.getLogger(this.getClass());
    logger.info("scheduleBoardSelectAll.jsp 일정관리 게시판 이동 ");
%>

<%--
    HttpSession Session = request.getSession(false);
    String VNAME = (String)Session.getAttribute("VNAME");
    String VDEPT = (String)Session.getAttribute("VDEPT");
    int VAUTHORITY = (Integer)Session.getAttribute("VAUTHORITY");
    
    logger.info("VNAME : " + VNAME);
    logger.info("VDEPT : " + VDEPT);
    logger.info("VAUTHORITY : " + VAUTHORITY);
    
    if (VAUTHORITY == 0) {
       
       
       alert("권한이 없습니다.");
       history.go(-1);
       
       
    }
    
 --%>

<%
Object obj = request.getAttribute("jsonCalendar");
JSONArray jsonCalendar = null;
if(obj!=null){
	jsonCalendar = (JSONArray)obj;
	logger.info("jsonCalendar : " + jsonCalendar);
}
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8' />
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  <link rel="stylesheet" href="/PUVG/css/schedule/scheduleMain.css">
  
<script type="text/javascript">
$(document).ready(function(){
	
	// 캘린더 등록 좌표 ==================================================
	var x = null;
	var y = null;    
	document.addEventListener('mousemove', onMouseUpdate, false);
	document.addEventListener('mouseenter', onMouseUpdate, false);  
	function onMouseUpdate(e) {
	  x = e.pageX;
	  y = e.pageY;
	}
	function getMouseX() {
	  return x;
	}
	function getMouseY() {
	  return y;
	}
	// 캘린더 등록 좌표 ==================================================
	
	// 일정등록 박스 애니메이션  ============================================
	$(".schSpan3").click(function(){
		var check = $(".schInput2").val();
		if(check=="N"){
			$(".schSpan3").text("등록을 원하시지 않으시면 클릭해주세요.");
			$(".schInput2").val("Y");
			$(".scheduleDiv4").css({"height":"250px"});
			$(".scheduleDiv5").slideDown();
		}else{
			$(".schSpan3").text("시간등록이 필요할 경우 클릭해주세요.");
			$(".schInput2").val("N");
			// 등록시간 체크하기
			$(".scheduleDiv4").css({"height":"150px"});
			$(".scheduleDiv5").slideUp();
		}
	});
	// 일정등록 박스 애니메이션  ============================================
	
	// 셀렉트박스 애니메이션  ==============================================
	$(".scdSelect1").change(function(){
		$(".scdSelect1").css({"background":"#6165f8", "color":"#fff"});
	});
	$(".scdSelect2").change(function(){
		$(".scdSelect2").css({"background":"#6165f8", "color":"#fff"});
	});
	$(".scdSelect3").change(function(){
		$(".scdSelect3").css({"background":"#6165f8", "color":"#fff"});
	});
	$(".scdSelect4").change(function(){
		$(".scdSelect4").css({"background":"#6165f8", "color":"#fff"});
	});
	$(".scdSelect5").change(function(){
		$(".scdSelect5").css({"background":"#6165f8", "color":"#fff"});
	});
	// 셀렉트박스 애니메이션  ==============================================
		
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
     var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '800px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '09:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '18:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        // initialDate: '2022-06-16', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능      
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        
        // 제이슨으로 불러와야 함.
        events : <%=jsonCalendar%>,

        // 해당 내용은 상세 일정만 가능함 
        eventAdd: function(obj) {
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        	
     	// [일정] 클릭시 발생 이벤트 ======================================
     	eventClick: function(info) {
		var status = $("#boxStatus").val();
		
		if(status=="N"){
			$("#boxStatus").val("Y");
			$(".scheduleDiv10").css({
				"top":y,
				"left" : x - 20
			}).show();
		}else{
			closeBar();
		}

     	},
     	// [일정]일정등록, 빠진내용 처리하기 ===============================================
     		
     		
     		
     		
        // 이벤트 추가하기 캘린더에서 드래그로 이벤트를 생성할 수 있다.
        select: function(arg) { 
        	alert(arg.startStr);
        	alert(arg.endStr); // -1
        	var start = JSON.stringify(arg.startStr);
        	var end = JSON.stringify(arg.endStr);
        	console.log("start : " + start);
        	console.log("end : " + end);
        	
        	var startM = start.substring(6,8);
        	var startD = start.substring(9,11);
        	var endM = end.substring(6,8);
        	var endD = end.substring(9,11);
        	
        	var startM0 = start.substring(6,7);
        	var startD0 = start.substring(9,10);
        	var endM0 = end.substring(6,7);
        	var endD0 = end.substring(9,10);
        	
        	if(startM0=="0"){
        		startM = start.substring(7,8);
        	}
        	if(startD0=="0"){
        		startD = start.substring(10,11);
        	}
			if(endM0=="0"){
        		endM = end.substring(7,8);
        	} 
        	if(endD0=="0"){
        		endD = end.substring(10,11);
        	}
        	
        	var startMnum = parseInt(startM);
        	var endMnum = parseInt(endM);
        	var startDnum = parseInt(startD);
        	var endDnum = parseInt(endD);
        	
        	var bool1 = endDnum - startDnum;
        	var bool2 = endMnum - startMnum;
        	console.log("bool1 : " + bool1 );
        	console.log("startM : " + startM);
        	console.log("endM : " + endM);
        	
			var dateString1 = startM + "월 " +  startD + "일"
			var dateString2 = startM + "월 " +  startD + "일 - " + endM + "월 " +  startD + "일"
        	
        	// 하루 비교 일반
        	if(bool1 === 1 && startM == endM){
            	$(".schSpan2").text(dateString1);
        	}else if(bool2 === 1 && endD =="1"){
            	$(".schSpan2").text(dateString1);
        	}else if(startM=="12" && endM=="1" && startD =="31" && endD =="1"){
            	$(".schSpan2").text(dateString1);
        	}else{
            	$(".schSpan2").text(dateString2);
        	}
        	
			// 팝업
			$("#insertEvent").css({
				"top":y + 20,
				"left" : x - 20
			}).show();
		
			// 일정등록, 빠진내용 처리하기 ===============================================
			$("#schInsertbtn").click(function(){
				var vscalendarnum = $("#vscalendarnum").val();
				var vsname = $("#vsname").val();
				
				var ckbox1 = $("#scdbox1").val();
				var ckbox2 = $("#scdbox2").val();
				var ckbox3 = $("#scdbox3").val();
				var ckbox4 = $("#scdbox4").val();
				var startS = start.substring(1,11);
				var endS = end.substring(1,11);
				var vsstartT = startS + "T" + ckbox1 + ":" + ckbox2;
				var vsendT = endS + "T" + ckbox3 + ":" + ckbox4;
				var vsstart = $("#vsstart").val(vsstartT);
				var vsend = $("#vsend").val(vsendT);
				
				if(vscalendarnum=="00" || null || vscalendarnum == "undefined"){
					alert("어떤 캘린더에 저장하실지 선택해주세요.");
				}else if(vsname == "" || vsname == "undefined"){
					alert("일정 제목을 입력해주세요.");
				}else{
					var queryString = $("#schedule").serialize() ;
					console.log("vscalendarnum : " + vscalendarnum)
					
					$.ajax({
						url : "schedulInsert.puvg",
						type : "POST",
						data : queryString,
						dataType : "text", //이 부분 수정해야 함
						success : sfun,
						error : efun
					});
					
					function sfun(response){
						console.log("response : " + response);
						alert("일정이 무사히 등록됐습니다.");
						
			            calendar.addEvent({
			                title: vsname,
			                start: arg.start,
			                end: arg.end,
			                allDay: arg.allDay
			             });
			            response="";
		        		$(".scdSelect1").css({"background":"#fff", "color":"#6165f8"});
		        		$(".scdSelect2").css({"background":"#fff", "color":"#6165f8"});	
		        		$(".scdSelect3").css({"background":"#fff", "color":"#6165f8"});
		        		$(".scdSelect4").css({"background":"#fff", "color":"#6165f8"});
		        		$(".scdSelect5").css({"background":"#fff", "color":"#6165f8"});
		        		$("#insertEvent").slideUp();
		        		$("#vsname").val("");
		        		$("#vscalendarnum").val("00");
			           
			            return;
					}
					function efun(request,status,error){
						alert("죄송합니다. 오류가 생겨 일정등록에 문제가 생겼습니다. ");
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				}
			});
			// 일정등록, 빠진내용 처리하기 ===============================================       
          calendar.unselect()
        }
      });
      calendar.render();
    });
    
 	//[일정] 클릭시 발송되는 박스이벤트 - 마우스클릭 이벤트 =====================
	$("#boxUpdate").click(function(){
		closeBar();
	});
	$("#boxShare").click(function(){
		closeBar();
	});
	$("#boxDelete").click(function(){
		closeBar();
	});
	
	// 일정등록 닫기버튼 ======================================================
	
		// 누르면 모든 이벤트가 기본 상태로 돌아감. ★★★★★★★★★★★★★★★★★★체크하기
	$(".scheduleDiv6").click(function(){
		$(".scdSelect1").css({"background":"#fff", "color":"#6165f8"});
		$(".scdSelect2").css({"background":"#fff", "color":"#6165f8"});	
		$(".scdSelect3").css({"background":"#fff", "color":"#6165f8"});
		$(".scdSelect4").css({"background":"#fff", "color":"#6165f8"});
		$(".scdSelect5").css({"background":"#fff", "color":"#6165f8"});
		$("#insertEvent").slideUp();
	});

		
	//[일정]클릭 닫기 버튼 =====================================================
	function closeBar(){
		$("#boxStatus").val("N");
		$(".scheduleDiv10").hide()
	}
	$(".schSpan6").click(function(){
		closeBar();
	});
	//[일정]클릭 닫기 버튼 =====================================================
		

	$("#scheduleBoard").click(function(){
		$("#schedule").attr({
			"action" : "scheduleBoardSelectAll.puvg",
			"method" : "GET",
			"enctype" : "application/x-www-form-urlencoded"	
		}).submit();
	});	
	
	
	// 일정 캘린더 보기 ===============================================
	var schM01N = $("#schM01N").val();
	var schM02N = $("#schM02N").val();
	var schM03N = $("#schM03N").val();
	var checkstatus = $("#checkstatus").val();
	console.log("schM01N >>> " + schM01N);
	console.log("schM02N >>> " + schM02N);
	console.log("schM03N >>> " + schM03N);
	
	$("#schM01").click(function(){
		console.log("schM01N >>> " + schM01N);
		if(schM01N == "Y"){
			schM01N = "N";
			$("#schM01").css({"background" : "#fff"});
		}else{
			schM01N = "Y";
			$("#schM01").css({"background" : "#6165f8"});
		}
	});
	
	$("#schM02").click(function(){
		console.log("schM02N >>> " + schM02N);
		if(schM02N == "Y"){
			schM02N = "N";
			$("#schM02").css({"background" : "#fff"});
		}else{
			schM02N = "Y";
			$("#schM02").css({"background" : "#e14141"});
		}
	});
	
	$("#schM03").click(function(){
		console.log("schM03N >>> " + schM03N);
		if(schM03N == "Y"){
			schM03N = "N";
			$("#schM03").css({"background" : "#fff"});
		}else{
			schM03N = "Y";
			$("#schM03").css({"background" : "#47d66c"});
		}
	});
	// 일정 캘린더 보기 ===============================================
	$("#calanderSelect").click(function(){

		if(schM01N=="Y" && schM02N=="Y" && schM03N=="Y"){
			$("#checkstatus").attr({"value":"123"})
			$("#schedule").attr({
				"action" : "scheduleMain.puvg",
				"method" : "GET",
				"enctype" : "application/x-www-form-urlencoded"	
			}).submit();
		}else if(schM01N=="Y"){
			$("#checkstatus").attr({"value":"1"})
			$("#schedule").attr({
				"action" : "scheduleMain.puvg",
				"method" : "GET",
				"enctype" : "application/x-www-form-urlencoded"	
			}).submit();
		}else if(schM02N=="Y"){
			$("#checkstatus").attr({"value":"2"})
			$("#schedule").attr({
				"action" : "scheduleMain.puvg",
				"method" : "GET",
				"enctype" : "application/x-www-form-urlencoded"	
			}).submit();
		}else if(schM03N=="Y"){
			$("#checkstatus").attr({"value":"3"})
			$("#schedule").attr({
				"action" : "scheduleMain.puvg",
				"method" : "GET",
				"enctype" : "application/x-www-form-urlencoded"	
			}).submit();
		}else if(schM01N=="Y" && schM02N=="Y"){
			$("#checkstatus").attr({"value":"12"})
			$("#schedule").attr({
				"action" : "scheduleMain.puvg",
				"method" : "GET",
				"enctype" : "application/x-www-form-urlencoded"	
			}).submit();
		}else if(schM01N=="Y" && schM03N=="Y"){
			$("#checkstatus").attr({"value":"13"})
			$("#schedule").attr({
				"action" : "scheduleMain.puvg",
				"method" : "GET",
				"enctype" : "application/x-www-form-urlencoded"	
			}).submit();
		}else if(schM02N=="Y" && schM03N=="Y"){
			$("#checkstatus").attr({"value":"23"})
			$("#schedule").attr({
				"action" : "scheduleMain.puvg",
				"method" : "GET",
				"enctype" : "application/x-www-form-urlencoded"	
			}).submit();
		}
	});
	

});
</script>
  
</head>
<body >
<div>
	<jsp:include page="../sidebar/LeftSidebar.jsp" flush= "true"/> 
</div>
<form id="schedule" name="schedule">
<!-- 세션체크해서 바꿔야 함 -->

<div class="scheduleDiv1">
	<!-- 마우스 클릭시 메뉴바 -->
	<div class="scheduleDiv10">
		<div class="scheduleDiv8">
			<div class="scheduleDiv9" id="boxUpdate">일정 수정</div>
			<div class="scheduleDiv9" id="boxShare">일정 공유</div>
			<div class="scheduleDiv9" id="boxDelete">일정 삭제</div>
		</div>
		<span class="schSpan6">×닫기</span>
		<input type="hidden" id="boxStatus" value="N"/>
	</div>

	<!-- 일정등록박스 -->
	<div class="scheduleDiv4" id="insertEvent">
		<div class="scheduleDiv6">×닫기</div>
		<span class=schSpan1>일정 등록</span>&nbsp;&nbsp;
		<select id="vscalendarnum" name="vscalendarnum" class="scdSelect1">
				<option value="00">선택</option>
				<option value="01">개인</option>
				<option value="02">부서</option>
				<option value="03">회사</option>
		</select>
		<br>
		<span class=schSpan2></span>&nbsp;<span class=schSpan3>시간등록이 필요할 경우 클릭해주세요.</span><br>
		<input type="hidden" class="schInput2" value="N"/>
		<div class="scheduleDiv5">
			<div class="scheduleDiv7">
			<span class="schSpan5">시작</span>&nbsp;
			<select id="scdbox1" class="scdSelect2">
				<option value="00">00</option>
				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
				<option value="09">09</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
			</select>&nbsp;<span class="schSpan5">시</span>
			<select id="scdbox2" class="scdSelect3">
				<option value="00">0</option>
				<option value="30">30</option>
			</select>&nbsp;<span class="schSpan5">분</span><br>
			</div>
			
			<div class="scheduleDiv7">
			<span class="schSpan5">마침</span>&nbsp;
			<select id="scdbox3" class="scdSelect4">
				<option value="00">00</option>
				<option value="01">01</option>
				<option value="02">02</option>
				<option value="03">03</option>
				<option value="04">04</option>
				<option value="05">05</option>
				<option value="06">06</option>
				<option value="07">07</option>
				<option value="08">08</option>
				<option value="09">09</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
			</select>&nbsp;<span class="schSpan5">시</span>
			<select id="scdbox4" class="scdSelect5">
				<option value="00">00</option>
				<option value="30">30</option>
			</select>&nbsp;<span class="schSpan5">분</span><br>
			</div>
			
			<input type=hidden id="vsstart" name="vsstart" value="" />
			<input type=hidden id="vsend" name="vsend" value="" />
		</div>
		<span class=schSpan4>제목 </span>
			<input type="text" id="vsname" name="vsname" class="schInput1" />
		<button type="button" id="schInsertbtn", class="schbtn1" >등록하기</button>

	</div>
	<div class="scheduleDiv2">
		<div class="scheduleDiv11">
			<button type="button" id="scheduleBoard" class="schBtn3">일정게시판 보기</button>
		</div>
	
	
		<table class="scdMtable1">
			<tr>
				<td class="scdMtd1"><button type="button" id="schM01" class="schBtn2"></button></td>
				<td class="scdMtd2"><span class="schSpan7">개인</span></td>
				<input type="hidden" id="schM01N" value="Y"/>
				<td class="scdMtd1"><button type="button" id="schM02" class="schBtn4"></button></td>
				<td class="scdMtd2"><span class="schSpan7">부서</span></td>
				<input type="hidden" id="schM02N" value="Y"/>
				<td class="scdMtd1"><button type="button" id="schM03" class="schBtn5"></button></td>
				<td class="scdMtd2"><span class="schSpan7">회사</span></td>
				<input type="hidden" id="schM03N" value="Y"/>
				<td class="scdMtd3">
					<button type="button" id="calanderSelect" class="schBtn3">일정 보기</button>
				</td>
			</tr>
		</table>
<!-- 사원정보 가라데이터 -->
	<input type=hidden id="vnum" name="vnum" value="V202207100001" />
	<input type=hidden id="vname" name=""vname"" value="황신애" />
	<input type=hidden id="vdept" name="vdept" value="영업부" />
	<input type=hidden id="vsmemo" name="vsmemo" value="-" /><!-- 메모내용 -->
	<input type=hidden id="vspublic" name="vspublic" value="N" /><!-- 공유여부 -->
	<input type=hidden id="vsstatus" name="vsstatus" value="01" /><!-- 상태 수정X 항상 등록할 땐 진행중임 -->
	<input type=hidden id="checkstatus" name="checkstatus" value="" /><!-- 상태-->

	</div>
	<div class="scheduleDiv3">
	  <!-- calendar 태그 -->
	  <div id='calendar-container'>
	    <div id='calendar'></div>
	    </div>
	</div>
</div>
</form>
</body>
</html>
