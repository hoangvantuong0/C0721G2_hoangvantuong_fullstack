<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Create new customer</title>
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
<div class="container-fluid">
  <form class="col-6  m-auto" method="post">
    <div>
      <h4>Create new customer</h4>
      <p>
        <c:if test='${requestScope["message"] != null}'>
          <span class="message">${requestScope["message"]}</span>
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Id:</label>
      <input type="text" name="id" class="form-control col-12 float-left mt-2"
             placeholder="Enter Id like this pattern KH-1234" value="${customer.getId()}">
      <p style="color: red">
        <c:if test="${idError != null}">
          ${idError}
        </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left mt-1">Customer type:</label>
      <select name="id_customer_type" class="form-control col-12 float-left">
        <option>Chose option ...</option>
        <c:forEach var="item" items="${customerTypeList}">
          <option value="${item.getId()}"> ${item.getId()} - ${item.getName()} </option>
        </c:forEach>
      </select>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Name:</label>
      <input type="text" name="name" class="form-control col-12 float-left mt-2"
             placeholder="Enter Name" value="${customer.getName()}">
      <p style="color: red">
      <c:if test="${nameError != null}">
        ${nameError}
      </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Birth day:</label>
      <input type="date" name="birthday" class="form-control col-12 float-left mt-2"
             placeholder="Enter Birthday like this pattern 1990-12-12" value="${customer.getBirthday()}">
<%--      <p style="color: red">--%>
<%--      <c:if test="${birthdayError != null}">--%>
<%--        ${birthdayError}--%>
<%--      </c:if>--%>
<%--      </p>--%>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Gender:</label>
      <select name="gender" class="form-control col-12 float-left">
        <option>Chose option ...</option>
          <c:choose>
            <c:when test="${customer.gender}">
              <option value="${customer.gender}" selected> ${customer.gender}</option>
            </c:when>
            <c:otherwise>
              <option value="Nam">Nam</option>
              <option value="Nữ">Nữ</option>
            </c:otherwise>
          </c:choose>
        <p style="color: red">
          <c:if test="${genderError != null}">
            ${genderError}
          </c:if>
        </p>
      </select>

    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Id card:</label>
      <input type="text" name="idCard" class="form-control col-12 float-left mt-2"
             placeholder="Enter Id card with 9 numerals" value="${customer.getIdCard()}">
      <p style="color: red">
      <c:if test="${idCardError != null}">
        ${idCardError}
      </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Phone:</label>
      <input type="text" name="phone" class="form-control col-12 float-left mt-2"
             placeholder="Enter like this pattern 0901245666 or (84)+901324455" value="${customer.getPhone()}">
      <p style="color: red">
      <c:if test="${phoneError != null}">
        ${phoneError}
      </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Email:</label>
      <input type="text" name="email" class="form-control col-12 float-left mt-2"
             placeholder="Enter Email like this pattern abc@gmail.com" value="${customer.getEmail()}">
      <p style="color: red">
      <c:if test="${emailError != null}">
        ${emailError}
      </c:if>
      </p>
    </div>
    <div class="form-group col-12">
      <label class="col-12 float-left">Address:</label>
      <input type="text" name="address" class="form-control col-12 float-left mt-2"
             placeholder="Enter Address like this pattern Da Nang" value="${customer.getAddress()}">
      <p style="color: red">
      <c:if test="${addressError != null}">
        ${addressError}
      </c:if>
      </p>
    </div>
    <div class="col-12 " style="padding: 2% 0%">
      <button type="submit" class="btn btn-primary float-right">Create</button>
      <a href="/customer">
        <button type="button" class="btn btn-info float-right">Back</button>
      </a>
    </div>
  </form>
</div>
<div class="col-12 bg-success m-auto text-light ">
  <div class="row">
    <div align="center">
      <p class="fs-6">Welcome to furama resort</p>
    </div>
  </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
