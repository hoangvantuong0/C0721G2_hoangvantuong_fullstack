<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous">
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
      <h4>Edit employee</h4>
      <p>
        <c:if test='${message != null}'>
          <span class="message">${message}</span>
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 ">Id:</label>
      <input type="text" name="id" class="form-control col-12  mt-2"
             value="${employee.id}" readonly>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Name:</label>
      <input type="text" name="name" class="form-control col-12 float-left mt-2"
             value="${employee.name}">
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Birth day:</label>
      <input type="text" name="birthDay" class="form-control col-12 float-left mt-2"
             value="${employee.birthDay}">
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Id card:</label>
      <input type="text" name="idCard" class="form-control col-12 float-left mt-2"
             value="${employee.idCard}">
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Salary:</label>
      <input type="text" name="salary" class="form-control col-12 float-left mt-2"
             value="${employee.salary}">
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Phone:</label>
      <input type="text" name="phone" class="form-control col-12 float-left mt-2"
             value="${employee.phone}">
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Email:</label>
      <input type="text" name="email" class="form-control col-12 float-left mt-2"
             value="${employee.email}">
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Address:</label>
      <input type="text" name="address" class="form-control col-12 float-left mt-2"
             value="${employee.address}">
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Position:</label>
      <select class="form-control" name="positionId">
        <c:forEach var="position" items="${positionList}">
          <c:choose>
            <c:when test="${position.id == employee.getPosition().getId()}">
              <option value="${position.id}" selected> ${position.name}</option>
            </c:when>
            <c:otherwise>
              <option value="${position.id}">${position.name}</option>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </select>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Education Degree:</label>
      <select class="form-control" name="degreeId">
        <c:forEach var="degree" items="${degreeList}">
          <c:choose>
            <c:when test="${degree.id == employee.getEducationDegree().getId()}">
              <option value="${degree.id}" selected> ${degree.name}</option>
            </c:when>
            <c:otherwise>
              <option value="${degree.id}">${degree.name}</option>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </select>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Division:</label>
      <select class="form-control" name="divisionId">
        <c:forEach var="division" items="${divisionList}">
          <c:choose>
            <c:when test="${division.id == employee.getDivision().getId()}">
              <option value="${division.id}" selected> ${division.name}</option>
            </c:when>
            <c:otherwise>
              <option value="${division.id}">${division.name}</option>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </select>
    </div>
    <div class="col-12 " style="padding: 2% 0%">
      <button type="submit" class="btn btn-primary float-right">Save</button>
      <a href="">
        <button type="button" class="btn btn-info float-right">Back</button>
      </a>
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
>