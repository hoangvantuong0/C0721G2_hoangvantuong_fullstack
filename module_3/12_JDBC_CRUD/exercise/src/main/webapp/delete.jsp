<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Delete</title>
</head>
<body>
<h1>Delete Product</h1>
<p>
  <a href="/users">Back to user list</a>
</p>
<form method="post">
  <h3>Do you wan to delete this user?</h3>
  <fieldset>
    <legend>User information</legend>
    <table>
      <tr>
        <td>Name:</td>
        <td>${user.name}</td>
      </tr>
      <tr>
        <td>Email:</td>
        <td>${user.email}</td>
      </tr>
      <tr>
        <td>Country:</td>
        <td>${user.country}</td>
      </tr>
      <tr>
        <td><input type="submit" value="Delete user"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>