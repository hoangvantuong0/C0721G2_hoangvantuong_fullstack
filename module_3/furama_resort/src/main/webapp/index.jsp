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
  <div class="row">
    <div class="col-3 ">
      <img src="https://cdn1.ivivu.com/iVivu/2019/11/28/13/furama-resort-da-nang-1-cr-800x450.jpg"
           width="100%">
      <img src=https://resortdanang.info/wp-content/uploads/2019/01/resort-furama-da-nang-1024x576.jpg
           width="100%">
      <img src="https://dulichbiendanang.net/wp-content/uploads/2020/12/gioi-thieu-ve-furama-resort-Da-Nang-2.jpg"
           width="100%">
    </div>
    <div class="col-9">
      <div class="col-12">
        <p>Body</p>
      </div>


    </div>

  </div>

</div>
<div class="container-fluid bg-success text-light ">
  <div class="row">
    <div align="center">
      <p class="fs-6">© Welcome to Furama resort.</p>
    </div>
  </div>

</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>