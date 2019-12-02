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
<form action="./doLogin" method="post">
    登录名:<input type="text" name="loginId"/><br/>
    密码:<input type="text" name="loginPwd"/> <br/>
    <input type="submit" value="登录"/>
    <input type="reset"/>
</form>

</body>
</html>
