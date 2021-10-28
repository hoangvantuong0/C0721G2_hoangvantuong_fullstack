<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 28/10/2021
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/products?actionUser=create">Create new product</a>
</p>
<table border="1px">
    <tr>
        <td>Id sản phẩm</td>
        <td>Tên sản phẩm</td>
        <td>Giá sản phẩm</td>
        <td>Mô tả sản phẩm</td>
        <td>Cập nhật</td>
        <td>Xoá sản phẩm</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/products?actionUser=view&id=${product.getId()}">${product.getId()}</a> </td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td><a href="/products?actionUser=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/products?actionUser=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>


















