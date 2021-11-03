package repository.employee.impl;


import bean.employee.Division;
import bean.employee.EducationDegree;
import bean.employee.Employee;
import bean.employee.Position;
import repository.employee.IEmployeeRepository;
import util.DataConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    @Override
    public List<Employee> selectAllEmployee() {
        List< Employee > employeeList = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * from employee;");
            Employee employee = null;
            Position position = null;
            EducationDegree degree = null;
            Division division = null;
            while (resultSet.next()) {
                for (Position positions : selectPosition()) {
                    if (positions.getId() == resultSet.getInt("position_id")) {
                        position = positions;
                    }
                }
                for (EducationDegree degrees : selectEducationDegree()) {
                    if (degrees.getId() == resultSet.getInt("degree_id")) {
                        degree = degrees;
                    }
                }
                for (Division divisions : selectDivision()) {
                    if (divisions.getId() == resultSet.getInt("division_id")) {
                        division = divisions;
                    }
                }
                employee = new Employee();
                employee.setId(resultSet.getInt("employee_id"));
                employee.setName(resultSet.getString("employee_name"));
                employee.setIdCard(resultSet.getString("id_card"));
                employee.setBirthDay(resultSet.getString("birthday"));
                employee.setSalary(Double.valueOf(resultSet.getString("salary")));
                employee.setPhone(resultSet.getString("phone"));
                employee.setEmail(resultSet.getString("email"));
                employee.setAddress(resultSet.getString("address"));
                employee.setPosition(position);
                employee.setEducationDegree(degree);
                employee.setDivision(division);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
        return employeeList;
    }

    @Override
    public Employee selectEmployee(int id) {
        List< Employee > listEmployee = selectAllEmployee();
        Employee employee = null;
        for (Employee list : listEmployee) {
            if (list.getId() == id) {
                employee = list;
            }
        }
        return employee;
    }

    @Override
    public void insertEmployee(Employee employee) {
        System.out.println(employee.getEducationDegree().getId());
        try {
            PreparedStatement preparedStatement = DataConnection.connection.prepareStatement("insert into employee(employee_name,position_id, degree_id, division_id,birthday,id_card,salary," +
                " phone,email,address) " +
                " values(?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setInt(2, employee.getPosition().getId());
            preparedStatement.setInt(3, employee.getEducationDegree().getId());
            preparedStatement.setInt(4, employee.getDivision().getId());
            preparedStatement.setString(5, employee.getBirthDay());
            preparedStatement.setString(6, employee.getIdCard());
            preparedStatement.setDouble(7, employee.getSalary());
            preparedStatement.setString(8, employee.getPhone());
            preparedStatement.setString(9, employee.getEmail());
            preparedStatement.setString(10, employee.getAddress());
            preparedStatement.executeLargeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public void updateEmployee(Employee employee) {
        try {
            PreparedStatement preparedStatement = DataConnection.connection.prepareStatement("update employee " +
                            " set employee_name = ?,position_id= ?, degree_id=?," +
                            " division_id=?, birthday=?, " +
                            " id_card=?,salary=?, email=?,phone=?, address=?  where employee_id = ?;");
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setInt(2, employee.getPosition().getId());
            preparedStatement.setInt(3, employee.getEducationDegree().getId());
            preparedStatement.setInt(4, employee.getDivision().getId());
            preparedStatement.setString(5, employee.getBirthDay());
            preparedStatement.setString(6, employee.getIdCard());
            preparedStatement.setDouble(7, employee.getSalary());
            preparedStatement.setString(8, employee.getEmail());
            preparedStatement.setString(9, employee.getPhone());
            preparedStatement.setString(10, employee.getAddress());
            preparedStatement.setInt(11, employee.getId());
            preparedStatement.executeLargeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public void deleteEmployee(int id) {
        try {
            PreparedStatement preparedStatement = DataConnection.connection.prepareStatement("delete from employee where employee_id = ?;");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
    }

    @Override
    public List< Employee > searchEmployee(String employeeName) {
        List< Employee > employeeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = DataConnection.connection.prepareStatement("select * from employee where employee_name = ?;");
            preparedStatement.setString(1, employeeName);
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee = null;
            Position position = null;
            EducationDegree degree = null;
            Division division = null;
            while (resultSet.next()) {
                for (Position positions : selectPosition()) {
                    if (positions.getId() == resultSet.getInt("position_id")) {
                        position = positions;
                    }
                }
                for (EducationDegree degrees : selectEducationDegree()) {
                    if (degrees.getId() == resultSet.getInt("degree_id")) {
                        degree = degrees;
                    }
                }
                for (Division divisions : selectDivision()) {
                    if (divisions.getId() == resultSet.getInt("division_id")) {
                        division = divisions;
                    }
                }
                employee = new Employee();
                employee.setId(resultSet.getInt("employee_id"));
                employee.setBirthDay(resultSet.getString("employee_name"));
                employee.setIdCard(resultSet.getString("id_card"));
                employee.setBirthDay(resultSet.getString("birthday"));
                employee.setSalary(Double.valueOf(resultSet.getString("salary")));
                employee.setPhone(resultSet.getString("phone"));
                employee.setEmail(resultSet.getString("email"));
                employee.setAddress(resultSet.getString("address"));
                employee.setPosition(position);
                employee.setEducationDegree(degree);
                employee.setDivision(division);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
        return employeeList;
    }
}