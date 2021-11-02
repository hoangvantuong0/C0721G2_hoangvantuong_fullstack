<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 02/11/2021
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-10">
<img src="data:image/jpeg;base64,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" data-deferred="1" class="rg_i Q4LuWd" jsname="Q4LuWd" width="180" height="180" alt="Chủ đầu tư FURAMA" data-iml="1199.8999999910593" data-atf="true">
        </div>
        <div class="col-2 m-auto">
            <p>Nguyễn Văn A</p>
        </div>
    </div>
</div>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Employee</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Customer</a></li>
                        <li><a class="dropdown-item" href="#">Service</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Contract</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled">Disabled</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav><nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent2">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled">Disabled</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
