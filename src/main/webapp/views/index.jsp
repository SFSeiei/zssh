<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="../js/jquery-3.3.1.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        function del(id){
            $.get("/delPerson?id=" + id,function(data){
                if("success" == data.result){
                    alert("删除成功");
                    window.location.reload();
                }else{
                    alert("删除失败");
                }
            });
        }
    </script>
</head>
<body>
<h3><a href="/toAddPerson">添加用户</a></h3>
<table border="1">
    <tbody>
    <tr>
        <th>姓名</th>
        <th>邮箱</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    <c:if test="${!empty personList}">
        <c:forEach items="${personList}" var="person">
            <tr>
                <td>${person.name }</td>
                <td>${person.email }</td>
                <td>${person.status }</td>
                <td>
                    <a href="/getPerson?id=${person.id}">编辑</a>
                    <a href="javascript:del('${person.id}')">删除</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
</body>
</html>