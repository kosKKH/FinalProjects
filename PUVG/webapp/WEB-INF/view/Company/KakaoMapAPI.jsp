<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>오시는 길</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="css/DivSetting.css" rel="stylesheet" type="text/css"/> 
		<style type="text/css">
		
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
		.notosanskr * { 
		 font-family: 'Noto Sans KR', sans-serif;
		}

		
		#map_head {
			width:100%;
			height:150px;
			text-align:center;
			margin-top : 50px;
			margin-bottom : 100px;
			font-family: 'Noto Sans KR', sans-serif;
		}
		</style>
	</head>
	<body>
		<div>
			<jsp:include page ="../sidebar/LeftSidebar.jsp" flush ="true"/>
		</div>
		<div style="width:100%; height:100px; position:static;">
		</div>
		<div class="MemInsertDiv1">
			<div id="map_head">
				<font size="6"><b>오시는 길</b></font><br><br>
				
				<font size="5">서울 금천구 가산디지털2로 123 월드메르디앙 2차</font><br>
				<font size="5" color="#747F00">7호선 가산디지털단지역</font>
				<font size="5">5번 출구에서 377m</font>
			</div>
			<div id="map_body">
			<div id="map" style="width:960px;height:700px;margin:20px; border:1px solid #8080FF"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a70dfa3a7b0c61e5f2a93a0e564ea9f2"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.478853, 126.879367), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(37.478853, 126.879367); 
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);    
			</script>
			</div>
		
		
		</div>
		
	</body>
</html>