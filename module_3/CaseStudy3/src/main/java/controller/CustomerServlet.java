package controller;

import bean.customer.Customer;
import bean.customer.CustomerType;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    static ICustomerRepository customerRepository = new CustomerRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String note = request.getParameter("action");
        if (note == null) {
            note = "";
        }
        try {
            switch (note) {
//                case "create":
//                    createCustomer(request, response);
//                    break;
//                case "edit":
//                    editCustomer(request, response);
//                    break;
//                case "delete":
//                    deleteCustomer(request, response);
//                    break;
                case "search":
                    break;
                default:
                    showListCustomer(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateCustomer(request, response);
                    break;
                case "edit":
                    showUpdateCustomer(request, response);
                    break;
//                case "delete":
//                    showDeleteEmployee(request, response);
//                    break;
//                case "search":
//                    break;
                default:
                    showListCustomer(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    public static void showUpdateCustomer(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
       Customer customer = customerRepository.findById(id);
       List<CustomerType> customerTypeList = customerRepository.selectAllCustomerType();
        request.setAttribute("customer", customer);
        request.setAttribute("customerList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/update.jsp");
        try{
            dispatcher.forward(request, response);
        }catch (ServletException | IOException e){
            e.printStackTrace();
        }
    }
    public static void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList = customerRepository.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/customer.jsp");
        dispatcher.forward(request, response);
    }

    public static void showCreateCustomer(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<CustomerType> customerTypeList = customerRepository.selectAllCustomerType();
        request.setAttribute("customerType", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
































