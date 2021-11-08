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
        <p><span style="font-family: Arial; font-style: italic">Khu nghỉ dưỡng Furama, tọa lạc trên bãi biển Đà Nẵng, được coi là khu nghỉ dưỡng có uy tín nhất của Việt Nam, đã vinh dự đón tiếp <br>
          những vị khách nổi tiếng của hoàng gia cũng như những chính trị gia. Khu nghỉ dưỡng là cửa ngỏ đi đến 3 Di sản thế giới được <br> UNESCO
          công nhận: phố cổ Hội An, thánh địa Mỹ Sơn và cố đô Huế. Kiến trúc của Furama được pha trộn thiết kế truyền thống của<br> Việt Nam và
          kiến trúc thời Pháp thuộc, được bố trí hài hòa với 198 phòng, mỗi dãy phòng là một thiên đường của sự sang trọng và<br> khéo léo, từ
          những tông màu trang trí ấm áp và phòng tắm rộng bằng đá cẩm thạch với quạt trần và sàn gỗ đánh bóng.</span><br>

          Furama được biết đến là nơi duy nhất cung cấp dịch vụ lặn biển tại Đà Nẵng, khu nghỉ dưỡng sẽ mang đến cho du khách thích<br> khám phá
          vẻ đẹp của Đại Dương bằng việc lặn ở một trong các bãi biển sang trọng nhất thế giới, ngoài ra còn có các môn<br> thể thao dưới nước
          khác như chèo thuyền, lướt sóng, trượt nước, mô tô nước và thuyền chuối. Một bể bơi nước ngọt khổng<br> lồ được thiết kế ngay trung
          tâm của khu nghỉ dưỡng, biến khu nghỉ dưỡng nó trở thành một khu hoàn toàn tách biệt với<br> thế giới bên ngoài, mang đến sự thư giãn
          trong bầu không khí thật dịu mát. Bên cạnh đó, dịch vụ spa của khu nghỉ dưỡng <br>là nơi lý tưởng để cung cấp những phương pháp chăm
          sóc tốt nhất cho cơ thể và sắc đẹp của du khách hàng.

          Điểm nhấn của Café Indochine chính là sự đa dạng của các món ăn châu Á và sự độc đáo của các món ăn trên khắp thế giới,<br>
          được trình bày vô cùng hấp dẫn bên trong thực đơn, nhà hàng Don Cipriani’s Italia với một sự lựa chọn khó bỏ qua của<br>
          thực khách khi đến với các món ăn đậm nét truyền thống của Ý, nơi đây các món ăn luôn được chuẩn bị kỹ lưỡng cho <br>
          thực khách và phong cách phục vụ hết sức chu đáo, cùng với đó….là thức uống được pha 1 cách công phu. Với không gian<br>
          mở của quầy Bar và khu nhà hàng nằm cạnh hồ bơi đã tạo nên 1 trải nghiệm không nơi đâu có được. Nơi đây du khách sẽ <br>
          có cảm nhận được sự ấm cúm của bầu không khí khi ngồi bên “ốc đảo xanh” đã được thiết kế để du khách có thể nhận <br>
          ra sư lịch lãm, tiện nghi của khu nghỉ dưỡng khi thưởng thức các món ăn tại đây.</p>
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