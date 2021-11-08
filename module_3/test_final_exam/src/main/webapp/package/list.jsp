<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <div class="col-10">
      <img src="https://haymora.com/upload/images/cong_nghe_thong_tin/2020/codegym/codegym-logo.jpg"  width="8%">
    </div>
    <div class="col-2 m-auto">
      <p>Final Exam</p>
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
          <a class="nav-link active text-light" aria-current="page" href="">Home</a>
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
              <a class="text-white" href="/matbang?note=create">Add New Item</a>
            </button>
          </div>
          <div class="col-3">
            <form action="/home?employee-notice=employee&note=sort" method="post">
              <button type="submit" class="btn btn-primary text-white">Sort by name</button>
            </form>
          </div>
          <div class="col-6" style="text-align: right">
            <form method="post" action="/matbang?note=search">
              <input type="text" name="loaiMatBang" placeholder="Input loại mặt bằng">
              <input type="text" name="giaTien" placeholder="Input giá tiền ">
              <input type="text" name="tang" placeholder="Input số tầng">
              <button type="submit">TÌm kiếm</button>
            </form>
          </div>
        </div>
      </div>
      <div class="container">
        <table class="table table-bordered">
          <thead>
          <tr>
            <th>Mã mặt bằng</th>
            <th>Diện Tích</th>
            <th>Trạng Thái</th>
            <th>Tầng</th>
            <th>Loại Văn Phòng</th>
            <th>Giá cho thuê</th>
            <th>Ngày Bắt Đầu</th>
            <th>Ngày Kết Thúc</th>
            <th>Edit & Delete</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="matbang" items="${matBangList}">
            <tr>
              <td>${matbang.maMatBang}</td>
              <td>${matbang.dienTich}</td>
              <td>${matbang.maTrangThai.tenTrangThai}</td>
              <td>${matbang.tang}</td>
              <td>${matbang.maLoaiVanPhong.tenLoaiVanPhong}</td>
              <td>${matbang.giaChoThue}</td>
              <td>${matbang.ngayBatDau}</td>
              <td>${matbang.ngayKetThuc}</td>
              <td class="text-center">
                <a href="/matbang?note=edit&maMatBang=${matbang.getMaMatBang()}"
                   role="button" class="btn btn-large btn-warning">Edit</a>

                <button type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#exampleModal-${matbang.maMatBang}">
                  Xoá
                </button>
              </td>
            </tr>
            <div class="modal fade" id="exampleModal-${matbang.maMatBang}" tabindex="-1" role="dialog"
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
                    Bạn có muốn xoá customer có id =${matbang.maMatBang} không?
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                    </button>
                    <a href="/matbang?note=delete&maMatBang=${matbang.maMatBang}" role="button">Xác nhận</a>
                  </div>
                </div>
              </div>
            </div>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>

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