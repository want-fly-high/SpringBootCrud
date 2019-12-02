<%--
  Created by IntelliJ IDEA.
  User: OOO
  Date: 2019/11/27
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${param.msg=='no'}">
    <script type="text/javascript">
        alert('用户名密码输入错误，请重新输入');
    </script>
</c:if>
<form action="./doRegister" method="post">
    <h1>注册界面</h1>
    注册用户名:<input type="text" name="loginId"/><br/>
    注册密码:<input type="text" name="loginPwd"/><br/>
    <input type="submit" value="提交">
</form>
</body>
</html>
