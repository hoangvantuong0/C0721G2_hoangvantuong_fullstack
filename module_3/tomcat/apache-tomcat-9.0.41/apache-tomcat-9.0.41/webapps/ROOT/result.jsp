<%--
  Created by IntelliJ IDEA.
  User: macbook
  Date: 26/10/2021
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3> Amount</h3>
<%=request.getAttribute("discount")%>
<h3> DiscountPrice</h3>
<%=request.getAttribute("discountPrice")%>
</body>
</html>
