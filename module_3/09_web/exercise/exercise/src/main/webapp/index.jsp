<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 26/10/2021
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
<form action="/exchange" method="get" >
    <p>Product Description:</p>
    <input type="text" name="description">
  <p>List Price::</p>
  <input type="text" name="price">
  <p>Discount Percent:</p>
  <input type="text" name="percent">
  <input type="submit">
</form>
  </body>
</html>
