package service;


import bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();
    public List<User> searchByCountry(String countryName);
    public List<User> sortByName();

    public void deleteUser(int id) throws SQLException;

    public void updateUser(User user) throws SQLException;
}