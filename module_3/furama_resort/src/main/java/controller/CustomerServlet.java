package controller;

import bean.customer.Customer;
import bean.customer.CustomerType;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import static util.CommonMethod.selectCustomerType;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    public static ICustomerRepository customerRepository = new CustomerRepository();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String note = request.getParameter("note");
        if (note == null) {
            note = "";
        }
        try {
            switch (note) {
                case "create":
                    showFormAddCustomer(request, response);
                    break;
                case "edit":
                    showCustomerEdit(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                default:
                    showListCustomer(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String note = request.getParameter("note");
        if (note == null) {
            note = "";
        }
        try {
            switch (note) {
                case "create":
                    createNewCustomer(request, response);
                    break;
                case "edit":
                    editCustomer(request, response);
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
        String customerTypeName = request.getParameter("customerTypeName");
        String address = request.getParameter("address");
        List< Customer > customerList = customerRepository.searchCustomer(customerName,customerTypeName,address);
        if (customerList.size() == 0) {
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("customerList", customerList);
            request.getRequestDispatcher("customer/list.jsp").forward(request, response);
        }
    }

    public void showCustomerEdit(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String id = request.getParameter("id");
        List< CustomerType > customerTypeList = selectCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        Customer customer = customerRepository.selectCustomer(id);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("customer/edit.jsp").forward(request, response);
    }

    public void editCustomer(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String customerTypeId = request.getParameter("customerTypeId");
        CustomerType customerType = new CustomerType();
        customerType.setId(customerTypeId);
        Customer customer = new Customer(id, customerType, name, birthday,gender, idCard, phone, email, address);
        System.out.println(customer.toString());

        if (customer == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            customerRepository.updateCustomer(customer);
            request.setAttribute("message", "Customer information was updated");
            request.getRequestDispatcher("customer/edit.jsp").forward(request, response);

        }
    }

    public void showFormAddCustomer(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List< CustomerType > customerTypeList = selectCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        request.getRequestDispatcher("customer/create.jsp").forward(request, response);
    }

    public void createNewCustomer(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String cusTypeId = request.getParameter("id_customer_type");
        CustomerType customerType = new CustomerType();
        customerType.setId(cusTypeId);
        Customer customer = new Customer(id, customerType, name,
                birthday, gender, idCard, phone, email, address);
        customerRepository.insertCustomer(customer);
        request.setAttribute("message", "New customer was created");
        request.getRequestDispatcher("customer/create.jsp").forward(request, response);
    }

    public void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String id = request.getParameter("id");
            customerRepository.deleteCustomer(id);
            response.sendRedirect("/customer");
        }

    public static void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<Customer> customerList = customerRepository.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customer/list.jsp").forward(request, response);
    }
}