
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
  <style>
    .message{
      color: aqua;
    }
  </style>
</head>
<body>
<h1>Create new product</h1>
<p>
  <c:if test='${requestScope["message"] !=null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/products">Back to product list</a>
</p>
<form method="get">
  <fieldset>
    <legend>Product information</legend>
    <table>
      <tr>
        <td>Id sản phẩm: </td>
        <td><input type="text" name="id" id="id"></td>
      </tr>
      <tr>
        <td>Tên sản phẩm: </td>
        <td><input type="text" name="name" id="name"></td>
      </tr>
      <tr>
        <td>Giá sản phẩm: </td>
        <td><input type="text" name="price" id="price"></td>
      </tr>
      <tr>
        <td>Mô tả sản phẩm: </td>
        <td><input type="description" name="description" id="description"></td>
      </tr>
      <tr>
      <td></td>
      <td><input type="submit" value="create product"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>






























