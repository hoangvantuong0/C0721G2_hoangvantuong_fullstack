
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 29/10/21
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit user</title>
</head>
<body>
<h1>Edit User</h1>
<p>
  <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/users">Back to user list</a>
</p>
<form method="post">
  <fieldset>
    <legend>User information</legend>
    <table>
      <tr>
        <td>Id: </td>
        <td><input type="text" hidden name="id" value="${user.id}"></td>
      </tr>
      <tr>
        <td>Name: </td>
        <td><input type="text" name="name" value="${user.name}"></td>
      </tr>
      <tr>
        <td>Email: </td>
        <td><input type="text" name="email" value="${user.email}"></td>
      </tr>
      <tr>
        <td>Country: </td>
        <td><input type="text" name="country" value="${user.country}"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Update user"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>