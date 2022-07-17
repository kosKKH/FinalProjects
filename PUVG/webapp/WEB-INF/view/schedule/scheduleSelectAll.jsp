<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager"%>
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="main.puvg.schedule.vo.ScheduleVO"%>
<%@ page import="java.util.List"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% 
    Logger logger = LogManager.getLogger(this.getClass());
    logger.info("kosmoProductSelectAllAdmin.jsp 관리자 전체상품 조회하기 >>> ");

    List<ScheduleVO> selectAll = (List<ScheduleVO>)request.getAttribute("selectAll");

    int nCnt = selectAll.size();
    logger.info("nCnt : " + nCnt);

    
    
	String knum ="";	
	String kprice="";
	for(int i = 0; i < nCnt; i++){
		ScheduleVO svoAll = selectAll.get(i);
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

스케줄 조회하기 페이지로 무사히 이동됐어요. 

</body>
</html>