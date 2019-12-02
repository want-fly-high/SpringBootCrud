<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>查询学生</title>

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
	function toPage(page) {
		$("#myfrom").attr("action","select?currPage="+page);
		$("#myfrom").submit();
	}
	
	
	$(function() {
		var grade='${stu.grade.gid}';
		alert(grade);
		if(grade==''){
			grade=-1;
		}
		$("[name='grade.gid']").val(grade);//获得年级下拉框默认的值
	
		//拿到当前页
		var currPage = ${pager.pageNum};
		//拿到最后一页
		var totalPages = ${pager.pages};

		if (currPage <= 1) {
			$("#prev").removeAttr("href");
		}

		if (currPage >= totalPages) {
			$("#next").removeAttr("href");
		}
	});
	
	function aa(){
		$("[name='grade.gid']").val("-1");
		$("[name='sname']").val("");
	}
	
	function del(sno){
	   if(confirm("你确定要删除吗?")){
	   		location.href="delete/"+sno;
	   }
	}
	
</script>

</head>

<body>
	
	<c:if test="${param.op == 'delYes' }" >
		<script>
			alert("删除成功");
		</script>
	</c:if>
	<c:if test="${param.op == 'delNo' }" >
		<script>
			alert("删除失败");
		</script>
	</c:if>
	<c:if test="${param.op == 'insertYes' }">
		<script>
			alert("新增成功");
		</script>
	</c:if>
	<c:if test="${param.op == 'insertNo' }">
		<script>
			alert("新增失败");
		</script>
	</c:if>
	<center>
		<h1>分页显示学生信息</h1>
	</center>
	<form id="myfrom" action="./select" method="post">

	<center>
		<select name="grade.gid">
			<option value="-1">请选择</option>
			<c:forEach items="${gradeAll}" var="grade">
				<option value="${grade.gid }">${grade.gname }</option>
			</c:forEach>
		</select> <input type="text" name="sname" value="${stu.sname }" />
		
		<input type="submit" value="查询" />
		<input type="button" onclick="aa()" value="重置" />
		<br/>
		<a href="toInsert">新增</a>
		</center>
	<table align="center" width="70%" border="1px">
		<tr align="center">
			<td>学生编号</td>
			<td>学生姓名</td>
			<td>出生日期</td>
			<td>学生年级</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list}" var="user" varStatus="st">
			<tr align="center" 
			   <c:if test="${st.index %2 ==0 }">
			     style="background-color:gray"
			   </c:if>
			
			  >
				<td>${user.sno }</td>
				<td>${user.sname }</td>
				<td><fmt:formatDate  value="${user.birthdate }" pattern="yyyy-MM-dd"/></td>
				<td>${user.grade.gname }</td>
				<td><a href="javaScript:del('${user.sno }')">删除</a>
				<a href="toUpdate/${user.sno }">修改</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<center>
		<a href="javaScript:toPage(1)">首页</a>&nbsp;&nbsp; 
		<a id="prev" href="javaScript:toPage(${pager.pageNum-1 })">上一页</a>&nbsp;&nbsp;
		<a id="next" href="javaScript:toPage(${pager.pageNum+1 })">下一页</a>&nbsp;&nbsp;
		<a href="javaScript:toPage(${pager.pages})">尾页</a>&nbsp;&nbsp;
		<span>第${pager.pageNum }页/共${pager.pages }页</span>
	</center>
	
	</form>
	
</body>
</html>
