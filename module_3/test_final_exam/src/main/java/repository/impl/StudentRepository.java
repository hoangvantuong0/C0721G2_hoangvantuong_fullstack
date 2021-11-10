package repository.impl;

import bean.Student;
import repository.IStudent;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static util.DataConnection.getConnection;

public class StudentRepository implements IStudent {

    @Override
    public List<Student> selectAllStudent() {
        List<Student> studentList = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * from student");
            Student student = null;
            while (resultSet.next()) {
                student = new Student();
                student.setName(resultSet.getString("student_name"));
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }
}

