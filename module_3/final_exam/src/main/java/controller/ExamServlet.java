package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ExamServlet", value = "/ExamServlet")
public class ExamServlet extends HttpServlet {
//    public static ICustomerRepository customerRepository = new CustomerRepository();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String note = request.getParameter("note");
//        if (note == null) {
//            note = "";
//        }
//        try {
//            switch (note) {
//                case "create":
//                    showFormAddCustomer(request, response);
//                    break;
//                case "edit":
//                    showCustomerEdit(request, response);
//                    break;
//                case "delete":
//                    deleteCustomer(request, response);
//                    break;
//                default:
//                    showListCustomer(request, response);
//                    break;
//            }
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String note = request.getParameter("note");
//        if (note == null) {
//            note = "";
//        }
//        try {
//            switch (note) {
//                case "create":
//                    createNewCustomer(request, response);
//                    break;
//                case "edit":
//                    editCustomer(request, response);
//                    break;
//                case "search":
//                    searchCustomer(request, response);
//                    break;
//                default:
//                    showListCustomer(request, response);
//                    break;
//            }
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }
    }

//    public void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws
//            ServletException, IOException {
//        String customerName = request.getParameter("customerName");
//        String customerTypeName = request.getParameter("customerTypeName");
//        String address = request.getParameter("address");
//        List<Customer> customerList = customerRepository.searchCustomer(customerName, customerTypeName, address);
//        if (customerList.size() == 0) {
//            request.getRequestDispatcher("error-404.jsp").forward(request, response);
//        } else {
//            request.setAttribute("customerList", customerList);
//            request.getRequestDispatcher("customer/list.jsp").forward(request, response);
//        }
//    }
//
//    public void showCustomerEdit(HttpServletRequest request, HttpServletResponse response) throws
//            ServletException, IOException {
//        String id = request.getParameter("id");
//        List<CustomerType> customerTypeList = selectCustomerType();
//        request.setAttribute("customerTypeList", customerTypeList);
//        Customer customer = customerRepository.selectCustomer(id);
//        request.setAttribute("customer", customer);
//        request.getRequestDispatcher("customer/edit.jsp").forward(request, response);
//    }
//
//    public void editCustomer(HttpServletRequest request, HttpServletResponse response) throws
//            ServletException, IOException {
//        String id = request.getParameter("id");
//        String name = request.getParameter("name");
//        String birthday = request.getParameter("birthday");
//        String idCard = request.getParameter("idCard");
//        String gender = request.getParameter("gender");
//        String phone = request.getParameter("phone");
//        String email = request.getParameter("email");
//        String address = request.getParameter("address");
//        String customerTypeId = request.getParameter("customerTypeId");
//        CustomerType customerType = new CustomerType();
//        customerType.setId(customerTypeId);
//        Customer customer = new Customer(id, customerType, name, birthday, gender, idCard, phone, email, address);
//        System.out.println(customer.toString());
//
//        if (customer == null) {
//            request.getRequestDispatcher("error-404.jsp");
//        } else {
//            customerRepository.updateCustomer(customer);
//            request.setAttribute("message", "Customer information was updated");
//            request.getRequestDispatcher("customer/edit.jsp").forward(request, response);
//
//        }
//    }
//
//    public void showFormAddCustomer(HttpServletRequest request, HttpServletResponse response) throws
//            ServletException, IOException {
//        List<CustomerType> customerTypeList = selectCustomerType();
//        request.setAttribute("customerTypeList", customerTypeList);
//        request.getRequestDispatcher("customer/create.jsp").forward(request, response);
//    }
//
//    public void createNewCustomer(HttpServletRequest request, HttpServletResponse response) throws
//            ServletException, IOException {
//
//        boolean flag = false;
//        String idError = "";
//        String nameError = "";
//        String birthdayError = "";
//        String idCardError = "";
//        String phoneError = "";
//        String emailError = "";
//        String addressError = "";
//        String genderError = "";
//        String id = request.getParameter("id");
//        if (Validate.checkRegex(id, Validate.ID_CUSTOMER)) {
//            flag = true;
//            idError = "Error input! please input like this pattern: KH-1234";
//        }
//
//        String name = request.getParameter("name");
//        if (Validate.checkRegex(name, Validate.NAME_REGEX)) {
//            flag = true;
//            nameError = "Error input! please input like this pattern: A-Z a-Z ";
//        }
//
//        String birthday = request.getParameter("birthday");
//        if (Validate.checkRegex(birthday, Validate.DATE_REGEX)) {
//            flag = true;
//            birthdayError = "Error input! please input like this pattern: 1990-12-12";
//        }
//
//        String gender = request.getParameter("gender");
//        if (gender == "") {
//            flag = true;
//            genderError = "Error input! please choose one";
//        }
//
//        String idCard = request.getParameter("idCard");
//        if (Validate.checkRegex(idCard, Validate.ID_CARD_REGEX)) {
//            flag = true;
//            idCardError = "Error input! please input like this pattern: 123456789";
//        }
//
//        String phone = request.getParameter("phone");
//        if (Validate.checkRegex(phone, Validate.PHONE_REGEX)) {
//            flag = true;
//            phoneError = "Error input! please input like this pattern: 0901245666 or (84)+901324455";
//        }
//
//        String email = request.getParameter("email");
//        if (Validate.checkRegex(email, Validate.EMAIL_REGEX)) {
//            flag = true;
//            emailError = "Error input! please input like this pattern: abc@gmail.com";
//        }
//
//        String address = request.getParameter("address");
//        if (Validate.checkRegex(address, Validate.NAME_REGEX)) {
//            flag = true;
//            addressError = "Error input! please input like this pattern: codeGym da nang";
//        }
//
//        String cusTypeId = request.getParameter("id_customer_type");
//        CustomerType customerType = new CustomerType();
//        customerType.setId(cusTypeId);
//        Customer customer = new Customer(id, customerType, name,
//                birthday, gender, idCard, phone, email, address);
//
//        if (flag) {
//            request.setAttribute("idCardError", idCardError);
//            request.setAttribute("nameError", nameError);
//            request.setAttribute("birthdayError", birthdayError);
//            request.setAttribute("addressError", addressError);
//            request.setAttribute("phoneError", phoneError);
//            request.setAttribute("idError", idError);
//            request.setAttribute("emailError", emailError);
//            request.setAttribute("genderError", genderError);
//            request.setAttribute("customer", customer);
//            showFormAddCustomer(request, response);
//
//        }
//
//        customerRepository.insertCustomer(customer);
//        request.setAttribute("message", "New customer was created");
//        request.getRequestDispatcher("customer/create.jsp").forward(request, response);
//    }
//
//    public void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws
//            ServletException, IOException {
//        String id = request.getParameter("id");
//        customerRepository.deleteCustomer(id);
//        response.sendRedirect("/customer");
//    }
//
//    public static void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws
//            ServletException, IOException {
//        List<Customer> customerList = customerRepository.selectAllCustomer();
//        request.setAttribute("customerList", customerList);
//        request.getRequestDispatcher("customer/list.jsp").forward(request, response);
//    }
}
