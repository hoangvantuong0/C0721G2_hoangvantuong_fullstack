package controller;

import bean.customer.Customer;
import bean.customer.CustomerType;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
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
                case "create":
                    createCustomer(request, response);
                    break;
                case "edit":
                    try {
                        update(request, response);
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                case "search":
                    searchCustomer(request, response);
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
                case "delete":
                    deleteCustomer(request, response);
                    break;
               case "search":
                    searchCustomer(request, response);
                    break;
                default:
                    showListCustomer(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    public void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String customerName = request.getParameter("customerName");
        List< Customer > customerList = customerRepository.searchCustomer(customerName);
        if (customerList == null) {
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("customerList", customerList);
            request.getRequestDispatcher("customer/customer.jsp").forward(request, response);
        }
    }
    private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = String.valueOf(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int cusTypeId = Integer.valueOf(request.getParameter("id_customer_type"));
        String cusTypeName = request.getParameter("customer_type_name");
        Customer customer = new Customer(id, new CustomerType(cusTypeId, cusTypeName), name,
                birthday, gender, idCard, phone, email, address);
        customerRepository.updateCustomer(customer);
        showListCustomer(request, response);
    }
        public void showUpdateCustomer(HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {
            int id = Integer.parseInt(request.getParameter("id"));
            List< CustomerType > customerType = customerRepository.selectAllCustomerType();
            request.setAttribute("customerType", customerType);
            Customer customer = customerRepository.selectCustomer(id);
            request.setAttribute("customer", customer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
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

    public static void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        customerRepository.deleteCustomer(id);
        showListCustomer(request, response);

    }

    public static void createCustomer(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int cusTypeId = Integer.valueOf(request.getParameter("id_customer_type"));
        String cusTypeName = request.getParameter("customer_type_name");
        Customer customer = new Customer(id, new CustomerType(cusTypeId, cusTypeName), name,
                birthday, gender, idCard, phone, email, address);
        try {
            customerRepository.insertCustomer(customer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
            request.setAttribute("message", "deleted");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}








































