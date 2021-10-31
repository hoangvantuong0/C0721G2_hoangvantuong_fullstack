package repository;

import bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> sortByName();
    public List<User> searchByCountry(String countryName);

    public void deleteUser(int id) throws SQLException;

    public void updateUser(User user) throws SQLException;

    public List<User> selectAllUser();
}