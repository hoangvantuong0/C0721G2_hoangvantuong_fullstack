<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Customer List</title>
  </head>
  <body>
  <h2>Customer List</h2>
  <table border="1px">
    <tr>
      <th>Số thứ tự</th>
      <th>Tên</th>
      <th>Ngày sinh</th>
      <th>Địa chỉ</th>
      <th>Ảnh</th>

    </tr>
    <c:forEach var="CustomerObj" items="${customerServletList}" varStatus="loop">
    <tr>
      <td>${loop.count}</td>
      <td><c:out value="${CustomerObj.name}"/></td>
      <td><c:out value="${CustomerObj.dateOfBirth}"/></td>
      <td><c:out value="${CustomerObj.address}"/></td>
      <td><img src=" <c:out value="${CustomerObj.img}"/>" width="100px"></td>
    </tr>
    </c:forEach>
  </table>
  </body>
</html>
