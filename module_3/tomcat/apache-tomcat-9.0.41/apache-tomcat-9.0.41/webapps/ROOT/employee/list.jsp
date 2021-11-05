<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="../bootstrap413/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="../datatables/css/dataTables.bootstrap4.min.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <div class="col-10">
      <img src="https://sohanews.sohacdn.com/2017/2-1509544156756.jpg" width="20%">
    </div>
    <div class="col-2 m-auto">
      <p>Nguyễn Văn A</p>
    </div>
  </div>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-success">
  <div class="container-fluid  ">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse " id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
        <li class="nav-item ">
          <a class="nav-link active text-light" aria-current="page" href="">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="/employee">Employee</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="/customer">Customer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="/service">Service</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="/contract">Contract</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success text-light" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<div class="container col-12">
  <div class="row">
    <div class="col-3">
      <button class="btn btn-primary text-white">
        <a class="text-white" href="/employee?action=create">Add new user</a>
      </button>
    </div>
    <div class="col-3">
      <form action="/home?employee-notice=employee&note=sort" method="post">
        <button type="submit" class="btn btn-primary text-white">Sort by name</button>
      </form>
    </div>
    <div class="col-6" style="text-align: right">
      <form action="/customer?note=search" method="post">
        <label> <input type="search" name="name" placeholder="enter name"></label>
        <button type="submit" class="btn btn-primary text-white">Search</button>
      </form>
    </div>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-lg-12">
      <table id="tableStudent" class="table table-striped table-bordered" style="width:100% content-box">
        <thead>
        <tr style="height: 50px" class="text-center bg-success text-light m-auto">
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
          <th>Edit</th>
          <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${employeeList}" varStatus="count">
          <tr>
            <td>${employee.id}</td>
            <td>${employee.name}</td>
            <td>${employee.birthday}</td>
            <td>${employee.idCard}</td>
            <td>${employee.salary}</td>
            <td>${employee.phone}</td>
            <td>${employee.email}</td>
            <td>${employee.address}</td>
            <td>${employee.position.name}</td>
            <td>${employee.educationDegree.name}</td>
            <td>${employee.division.name}</td>
            <td class="text-center">
              <a href="/employee?action=edit&id=${employee.getId()}"
                 role="button" class="btn btn-large btn-warning">Sua</a>
            </td>
            <td>
              <button type="button" class="btn btn-primary" data-toggle="modal"
                      data-target="#exampleModal-${employee.id}">
                Delete
              </button>
            </td>
          </tr>
          <div class="modal fade" id="exampleModal-${employee.id}" tabindex="-1" role="dialog"
               aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  Bạn có muốn xoá customer có id =${employee.id} và tên: ${employee.name} không?
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                  </button>
                  <a href="/employee?action=delete&id=${employee.id}" role="button">Xác nhận</a>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
<div class="col-12 bg-success m-auto text-light ">
  <div class="row">
    <div align="center">
      <p class="fs-6">© welcome to furama resort</p>
    </div>
  </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
</body>
</html>