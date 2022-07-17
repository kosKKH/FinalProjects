<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager"%>
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="main.puvg.schedule.vo.ScheduleVO"%>
<%@ page import="java.util.List"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% 
    Logger logger = LogManager.getLogger(this.getClass());
    logger.info("scheduleBoardInsert.jsp 일정등록 성공 ");
    
    List<ScheduleVO> list = (List<ScheduleVO>)request.getAttribute("list");
    int nCnt = list.size();
    
    String vsnum = "";
    String vnum = "";
    
    for(int i =0 ; i < nCnt ; i++ ){
    	ScheduleVO svoAll = list.get(i);
    	vsnum = svoAll.getVsnum();
    	vnum = svoAll.getVnum();
    }   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정게시글 등록이 완료됐어요.</title>
<script type="text/javascript">
if (!confirm("글 등록이 완료됐습니다. 게시글을 확인하시겠습니까?")) {
	location.href="scheduleBoardSelectAll.puvg?vnum=<%=vnum%>&checkstatus=123";
} else {
	location.href="scheduleBoardSelect.puvg?vsnum=<%=vsnum%>";
}
</script>
</head>
<body>
</body>
</html>