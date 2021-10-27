<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Calculator</title>
  </head>
  <body>
<form action="/calculator" method="post">
  <h2>First operand <input type="text" name="first-Operand"></h2>
  <h2>Operand <select name="operator">
    <option value="+">Addition</option>
    <option value="-">Subtraction</option>
    <option value="*">Multiplication</option>
    <option value="/">Division</option>
  </select> </h2>
  <h2>Second operand <input type="text" name="second-Operand"></h2>
  <h2><input type="submit" value="Calculate"></h2>

</form>

  </body>
</html>








