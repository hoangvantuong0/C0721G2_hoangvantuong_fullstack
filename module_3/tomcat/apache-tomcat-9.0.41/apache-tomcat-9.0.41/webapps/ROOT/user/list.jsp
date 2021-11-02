<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>List User</title>

  </style>
</head>
<body>
<div class="container col-12">
  <div class="row">
    <div class="col-3" >
      <button class="btn btn-primary text-white">
        <a class="text-white" href="/user?notice=create">Add new user</a>
      </button>
    </div>
    <div class="col-3">
      <form action="/user?notice=sort" method="post">
        <button type="submit" class="btn btn-primary text-white">Sort by name</button>
      </form>
    </div>
    <div class="col-3" style="text-align: right">
      <form action="/user?notice=search" method="post">
        <label> <input type="search" name="countryName" placeholder="Country name"></label>
        <button type="submit" class="btn btn-primary text-white">Search</button>
      </form>
    </div>

  </div>
</div>

<div class="container">
  <table border="1px">
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
    <c:forEach var="user" items="${userList}">
      <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.email}</td>
        <td>${user.country}</td>
        <td><a href="user?notice=edit&id=${user.id}">Edit</a></td>
        <td><a href="user?notice=delete&id=${user.id}">Delete</a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
