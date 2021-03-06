package repository.employee;


import bean.employee.Division;
import bean.employee.EducationDegree;
import bean.employee.Employee;
import bean.employee.Position;

import java.util.List;

public interface IEmployeeRepository {
    public List<Employee> selectAllEmployee();
    public List<Division> selectAllEmpDivision();
    public List<Position> selectAllEmpPosition();
    public List<EducationDegree> selectAllEmpEduDegree();
    public Employee selectEmployee(String id);
    public void insertEmployee(Employee employee);
    public void updateEmployee(Employee employee) ;
    public void deleteEmployee(String id) ;
    public List<Employee> searchEmployee(String name, String phone, String address);
}