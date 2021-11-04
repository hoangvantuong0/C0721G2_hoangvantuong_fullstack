<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<form method="post">
  <h3>Are you sure delete this user?</h3>
  <fieldset>
    <legend>User information</legend>
    <table class="table table-bordered">
      <thead>
      <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Birth Day</th>
        <th>Id Card</th>
        <th>Salary</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Position</th>
        <th>Education Degree</th>
        <th>Division</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>${employee.id}</td>
        <td>${employee.name}</td>
        <td>${employee.birthDay}</td>
        <td>${employee.idCard}</td>
        <td>${employee.salary}</td>
        <td>${employee.phone}</td>
        <td>${employee.email}</td>
        <td>${employee.address}</td>
        <td>${employee.position.name}</td>
        <td>${employee.educationDegree.name}</td>
        <td>${employee.division.name}</td>
      </tr>
      </tbody>
    </table>
  </fieldset>
</form>
</body>
</html>