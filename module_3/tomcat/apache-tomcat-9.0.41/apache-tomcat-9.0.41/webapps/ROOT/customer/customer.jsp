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
            <img src="https://sohanews.sohacdn.com/2017/2-1509544156756.jpg" width="30%">
        </div>
        <div class="col-2 m-auto">
            <p>Nguyễn Văn A</p>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid bg-success ">
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
                    <a class="nav-link text-light" href="/home/?notice=employee">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light" href="/home?notice=customer">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light" href="/home?notice=service">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-light" href="/home?notice=contract">Contract</a>
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
        <div class="col-12">
            <div class="container col-12">
                <div class="row">
                    <div class="col-3">
                        <button class="btn btn-primary text-white">
                            <a class="text-white" href="/customer?action=create">Add new user</a>
                        </button>
                    </div>
                    <div class="col-3">
                        <form action="/home?employee-notice=employee&note=sort" method="post">
                            <button type="submit" class="btn btn-primary text-white">Sort by name</button>
                        </form>
                    </div>
                    <div class="col-6" style="text-align: right">
                        <form action="/home?notice=employee&note=search" method="post">
                            <label> <input type="search" name="countryName" placeholder="Country name"></label>
                            <button type="submit" class="btn btn-primary text-white">Search</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="container">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Birth Day</th>
                        <th>Gender</th>
                        <th>Id Card</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Customer Type Id</th>
                        <th>Customer Type Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="customer" items="${customerList}">
                        <tr>
                            <td>${customer.id}</td>
                            <td>${customer.name}</td>
                            <td>${customer.birthday}</td>
                            <td>${customer.gender}</td>
                            <td>${customer.idCard}</td>
                            <td>${customer.phone}</td>
                            <td>${customer.email}</td>
                            <td>${customer.address}</td>
                            <td>${customer.customerType.id}</td>
                            <td>${customer.customerType.name}</td>
                            <td><a href="home?notice=customer&action=edit&id=${customer.id}">Edit</a></td>
                            <td><a href="home?notice=delete&note=delete&id=${customer.id}">Delete</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>

    </div>

</div>


</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>