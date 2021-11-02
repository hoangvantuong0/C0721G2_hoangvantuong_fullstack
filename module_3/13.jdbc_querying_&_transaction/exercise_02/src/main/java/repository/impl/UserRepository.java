package repository.impl;

import model.User;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/demo";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "superuser";
    public static Connection connection;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public List<User> selectAllUser() {
        List< User > userList = new ArrayList<>();
        try {
            Statement statement = UserRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from user_infomation;");
            User user = null;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public List< User > showAllUser() {
        List< User > userList = new ArrayList<>();
        try {
            CallableStatement callableStatement = UserRepository.connection.prepareCall("call show_user_list");
            ResultSet resultSet = callableStatement.executeQuery();
            User user = null;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public User selectUser(int id) {
        User user = new User();
        try {
            PreparedStatement preparedStatement = UserRepository.connection.prepareStatement
                    ("select * from users  where id = ?;");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void insertUser(User user) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement
                    ("insert into users(name, email, country) values(?,?,?);");
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeLargeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertUserTransaction() {
        String msg = "transaction successfully";
        try {
            connection.setAutoCommit(false);
            PreparedStatement pSInsertNam = connection.prepareStatement
                    ("insert into users(name, email, country) values(?,?,?);");
            pSInsertNam.setString(1, "Nguyen");
            pSInsertNam.setString(2, "nguyenvan@gmail.com");
            pSInsertNam.setString(3, "Viet Nam");
            int rowEffect =pSInsertNam.executeUpdate();
            if(rowEffect == 1) {
                PreparedStatement pSInsertVu = connection.prepareStatement
                        ("insert into users(name, email, country) values(?,?,?);");
                pSInsertVu.setString(1, "Viet Tuong");
                pSInsertVu.setString(2, "viettuong@gmail.com");
                pSInsertVu.setString(3, "Trung Quoc");
                rowEffect +=pSInsertVu.executeUpdate();
            }
            if(rowEffect ==2) {
                connection.commit();
            }else {
                msg = "rollback try";
                connection.rollback();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateUser(User user) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement
                    ("update users set `name` = ?,email= ?, country =? where Id = ?;");
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            preparedStatement.executeLargeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void editUser(User user) {
        try {
            CallableStatement callableStatement = connection.prepareCall("call edit_user (?,?,?,?);");
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setString(4, String.valueOf(user.getId()));
            callableStatement.executeLargeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void deleteUser(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement
                    ("delete from users where id = ?;");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void dropUser(int id) {
        try {
            CallableStatement callableStatement = connection.prepareCall
                    ("call delete_user (?);");
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List< User > orderByName() {
        List< User > userList = new ArrayList<>();
        try {
            Statement statement = UserRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * " +
                    "from users" +
                    "order by `name` asc;");
            User user = null;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public List< User > selectByCountry(String countryName) {
        List< User > userList = new ArrayList<>();
        try {

            PreparedStatement ps = UserRepository.connection.prepareStatement("select * \n" +
                    "from users\n" +
                    "where country = ? \n" +
                    "order by `name` asc;");
            ps.setString(1, countryName);
            ResultSet resultSet = ps.executeQuery();
            User user = null;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

}
