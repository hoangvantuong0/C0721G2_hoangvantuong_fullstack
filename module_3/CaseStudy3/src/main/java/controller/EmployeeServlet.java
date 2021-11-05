package controller;

import bean.employee.Division;
import bean.employee.EducationDegree;
import bean.employee.Employee;
import bean.employee.Position;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import repository.employee.IEmployeeRepository;
import repository.employee.impl.EmployeeRepository;

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

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    static IEmployeeRepository employeeRepository = new EmployeeRepository();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateEmployee(request, response);
                    break;
                case "edit":
                    showUpdateEmployee(request, response);
                    break;
                case "delete":
                    deleteEmployee(request, response);
                    break;
//                case "search":
//                    searchEmployee(request, response);
//                    break;
                default:
                    showListEmployee(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String note = request.getParameter("action");
        if (note == null) {
            note = "";
        }
        try {
            switch (note) {
//                case "create":
//                    createEmployee(request, response);
//                    break;
                case "edit":
                    try {
                        update(request, response);
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                    break;
                case "delete":
                    deleteEmployee(request, response);
                    break;
//                case "search":
//                    searchEmployee(request, response);
//                    break;
                default:
                    showListEmployee(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
//
//    public void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws
//            ServletException, IOException {
//        String employeeName = request.getParameter("employeeName");
//        List<Employee> customerList = employeeRepository.searchEmployee(employeeName);
//        if (customerList == null) {
//            request.getRequestDispatcher("error-404.jsp").forward(request, response);
//        } else {
//            request.setAttribute("employeeList", customerList);
//            request.getRequestDispatcher("employee/employee.jsp").forward(request, response);
//        }
//    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        Double salary = Double.valueOf(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int idPosition = Integer.parseInt(request.getParameter("idPosition"));
//        String positionName = request.getParameter("positionName");
        int idEduDegree = Integer.parseInt(request.getParameter("idDegree"));
//        String nameEduDegree = request.getParameter("nameEduDegree");
        int idDivision = Integer.parseInt(request.getParameter("idDivision"));
//        String nameDivision = request.getParameter("nameDivision");
        Position position = new Position();
        position.setId(idPosition);
        EducationDegree educationDegree = new EducationDegree();
        educationDegree.setId(idEduDegree);
        Division division = new Division();
        division.setId(idDivision);
        Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email, address,
                position, educationDegree, division);
        employeeRepository.updateEmployee(employee);
        showListEmployee(request, response);
    }

    public void showUpdateEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Division> division = employeeRepository.selectAllEmpDivision();
        request.setAttribute("division", division);
        List<EducationDegree> educationDegrees = employeeRepository.selectAllEmpEduDegree();
        request.setAttribute("educationDegrees", educationDegrees);
        List<Position> positions = employeeRepository.selectAllEmpPosition();
        request.setAttribute("positions", positions);
        Employee employee = employeeRepository.selectEmployee(id);
        request.setAttribute("employee", employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public static void showListEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<Employee> employeeList = new ArrayList<>();
        employeeList = employeeRepository.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list.jsp");
        dispatcher.forward(request, response);
    }

    public static void showCreateEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<Position> positions = employeeRepository.selectAllEmpPosition();
        request.setAttribute("positions", positions);
        List<EducationDegree> educationDegrees = employeeRepository.selectAllEmpEduDegree();
        request.setAttribute("educationDegrees", educationDegrees);
        List<Division> division = employeeRepository.selectAllEmpDivision();
        request.setAttribute("division", division);

        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public static void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        employeeRepository.deleteEmployee(id);
        showListEmployee(request, response);
    }
}
//    public static void createCustomer(HttpServletRequest request, HttpServletResponse response) throws
//            ServletException, IOException {
//        int id = Integer.valueOf(request.getParameter("id"));
//        String name = request.getParameter("name");
//        String birthday = request.getParameter("birthday");
//        String gender = request.getParameter("gender");
//        String idCard = request.getParameter("idCard");
//        String phone = request.getParameter("phone");
//        String email = request.getParameter("email");
//        String address = request.getParameter("address");
//        int cusTypeId = Integer.valueOf(request.getParameter("id_customer_type"));
//        String cusTypeName = request.getParameter("customer_type_name");
//        Customer customer = new Customer(id, new CustomerType(cusTypeId, cusTypeName), name,
//                birthday, gender, idCard, phone, email, address);
//        try {
//            customerRepository.insertCustomer(customer);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
//            request.setAttribute("message", "deleted");
//            dispatcher.forward(request, response);
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }
//    }
//}


