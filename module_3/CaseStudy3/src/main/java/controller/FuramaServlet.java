package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FuramaServlet", urlPatterns = {"","/FuramaServlet"})
public class FuramaServlet extends HttpServlet {
//    IEmployeeRepository employeeRepository = new EmployeeRepository();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String notice = request.getParameter("notice");
        if (notice == null) {
            notice = "";
        } else {
//            switch (notice) {
//                case "employee":
//                    showListEmployee(request,response);
//                    break;
//                case "customer":
//                    response.sendRedirect("customer/list.jsp");
//                    break;
//                case "service":
//                    response.sendRedirect("service/list.jsp");
//                    break;
//                case "contract":
//                    response.sendRedirect("contract/list.jsp");
//                    break;
//                default:
//                    response.sendRedirect("/home");
//                    break;
//            }
//        }
//    }
}
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
