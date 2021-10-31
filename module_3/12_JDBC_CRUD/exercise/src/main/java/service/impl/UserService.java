package service.impl;

import bean.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserRepository, IUserService {
    IUserRepository userRepository = new UserRepository();


    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUser();
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }

    @Override
    public List<User> searchByCountry(String countryName) {
        return userRepository.searchByCountry(countryName);
    }

    @Override
    public void deleteUser(int id) throws SQLException {
         userRepository.deleteUser(id);
    }

    @Override
    public void updateUser(User user) throws SQLException {
        userRepository.updateUser(user);
    }

    @Override
    public List<User> selectAllUser() {
        return userRepository.selectAllUser();
    }

}