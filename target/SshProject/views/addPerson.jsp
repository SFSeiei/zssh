<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>添加页</title>
    <script type="text/javascript">
        function addUser() {
            var form = document.forms[0];
            form.action = "/addPerson";
            form.method = "post";
            form.submit();
        }
        function addUserAndSee() {
            var form = document.forms[0];
            form.action = "/addPersonAndSee";
            form.method = "post";
            form.submit();
        }
    </script>
</head>
<body>
<h1>添加用户</h1>
<form action="" name="userForm">
    姓名：<input type="text" name="name">
    邮箱：<input type="text" name="email">
    状态：<input type="text" name="status">

    <input type="button" value="添加" onclick="addUser()">
    <input type="button" value="分页展示" onclick="addUserAndSee()">
</form>
</body>
</html>
