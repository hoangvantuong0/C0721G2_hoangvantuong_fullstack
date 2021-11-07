package controller;

import bean.employee.Division;
import bean.employee.EducationDegree;
import bean.employee.Employee;
import bean.employee.Position;
import repository.employee.IEmployeeRepository;
import repository.employee.impl.EmployeeRepository;
import util.Validate;

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
                case "search":
                    searchEmployee(request, response);
                    break;
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
                case "create":
                    createEmployee(request, response);
                    break;
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
                case "search":
                    searchEmployee(request, response);
                    break;
                default:
                    showListEmployee(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String employeeName = request.getParameter("employeeName");
        String phone = request.getParameter("employeePhone");
        String address = request.getParameter("employeeAddress");
        List<Employee> employeeList = employeeRepository.searchEmployee(employeeName, phone, address);
        if (employeeList == null) {
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("employeeList", employeeList);
            request.getRequestDispatcher("employee/list.jsp").forward(request, response);
        }
//        String name = request.getParameter("nameSearch");
//        String phone = request.getParameter("phoneSearch");
//        String address = request.getParameter("addressSearch");
//        List<Employee> listSearch = iEmployeeService.searchEmployee(name,phone,address);
//        request.setAttribute("listSearch",listSearch);
//        request.getRequestDispatcher("employee/search.jsp").forward(request,response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        Double salary = Double.valueOf(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String idPosition = request.getParameter("idPosition");
//        String positionName = request.getParameter("positionName");
        String idEduDegree = request.getParameter("idDegree");
//        String nameEduDegree = request.getParameter("nameEduDegree");
        String idDivision = request.getParameter("idDivision");
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
        String id = request.getParameter("id");
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
        String id = request.getParameter("id");
        employeeRepository.deleteEmployee(id);
        showListEmployee(request, response);
    }

    public static void createEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

        Boolean flag = false;
        String idError = "";
        String nameError = "";
        String birthdayError = "";
        String idCardError = "";
        String salaryError = "";
        String phoneError = "";
        String emailError = "";
        String addressError = "";
        String id = request.getParameter("id");
        if (Validate.checkRegex(String.valueOf(id), Validate.NUMBER_REGEX)) {
            flag = true;
            idError = "wrong format! please input again!";
        }

        String name = request.getParameter("name");
        if (Validate.checkRegex(name, Validate.NAME_REGEX)) {
            flag = true;
            nameError = "wrong format! please input again!";
        }


        String birthday = request.getParameter("birthday");
        if (Validate.checkRegex(birthday, Validate.DATE_REGEX)){
            flag = true;
            birthdayError = "wrong format! please input again!";
        }

        String idCard = request.getParameter("idCard");
        if (Validate.checkRegex(idCard, Validate.ID_CARD_REGEX)) {
            flag = true;
            idCardError = "Error input! please input again!";
        }
        Double salary = Double.valueOf(request.getParameter("salary"));
        if (Validate.checkRegex(String.valueOf(salary), Validate.NAME_REGEX) || salary < 0) {
            flag = true;
            salaryError = "Error salary input! please input again";
        }
        String phone = request.getParameter("phone");
        if (Validate.checkRegex(phone, Validate.PHONE_REGEX)) {
            flag = true;
            phoneError = "Error input! please input again!";
        }

        String email = request.getParameter("email");
        if (Validate.checkRegex(email, Validate.EMAIL_REGEX)) {
            flag = true;
            emailError = "Error input! please input again!";
        }
        String address = request.getParameter("address");
        if (Validate.checkRegex(address, Validate.NAME_REGEX)) {
            flag = true;
            addressError = "wrong format! please input again!";

        }
        String idPosition = request.getParameter("idPosition");
        //        String positionName = request.getParameter("positionName");
        String idEduDegree = request.getParameter("idDegree");
        //        String nameEduDegree = request.getParameter("nameEduDegree");
        String idDivision = request.getParameter("idDivision");
        //        String nameDivision = request.getParameter("nameDivision");
        Position position = new Position();
        position.setId(idPosition);
        EducationDegree educationDegree = new EducationDegree();
        educationDegree.setId(idEduDegree);
        Division division = new Division();
        division.setId(idDivision);
        Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email, address,
                position, educationDegree, division);
        if (flag) {
            request.setAttribute("idError", idError);
            request.setAttribute("nameError", nameError);
            request.setAttribute("birthdayError", birthdayError);
            request.setAttribute("addressError", addressError);
            request.setAttribute("IdCardError", idCardError);
            request.setAttribute("salaryError", salaryError);
            request.setAttribute("phoneError", phoneError);
            request.setAttribute("emailError", emailError);
            request.setAttribute("employee", employee);
            showCreateEmployee(request, response);
        }
        try {
            employeeRepository.insertEmployee(employee);
            RequestDispatcher dispatcher = request.getRequestDispatcher("employee/create.jsp");
//            request.setAttribute("message", "deleted");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}