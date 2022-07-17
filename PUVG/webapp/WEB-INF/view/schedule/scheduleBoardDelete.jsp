<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager"%>
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="main.puvg.schedule.vo.ScheduleVO"%>
<%@ page import="java.util.List"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% 
    Logger logger = LogManager.getLogger(this.getClass());
    logger.info("게시글 삭제 jsp로 무사히 이동했어요 >>> ");
    
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
<title>게시글/일정 삭제하기</title>
</head>
<body>

<script type="text/javascript">
alert("게시글이 삭제됐습니다.");
location.href="scheduleBoardSelectAll.puvg?vnum=<%=vnum%>&checkstatus=123";
</script>

</body>
</html>