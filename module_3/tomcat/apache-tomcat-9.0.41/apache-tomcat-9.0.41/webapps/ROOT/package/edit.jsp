<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-10">
            <img src="https://haymora.com/upload/images/cong_nghe_thong_tin/2020/codegym/codegym-logo.jpg" width="8%">
        </div>
        <div class="col-2 m-auto">
            <p>Hoàng Văn Tưởng</p>
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
            <h4>Edit Item</h4>
            <p>
                <c:if test='${requestScope["message"] != null}'>
                    <span class="message">${requestScope["message"]}</span>
                </c:if>
            </p>
        </div>
        <div class="form-group col-12">
            <label class="col-12 float-left">Mã mặt bằng:</label>
            <input type="text" name="maMatBang" class="form-control col-12 float-left mt-2"
                   placeholder="nhập mã mặt bằng" value="${matBang.getMaMatBang()}" readonly>
            <%--      <p style="color: red">--%>
            <%--        <c:if test="${idError != null}">--%>
            <%--          ${idError}--%>
            <%--        </c:if>--%>
            <%--      </p>--%>
        </div>
        <div class="form-group col-12">
            <label class="col-12 float-left">Diện Tích:</label>
            <input type="text" name="dienTich" class="form-control col-12 float-left mt-2"
                   placeholder="Nhập diện tích" value="${matBang.getDienTich()}">
            <%--      <p style="color: red">--%>
            <%--        <c:if test="${nameError != null}">--%>
            <%--          ${nameError}--%>
            <%--        </c:if>--%>
            <%--      </p>--%>
        </div>
        <div class="form-group col-12">
            <label class="col-12 float-left">Trạng thái:</label>
            <select class="form-control" name="maTrangThai">
                <c:forEach var="trangthai" items="${trangThaiList}">
                    <c:choose>
                        <c:when test="${trangthai.maTrangThai == matBang.getMaTrangThai().getMaTrangThai()}">
                            <option value="${trangthai.maTrangThai}" selected> ${trangthai.tenTrangThai}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${trangthai.maTrangThai}">${trangthai.tenTrangThai}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
        <div class="form-group col-12">
            <label class="col-12 float-left">Tầng:</label>
            <input type="text" name="tang" class="form-control col-12 float-left mt-2"
                   placeholder="Nhập số tầng" value="${matBang.getTang()}">
            <%--      <p style="color: red">--%>
            <%--        <c:if test="${birthdayError != null}">--%>
            <%--          ${birthdayError}--%>
            <%--        </c:if>--%>
            <%--      </p>--%>
        </div>
        <div class="form-group col-12">
            <label class="col-12 float-left">Loại mặt bằng:</label>
            <select class="form-control" name="maLoaiVanPhong">
                <c:forEach var="loaivanphong" items="${loaiVanPhongList}">
                    <c:choose>
                        <c:when test="${loaivanphong.maLoaiVanPhong == matBang.getMaLoaiVanPhong().getMaLoaiVanPhong()}">
                            <option value="${loaivanphong.maLoaiVanPhong}" selected> ${loaivanphong.tenLoaiVanPhong}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${loaivanphong.maLoaiVanPhong}">${loaivanphong.tenLoaiVanPhong}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
        <div class="form-group col-12">
            <label class="col-12 float-left">Giá cho thuê</label>
            <input type="text" name="giaChoThue" class="form-control col-12 float-left mt-2"
                   placeholder="Nhập giá cho thuê" value="${matBang.getGiaChoThue()}">
            <%--      <p style="color: red">--%>
            <%--        <c:if test="${idCardError != null}">--%>
            <%--          ${idCardError}--%>
            <%--        </c:if>--%>
            <%--      </p>--%>
        </div>
        <div class="form-group col-12">
            <label class="col-12 float-left">Ngày bắt đầu:</label>
            <input type="date" name="ngayBatDau" class="form-control col-12 float-left mt-2"
                   placeholder="Nhập ngày bắt đầu" value="${matBang.getNgayBatDau()}">
            <%--      <p style="color: red">--%>
            <%--        <c:if test="${phoneError != null}">--%>
            <%--          ${phoneError}--%>
            <%--        </c:if>--%>
            <%--      </p>--%>
        </div>
        <div class="form-group col-12">
            <label class="col-12 float-left">Ngày kết thúc:</label>
            <input type="date" name="ngayKetThuc" class="form-control col-12 float-left mt-2"
                   placeholder="Nhập ngày kết thúc" value="${matBang.getNgayKetThuc()}">
            <%--      <p style="color: red">--%>
            <%--        <c:if test="${phoneError != null}">--%>
            <%--          ${phoneError}--%>
            <%--        </c:if>--%>
            <%--      </p>--%>
        </div>
        <div class="col-12 " style="padding: 2% 0%">
            <button type="submit" class="btn btn-primary float-right">Save</button>
            <a href="/matbang">
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