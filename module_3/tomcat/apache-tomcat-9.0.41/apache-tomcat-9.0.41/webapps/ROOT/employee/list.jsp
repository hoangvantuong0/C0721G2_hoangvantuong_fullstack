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
  <%--    <style>--%>
  <%--        * {--%>
  <%--            margin: auto;--%>
  <%--            padding: 0px 0px;--%>
  <%--        }--%>
  <%--    </style>--%>
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
          <a class="nav-link active text-light" aria-current="page" href="/home">Home</a>
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
<div class="container">
  <div class="row">
    <div class="col-lg-12">
      <%--            <form method="">--%>
      <%--                <input type="text" name="findName" placeholder="Nhập tên">--%>
      <%--                <input type="text" name="findCustomerType" placeholder="Nhập CustomerType">--%>
      <%--                <input type="text" name="findPhone" placeholder="Nhập phone">--%>
      <%--                <button type="submit">TÌm kiếm</button>--%>
      <%--            </form>--%>
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
            <td>${employee.birthDay}</td>
            <td>${employee.idCard}</td>
            <td>${employee.salary}</td>
            <td>${employee.phone}</td>
            <td>${employee.email}</td>
            <td>${employee.address}</td>
            <td>${employee.position.name}</td>
            <td>${employee.educationDegree.name}</td>
            <td>${employee.division.name}</td>
            <td class="text-center">
              <a href="/employee?note=edit&id=${employee.getId()}"
                 role="button" class="btn btn-large btn-warning">Sua</a>
            </td>
            <td>
              <button type="button" class="btn btn-primary" data-toggle="modal"
                      data-target="#exampleModal">
                Xóa
              </button>
            </td>
          </tr>
          <!-- Modal -->
          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
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
                  Are you sure delete Employee có Id = ${employee.id} and Name là: ${employee.name}
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <a href="/employee?note=delete&id=${employee.id}" role="button" class="btn-danger">
                    accept </a>
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
      <p class="fs-6">Mọi nội dung tại đây © 2005 – 2021 Công ty TNHH Tư nhân Agoda. Bảo Lưu Mọi Quyền.
        Agoda.com
        là thành viên của Tập đoàn Booking Holdings, nhà cung cấp dịch vụ du lịch trực tuyến & các dịch
        vụ có liên quan hàng đầu thế giới.</p>
    </div>
  </div>
</div>
</div>

<script src="../jquery/jquery-3.5.1.min.js"></script>
<script src="../datatables/js/jquery.dataTables.min.js"></script>
<script src="../datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
  $(document).ready(function () {
    $('#tableStudent').dataTable({
      "dom": 'lrtip',
      "lengthChange": false,
      "pageLength": 4
    });
  });
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>