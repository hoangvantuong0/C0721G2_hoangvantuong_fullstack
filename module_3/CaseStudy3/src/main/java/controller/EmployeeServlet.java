package controller;

import bean.employee.Division;
import bean.employee.EducationDegree;
import bean.employee.Employee;
import bean.employee.Position;
import repository.employee.IEmployeeRepository;
import repository.employee.impl.EmployeeRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    static IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String note = request.getParameter("note");
        if (note == null) {
            note = "";
        }
        try {
            switch (note) {
                case "create":
                    showFormAddEmployee(request, response);
                    break;
                case "edit":
                    showEmployeeEdit(request, response);
                    break;
//                case "delete":
//                    deleteEmployee(request, response);
//                    showDeleteEmployee(request, response);
                break;
                case "search":
                    break;
                default:
                    showListEmployee(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String note = request.getParameter("note");
        if (note == null) {
            note = "";
        }
        try {
            switch (note) {
                case "create":
                    createNewEmployee(request, response);
                    break;
                case "edit":
                    editEmployee(request, response);
                    break;
//                case "delete":
//                    deleteEmployee(request, response);
//                    break;
                case "search":
                    break;
                default:
                    showListEmployee(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }



    public static void showListEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
//        List< User > userList = employeeRepository.selectAllEmployee();
        List<Employee> employeeList = employeeRepository.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("employee/list.jsp").forward(request, response);
    }

    public void showFormAddEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<Position> positionList = selectPosition();
        request.setAttribute("positionList", positionList);
        List<EducationDegree> degreeList = selectEducationDegree();
        request.setAttribute("degreeList", degreeList);
        List<Division> divisionList = selectDivision();
        request.setAttribute("divisionList", divisionList);
        request.getRequestDispatcher("employee/create.jsp").forward(request, response);
    }

    public void createNewEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthDay");
        String idCard = request.getParameter("idCard");
        Double salary = Double.valueOf(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int degreeId = Integer.parseInt(request.getParameter("degreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Position position = null;
        EducationDegree educationDegree = null;
        Division division = null;
        for (Position positions : selectPosition()) {
            if (positions.getId() == positionId) {
                position = positions;
            }
        }
        for (EducationDegree educationDegrees : selectEducationDegree()) {
            if (educationDegrees.getId() == positionId) {
                educationDegree = educationDegrees;
            }
        }
        for (Division division1 : selectDivision()) {
            if (division1.getId() == positionId) {
                division = division1;
            }
        }
        Employee employee = new Employee(name, birthDay, idCard, salary, phone, email, address, position,
                educationDegree, division);

        employeeRepository.insertEmployee(employee);
        request.setAttribute("message", "New user was created");
        request.getRequestDispatcher("employee/create.jsp").forward(request, response);
    }

    public void showEmployeeEdit(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Position> positionList = selectPosition();
        request.setAttribute("positionList", positionList);
        List<EducationDegree> degreeList = selectEducationDegree();
        request.setAttribute("degreeList", degreeList);
        List<Division> divisionList = selectDivision();
        request.setAttribute("divisionList", divisionList);
        Employee employee = employeeRepository.selectEmployee(id);
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("employee/edit.jsp").forward(request, response);
    }

    public void editEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthDay");
        String idCard = request.getParameter("idCard");
        Double salary = Double.valueOf(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int degreeId = Integer.parseInt(request.getParameter("degreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Position position = null;
        EducationDegree educationDegree = null;
        Division division = null;
        for (Position positions : selectPosition()) {
            if (positions.getId() == positionId) {
                position = positions;
            }
        }
        for (EducationDegree educationDegrees : selectEducationDegree()) {
            if (educationDegrees.getId() == degreeId) {
                educationDegree = educationDegrees;
            }
        }
        for (Division division1 : selectDivision()) {
            if (division1.getId() == divisionId) {
                division = division1;
            }
        }
        Employee employee = new Employee(id, name, birthDay, idCard, salary, phone, email, address, position,
                educationDegree, division);
        System.out.println(employee.toString());

        if (employee == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            employeeRepository.updateEmployee(employee);
            request.setAttribute("message", "Employee information was updated");
            request.getRequestDispatcher("employee/edit.jsp").forward(request, response);

        }
    }


    public void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeRepository.selectEmployee(id);
        if (employee == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            employeeRepository.deleteEmployee(id);
            response.sendRedirect("/home");
        }
    }

    public void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String employeeName = request.getParameter("employeeName");
        List<Employee> employeeList = employeeRepository.searchEmployee(employeeName);
        if (employeeList == null) {
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("employeeList", employeeList);
            request.getRequestDispatcher("employee/list.jsp").forward(request, response);
        }
    }
}
