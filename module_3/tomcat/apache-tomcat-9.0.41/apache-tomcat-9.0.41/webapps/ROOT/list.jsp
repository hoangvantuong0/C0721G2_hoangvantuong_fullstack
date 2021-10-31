<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>User Management Application</title>
</head>
<body>
<center>
  <div>
    <h1>User Management</h1>
  </div>

  <h2>
    <a href="/users?action=create">Add New User</a>
    <div class="col-6" style="text-align: right">
      <form action="/users?notice=search" method="post">
        <label> <input type="search" name="countryName" placeholder="Country name"></label>
        <button type="submit" class="btn btn-primary text-white">Search</button>
      </form>
    </div>
    <div>
      <form action="/users?notice=sort" method="post">
        <input type="submit" name="sort" value="sort">
      </form>
    </div>

  </h2>
</center>

<div align="center">
  <table border="1">
    <thead>
    <tr>
      <th>Id</th>
      <th>Name</th>
      <th>Email</th>
      <th>Country</th>
      <th>Edit</th>
      <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${listUser}">
      <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.email}</td>
        <td>${user.country}</td>
        <td><a href="users?notice=edit&id=${user.id}">Edit</a></td>
        <td><a href="users?notice=delete&id=${user.id}">Delete</a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>