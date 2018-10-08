<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>编辑页</title>

</head>
<body>
<h1>编辑用户</h1>
<form action="/updatePerson" name="userForm" method="post">
    Id：<input type="text" name="id" value="${person.id}">
    姓名：<input type="text" name="name" value="${person.name}">
    <input type="submit" value="编辑">
</form>
</body>
</html>
