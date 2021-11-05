package repository.employee.impl;

import bean.customer.Customer;
import bean.customer.CustomerType;
import bean.employee.Division;
import bean.employee.EducationDegree;
import bean.employee.Employee;
import bean.employee.Position;
import com.sun.org.apache.xpath.internal.operations.Div;
import repository.employee.IEmployeeRepository;
import util.DataConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    @Override
    public List<Employee> selectAllEmployee() {
        Connection connection = DataConnection.getConnection();
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select E.employee_id, E.employee_name, E.employee_birthday, E.employee_id_card, E.employee_salary,\n" +
                    "E.employee_phone, E.employee_mail, E.employee_address, p.position_id, p.position_name, ed.education_degree_id,\n" +
                    "ed.education_degree_name, d.division_id, d.division_name\n" +
                    "from employee E\n" +
                    "join education_degree ed\n" +
                    "on e.education_degree_id = ed.education_degree_id\n" +
                    "join position p\n" +
                    "on p.position_id = e.position_id\n" +
                    "join division d\n" +
                    "on d.division_id = e.division_id order by E.employee_id asc");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                Double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_mail");
                String address = resultSet.getString("employee_address");
                int idPosition = resultSet.getInt("position_id");
                String positionName = resultSet.getString("position_name");
                int idEduDegree = resultSet.getInt("education_degree_id");
                String nameEduDegree = resultSet.getString("education_degree_name");
                int idDivision = resultSet.getInt("division_id");
                String nameDivision = resultSet.getString("division_name");
                employeeList.add(new Employee(id, name, birthday, idCard, salary, phone, email, address,
                        new Position(idPosition, positionName), new EducationDegree(idEduDegree, nameEduDegree),
                        new Division(idDivision, nameDivision)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
        return employeeList;
    }

    @Override
    public List<Division> selectAllEmpDivision() {
        Connection connection = DataConnection.getConnection();
        List<Division> divisionList = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement("select* from division")) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = Integer.valueOf(rs.getString("division_id"));
                String name = rs.getString("division_name");
                divisionList.add(new Division(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
        return divisionList ;
    }

    @Override
    public List<Position> selectAllEmpPosition() {
        Connection connection = DataConnection.getConnection();
        List<Position> positionList = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement("select* from position")) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = Integer.valueOf(rs.getString("position_id"));
                String name = rs.getString("position_name");
                positionList.add(new Position(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
        return positionList ;
    }

    @Override
    public List<EducationDegree> selectAllEmpEduDegree() {
        Connection connection = DataConnection.getConnection();
        List<EducationDegree> educationList = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement("select* from education_degree")) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = Integer.valueOf(rs.getString("education_degree_id"));
                String name = rs.getString("education_degree_name");
                educationList.add(new EducationDegree(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
        return educationList;
    }

    @Override
    public Employee selectEmployee(int id) {
        List<Employee> employeeList = selectAllEmployee();
        Employee employee = null;
        for (Employee employee1 : employeeList) {
            if (employee1.getId() == id) {
                employee = employee1;
            }
        }
        return employee;
    }

    @Override
    public void insertEmployee(Employee employee) {
        Connection connection = DataConnection.getConnection();
        try {

            PreparedStatement preparedStatement = connection.prepareStatement
                    ("insert into customer values(?,?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setInt(1, employee.getId());
            preparedStatement.setString(2, employee.getName());
            preparedStatement.setString(3, employee.getBirthday());
            preparedStatement.setString(4, employee.getIdCard());
            preparedStatement.setDouble(5, employee.getSalary());
            preparedStatement.setString(6, employee.getPhone());
            preparedStatement.setString(7, employee.getEmail());
            preparedStatement.setString(8, employee.getAddress());
            preparedStatement.setInt(9, employee.getPosition().getId());
            preparedStatement.setInt(10, employee.getEducationDegree().getId());
            preparedStatement.setInt(11, employee.getDivision().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
    }

    @Override
    public void updateEmployee(Employee employee) {
        Connection connection = DataConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement
                    ("update employee set employee_name =?, employee_birthday=?, employee_id_card=?, employee_salary= ?, employee_phone=?, employee_mail=?, \n" +
                            "employee_address =?, position_id = ?, education_degree_id = ?, division_id =?\n" +
                            "where employee_id = ?;");

            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPosition().getId());
            preparedStatement.setInt(9, employee.getEducationDegree().getId());
            preparedStatement.setInt(10, employee.getDivision().getId());
            preparedStatement.setInt(11, employee.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteEmployee(int id) {
        Connection connection = DataConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement
                    ("delete from employee where employee_id = ?;");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
    }

    @Override
    public List<Employee> searchEmployee(String employeeName) {
        return null;
    }
}
