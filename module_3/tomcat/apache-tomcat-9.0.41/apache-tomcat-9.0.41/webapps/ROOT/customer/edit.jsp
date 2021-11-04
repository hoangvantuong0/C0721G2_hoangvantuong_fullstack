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
            <p>Nguyễn Văn An</p>
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
            <h4>Edit customer</h4>
            <p>
                <c:if test='${message != null}'>
                    <span class="message">${message}</span>
                </c:if>
            </p>
        </div>
        <div class="form-group col-12">
            <label class="col-12 ">Id:</label>
            <input type="text" name="id" class="form-control col-12  mt-2"
                   value="${customer.id}" readonly>
        </div>
        <div class="form-group col-12">
            <label class="col-12 float-left">Customer Type:</label>
            <select class="form-control" name="id_customer_type">
                <c:forEach var="type" items="${customerType}">
                    <c:choose>
                        <c:when test="${type.id == customer.getCustomerType().getId()}">
                            <option value="${type.id}" selected> ${type.name}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${type.id}">${type.name}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
        <div class="form-group col-12">
            <label class="col-12">Name:</label>
            <input type="text" name="name" class="form-control col-12 float-left mt-2"
                   value="${customer.name}">
        </div>
        <div class="form-group col-12">
            <label class="col-12">Birth day:</label>
            <input type="date" name="birthday" class="form-control col-12 float-left mt-2"
                   value="${customer.birthday}">
        </div>
        <div class="form-group col-12">
            <label class="col-12">Gender:</label>
            <input type="text" name="gender" class="form-control col-12 float-left mt-2"
                   value="${customer.gender}">
        </div>
        <div class="form-group col-12">
            <label class="col-12">Id card:</label>
            <input type="text" name="idCard" class="form-control col-12 float-left mt-2"
                   value="${customer.idCard}">
        </div>
        <div class="form-group col-12">
            <label class="col-12">Phone:</label>
            <input type="text" name="phone" class="form-control col-12 float-left mt-2"
                   value="${customer.phone}">
        </div>
        <div class="form-group col-12">
            <label class="col-12">Email:</label>
            <input type="text" name="email" class="form-control col-12 float-left mt-2"
                   value="${customer.email}">
        </div>
        <div class="form-group col-12">
            <label class="col-12">Address:</label>
            <input type="text" name="address" class="form-control col-12 float-left mt-2"
                   value="${customer.address}">
        </div>

        <div class="col-12 " style="padding: 2% 0%">
            <button type="submit" class="btn btn-primary float-right">Save</button>
            <a href="/customer">
                <button type="button" class="btn btn-info float-right">Back</button>
            </a>
        </div>
    </form>
</div>
<div class="col-12 bg-success m-auto text-light ">
    <div class="row">
        <div align="center">
            <p class="fs-6">© 2005 – 2021 welcome to Furama Resort</p>
        </div>
    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous">

</script>
</body>
</html>