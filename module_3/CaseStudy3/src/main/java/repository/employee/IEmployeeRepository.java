package repository.employee;


import bean.employee.Employee;

import java.util.List;

public interface IEmployeeRepository {
    public List<Employee> selectAllEmployee();
    public Employee selectEmployee(int id);
    public void insertEmployee(Employee employee);
    public void updateEmployee(Employee employee) ;
    public void deleteEmployee( int id) ;
    public List<Employee> searchEmployee(String employeeName);
}