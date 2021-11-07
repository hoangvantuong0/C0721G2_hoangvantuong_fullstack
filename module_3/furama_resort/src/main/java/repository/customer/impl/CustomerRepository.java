package repository.customer.impl;

import bean.customer.Customer;
import bean.customer.CustomerType;
import repository.customer.ICustomerRepository;
import util.DataConnection;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static util.CommonMethod.selectCustomerType;
import static util.DataConnection.getConnection;

public class CustomerRepository implements ICustomerRepository {
    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select C.customer_id, C.customer_type_id, Ct.customer_type_name, C.customer_name, C.customer_birthday, C.customer_gender, C.customer_id_card,\n" +
                    "C.customer_phone, C.customer_email, C.customer_address, Ct.customer_type_name\n" +
                    "from customer C\n" +
                    "join customer_type Ct\n" +
                    "on C.customer_type_id = Ct.customer_type_id\n" +
                    "order by C.customer_id asc;");
            Customer customer = null;
            CustomerType customerType = null;
            while (resultSet.next()) {
                customerType = new CustomerType();
                customerType.setId(resultSet.getString("customer_type_id"));
                customerType.setName(resultSet.getString("customer_type_name"));
                customer = new Customer();
                customer.setId(resultSet.getString("customer_id"));
                customer.setCustomerType(customerType);
                customer.setName(resultSet.getString("customer_name"));
                customer.setIdCard(resultSet.getString("customer_id_card"));
                customer.setBirthday(resultSet.getString("customer_birthday"));
                customer.setGender(resultSet.getString("customer_gender"));
                customer.setPhone(resultSet.getString("customer_phone"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setAddress(resultSet.getString("customer_address"));
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;

    }

    @Override
    public Customer selectCustomer(String id) {
        List<Customer> customerList = selectAllCustomer();
        Customer customer = null;
        for (Customer customer1 : customerList) {
            if (customer1.getId().equals(id)) {
                customer = customer1;
            }
        }
        return customer;
    }

    @Override
    public void insertCustomer(Customer customer) {
        try {

            PreparedStatement preparedStatement = getConnection().prepareStatement
                    ("insert into customer values(?,?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, customer.getId());
            preparedStatement.setString(2, customer.getCustomerType().getId());
            preparedStatement.setString(3, customer.getName());
            preparedStatement.setString(4, customer.getBirthday());
            preparedStatement.setString(5, customer.getGender());
            preparedStatement.setString(6, customer.getIdCard());
            preparedStatement.setString(7, customer.getPhone());
            preparedStatement.setString(8, customer.getEmail());
            preparedStatement.setString(9, customer.getAddress());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
    }

    @Override
    public void updateCustomer(Customer customer) {
        try {
            PreparedStatement preparedStatement = getConnection().prepareStatement
                    ("update customer set `customer_name` = ?,customer_type_id= ?, customer_birthday=?, customer_gender=?,customer_id_card=?,\n" +
                            " customer_email=?, customer_address=?, customer_phone=? where customer_id = ?;");
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getCustomerType().getId());
            preparedStatement.setString(3, customer.getBirthday());
            preparedStatement.setString(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setString(9, customer.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCustomer(String id) {
        try {
            PreparedStatement preparedStatement = getConnection().prepareStatement
                    (" delete from customer where customer_id = ?;");
            preparedStatement.setString(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List< Customer > searchCustomer(String customerName, String customerTypeName,String address) {
        List< Customer > customerList = new ArrayList<>();
        try {
            PreparedStatement ps = DataConnection.getConnection().prepareStatement
                    ("select C.customer_id, C.customer_type_id, C.customer_name, C.customer_birthday, C.customer_gender, \n" +
                            "C.customer_id_card, C.customer_phone, C.customer_email, C.customer_address\n" +
                            "from customer C\n" +
                            "join customer_type ct on ct.customer_type_id  =  C.customer_type_id\n" +
                            "where (C.customer_name  like concat('%',?,'%'))\n" +
                            "and (ct.customer_type_name like concat('%',?, '%'))\n" +
                            "and (C.customer_address like concat('%',?,'%'));");
            ps.setString(1, customerName);
            ps.setString(2, customerTypeName);
            ps.setString(3, address);
            ResultSet resultSet = ps.executeQuery();
            Customer customer = null;
            CustomerType customerType = null;
            while (resultSet.next()) {
                customer = new Customer();
                customerType= new CustomerType();
                customerType.setId(resultSet.getString("customer_type_id"));
                customer.setId(resultSet.getString("customer_id"));
                customer.setCustomerType(customerType);
                customer.setName(resultSet.getString("customer_name"));
                customer.setBirthday(resultSet.getString("customer_birthday"));
                customer.setGender(resultSet.getString("customer_gender"));
                customer.setIdCard(resultSet.getString("customer_id_card"));
                customer.setPhone(resultSet.getString("customer_phone"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setAddress(resultSet.getString("customer_address"));
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

}
