<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous">
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
          <a class="nav-link text-light" href="/ervice">Contract</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success text-light" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<div class="container-fluid">
  <form class="col-6  m-auto" method="post">
    <div>
      <h4>Create new employee</h4>
      <p>
        <c:if test='${requestScope["message"] != null}'>
          <span class="message">${requestScope["message"]}</span>
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Id:</label>
      <input type="text" name="id" class="form-control col-12 float-left mt-2"
             placeholder="Enter Id" value="${employee.id}">
      <p style="color: red">
        <c:if test="${idError != null}">
          ${idError}
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Name:</label>
      <input type="text" name="name" class="form-control col-12 float-left mt-2"
             placeholder="Enter Name" value="${employee.name}">
      <p style="color: red">
        <c:if test="${nameError != null}">
          ${nameError}
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Birth day:</label>
      <input type="date" name="birthday" class="form-control col-12 float-left mt-2"
             placeholder="Enter Birth day" value="${employee.birthday}">
      <p style="color: red">
        <c:if test="${birthdayError != null}">
          ${birthdayError}
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Id card:</label>
      <input type="text" name="idCard" class="form-control col-12 float-left mt-2"
             placeholder="Enter Id card" value="${employee.idCard}">
      <p style="color: red">
        <c:if test="${IdCardError != null}">
          ${idCardError}
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Salary:</label>
      <input type="text" name="salary" class="form-control col-12 float-left mt-2"
             placeholder="Enter Salary" value="${employee.salary}">
      <p style="color: red">
        <c:if test="${salaryError != null}">
          ${salaryError}
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Phone:</label>
      <input type="text" name="phone" class="form-control col-12 float-left mt-2"
             placeholder="Enter Phone" value="${employee.phone}">
      <p style="color: red">
        <c:if test="${phoneError != null}">
          ${phoneError}
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Email:</label>
      <input type="text" name="email" class="form-control col-12 float-left mt-2"
             placeholder="Enter Email" value="${employee.email}">
      <p style="color: red">
        <c:if test="${emailError != null}">
          ${emailError}
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Address:</label>
      <input type="text" name="address" class="form-control col-12 float-left mt-2"
             placeholder="Enter Address" value="${employee.address}">
      <p style="color: red">
        <c:if test="${addressError != null}">
          ${addressError}
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Position:</label>
      <select class="form-control" name="idPosition">
        <c:forEach var="item" items="${positions}">
          <c:choose>
            <c:when test="${item.id == employee.getPosition().getId()}">
              <option value="${item.id}" selected> ${item.name}</option>
            </c:when>
            <c:otherwise>
              <option value="${item.id}">${item.name}</option>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </select>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Education Degree:</label>
      <select class="form-control" name="idDegree">
        <c:forEach var="item" items="${educationDegrees}">
          <c:choose>
            <c:when test="${item.id == employee.getEducationDegree().getId()}">
              <option value="${item.id}" selected> ${item.name}</option>
            </c:when>
            <c:otherwise>
              <option value="${item.id}">${item.name}</option>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </select>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Division:</label>
      <select class="form-control" name="idDivision">
        <c:forEach var="item" items="${division}">
          <c:choose>
            <c:when test="${item.id == employee.getDivision().getId()}">
              <option value="${item.id}" selected> ${item.name}</option>
            </c:when>
            <c:otherwise>
              <option value="${item.id}">${item.name}</option>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </select>
    </div>
    <div class="col-12 " style="padding: 2% 0%">
      <button type="submit" class="btn btn-primary float-right">Create</button>
      <a href="/customer"></a><button type="button" class="btn btn-info float-right">Back</button></a>
    </div>
  </form>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>