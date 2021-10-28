<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit product</title>
</head>
<body>
<h1>Edit product</h1>
<p>
  <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/products">Quay lại danh sách sản phẩm</a>
</p>
<form method="get">
  <fieldset>
    <legend>Thông tin sản phẩm</legend>
    <table>
      <tr>
        <td>id sản phẩm: </td>
        <td><input type="text" name="id" id="id" value="${requestScope["product"].getId()}"></td>
      </tr>
      <tr>
        <td>Tên sản phẩm: </td>
        <td><input type="text" name="name" id="name" value="${requestScope["product"].getName()}"></td>
      </tr>
      <tr>
        <td>Giá sản phẩm: </td>
        <td><input type="text" name="price" id="price" value="${requestScope["product"].getPrice()}"></td>
      </tr>
      <tr>
        <td>Mô tả sản phẩm: </td>
        <td><input type="text" name="description" id="description" value="${requestScope["product"].getDescription()}"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Update product"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>