<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'insert.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
  
  <script type="text/javascript">
  	function checkSname(){
  		var sname=$("[name='sname']").val();
  		if(sname==''||sname.length==0){
  			$("[name='sname']").focus();
  			alert("姓名必填!");
  			return false;
  		}
  		return true;
  	}
  	
  	$(function(){
  			$("#xxForm").submit(
  				function(){
  					if(!checkSname()) return false;
  					return true;
  				}
  			);
  	});
  	
  </script>
  </head>
  
  <body>
    	<form  id="xxForm" action="./doInsert" method="post">
    		姓名:<input type="text" name="sname"><br/>
    		密码:<input type="text" name="sPass"><br/>
    		出生日期:<input type="text" name="birthdate"><br/>
    		年级:<select name="grade.gid">
				<option value="-1">请选择</option>
				<c:forEach items="${gradeAll}" var="grade">
					<option value="${grade.gid }">${grade.gname }</option>
				</c:forEach>
			</select>
			<input type="submit" value="提交">
    	</form>
  </body>
</html>
