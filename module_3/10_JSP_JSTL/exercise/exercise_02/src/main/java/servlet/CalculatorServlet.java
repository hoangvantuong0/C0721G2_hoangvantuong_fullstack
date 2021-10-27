package servlet;

import bean.Calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = {"/calculator"})
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("first-Operand"));
        float secondOperand = Float.parseFloat(request.getParameter("second-Operand"));
        String result;
        char operator = request.getParameter("operator").charAt(0);
        try {
            result = String.valueOf(Calculator.calculate(firstOperand, secondOperand, operator));
        } catch (RuntimeException e){
            result = "can not divide for zero";
        }
        request.setAttribute("resultServlet", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
