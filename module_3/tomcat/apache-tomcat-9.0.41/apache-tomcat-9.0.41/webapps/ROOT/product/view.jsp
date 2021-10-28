<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>View product</title>
</head>
<body>
<h1>product details</h1>
<p>
  <a href="/products">Back to customer list</a>
</p>
<table>
  <tr>
    <td>Tên sản phẩm: </td>
    <td>${requestScope["product"].getName()}</td>
  </tr>
  <tr>
    <td>Giá sản phẩm: </td>
    <td>${requestScope["product"].getPrice()}</td>
  </tr>
  <tr>
    <td>Mô tả sản phẩm: </td>
    <td>${requestScope["product"].getDescription()}</td>
  </tr>
</table>
</body>
</html>