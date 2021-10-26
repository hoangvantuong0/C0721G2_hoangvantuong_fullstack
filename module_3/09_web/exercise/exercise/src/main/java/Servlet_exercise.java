import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet_exercise", value = "/exchange")
public class Servlet_exercise extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      double price = Double.parseDouble(request.getParameter("price"));
      double percent = Double.parseDouble(request.getParameter("percent"));
      double discount = price*percent*0.01;
      double discountPrice = price - discount;

      request.setAttribute("discount", discount);
    request.setAttribute("discountPrice", discountPrice);
    request.getRequestDispatcher("result.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
