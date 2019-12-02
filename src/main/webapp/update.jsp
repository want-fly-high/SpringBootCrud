<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fm" %>


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
    	<fm:form id="xxForm" action="/doUpdate" method="post"  modelAttribute="old">
    		<fm:hidden path="sno"/>
    		姓名:<fm:input path="sname"/><br/>
    		密码:<fm:input path="sPass"/><br/>
    		出生日期:<fm:input path="birthdate"/><br/>
    		年级:
    		<fm:select path="grade.gid">
    			<option value="-1">请选择</option>
    			<fm:options items="${gradeAll}"
    			 itemLabel="gname" itemValue="gid"/>
    		</fm:select>
			<input type="submit" value="提交">
    	</fm:form>
  </body>
</html>
