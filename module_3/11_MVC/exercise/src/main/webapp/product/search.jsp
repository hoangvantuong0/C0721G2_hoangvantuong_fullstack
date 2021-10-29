<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 28/10/21
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>List by Search</title>
</head>
<body>
<p>
  <a href="/products">Back to product list</a>
</p>
<table border="1">
  <tr>
    <th>id</th>
    <th>Name</th>
    <th>Price</th>
    <th>Description</th>
  </tr>
  <c:forEach items='${requestScope["productList"]}' var="product">
    <tr>
      <td>${product.getId()}</td>
      <td>${product.getName()}</td>
      <td>${product.getPrice()}</td>
      <td>${product.getDescription()}</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>