package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> selectAllUser() {
        return userRepository.selectAllUser();
    }

    @Override
    public List< User > showAllUser() {
        return userRepository.showAllUser();
    }

    @Override
    public List< User > orderByName() {
        return  userRepository.orderByName();
    }

    @Override
    public List< User > selectByCountry(String countryName) {
        return userRepository.selectByCountry(countryName);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public void insertUser(User user){
        userRepository.insertUser(user);
    }

    @Override
    public void insertUserTransaction() {
        userRepository.insertUserTransaction();
    }

    @Override
    public void updateUser(User user) {
        userRepository.updateUser(user);
    }

    @Override
    public void editUser(User user) {
        userRepository.editUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteUser(id);
    }

    @Override
    public void dropUser(int id) {
        userRepository.dropUser(id);
    }
}