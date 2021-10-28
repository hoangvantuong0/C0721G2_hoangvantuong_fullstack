<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Deleting product</title>
</head>
<body>
<h1>Delete product</h1>
<p>
  <a href="/products">Back to product list</a>
</p>
<form method="get">
  <h3>Are you sure?</h3>
  <fieldset>
    <legend>Product information</legend>
    <table>
      <tr>
        <td>Id sản phẩm: </td>
        <td>${requestScope["product"].getId()}</td>
      </tr>
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
      <tr>
        <td><input type="submit" value="Delete product"></td>
        <td><a href="/products">Back to product list</a></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>