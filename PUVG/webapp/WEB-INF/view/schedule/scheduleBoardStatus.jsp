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
<title>...내일부턴 그냥 나오지 말아야겠다. </title>
<script type="text/javascript">
alert("상태가 수정됐습니다~");
location.href="scheduleBoardSelect.puvg?vsnum=<%=vsnum%>";
</script>

</head>
<body>
</body>
</html>