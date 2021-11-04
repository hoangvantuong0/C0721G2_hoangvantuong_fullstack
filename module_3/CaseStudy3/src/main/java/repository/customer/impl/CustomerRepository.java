package repository.customer.impl;

import bean.customer.Customer;
import bean.customer.CustomerType;
import repository.customer.ICustomerRepository;
import util.DataConnection;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String ALL_CUSTOMER_TYPE = "select *\n" +
            "from customer_type";
    private static final String SELECT_ALL_CUSTOMER = "select C.customer_id, C.customer_type_id, C.customer_name, C.customer_birthday, C.customer_gender, C.customer_id_card,\n" +
            "C.customer_phone, C.customer_email, C.customer_address, Ct.customer_type_name\n" +
            "from customer C\n" +
            "join customer_type Ct\n" +
            "on C.customer_type_id = Ct.customer_type_id;\n";
    private static final String UPDATE_SQL = "update customer_type\n" +
            "set customer_type_name = ?" +
            "where customer_type_id = ?";
    private static final String SELECT_BY_ID = "select customer.customer_id,customer_address, customer_email, customer.customer_name, customer_birthday, customer_gender, customer.customer_id_card, \n" +
            "customer.customer_phone, customer_type.customer_type_name, customer_type.customer_type_id " +
            " from customer join customer_type " +
            " on customer_type.customer_type_id = customer.customer_type_id " +
            " where customer.customer_id = ?";

    @Override
    public List<CustomerType> selectAllCustomerType() {
        Connection connection = DataConnection.getConnection();
        List<CustomerType> customerTypeList = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareCall(ALL_CUSTOMER_TYPE)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = Integer.valueOf(rs.getString("customer_type_id"));
                String name = rs.getString("customer_type_name");
                customerTypeList.add(new CustomerType(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
        return customerTypeList;
    }
    @Override
    public List<Customer> selectAllCustomer() {
        Connection connection = DataConnection.getConnection();
        List<Customer> customerList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = Integer.valueOf(resultSet.getString("customer_id"));
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                String gender = resultSet.getString("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int idCusType = Integer.valueOf(resultSet.getString("customer_type_id"));
                String cusTypeName = resultSet.getString("customer_type_name");
                customerList.add(new Customer(id, new CustomerType(idCusType, cusTypeName),
                        name, idCard, birthday, gender, phone, email, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
        return customerList;
    }

    @Override
    public Customer selectCustomer(int id) {
        List<Customer> customerList = selectAllCustomer();
        Customer customer = null;
        for (Customer customer1 : customerList) {
            if (customer1.getId() == id) {
                customer = customer1;
            }
        }
        return customer;
    }

    @Override
    public Customer findById(int id) {
        Connection connection = DataConnection.getConnection();
        Customer customer = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id1 = Integer.valueOf(resultSet.getString("customer_id"));
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                String gender = resultSet.getString("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int idCusType = Integer.valueOf(resultSet.getString("customer_type_id"));
                String cusTypeName = resultSet.getString("customer_type_name");
                customer = new Customer(id1, new CustomerType(idCusType, cusTypeName), name,
                        idCard, birthday, gender, phone, email, address);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            DataConnection.close();
        }
        return customer;
    }

    @Override
    public void insertCustomer(Customer customer) {
        Connection connection = DataConnection.getConnection();
        try {

            PreparedStatement preparedStatement = connection.prepareStatement
                    ("insert into customer values(?,?,?,?,?,?,?,?,?)");
            preparedStatement.setInt(1, customer.getId());
            preparedStatement.setInt(2, Integer.valueOf(customer.getCustomerType().getId()));
            preparedStatement.setString(3, customer.getName());
            preparedStatement.setString(4, customer.getBirthday());
            preparedStatement.setInt(5, Integer.valueOf(customer.getGender()));
            preparedStatement.setString(6, customer.getIdCard());
            preparedStatement.setString(7, customer.getPhone());
            preparedStatement.setString(8, customer.getEmail());
            preparedStatement.setString(9, customer.getAddress());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DataConnection.close();
        }
    }

    @Override
    public void updateCustomer(Customer customer) {
        Connection connection = DataConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement
                    ("update customer set customer_name = ?, customer_type_id = ?, customer_id_card= ?," +
                            " customer_birthday= ?, " +
                            " customer_gender= ?, customer_phone=?, customer_email= ?, " +
                            " customer_address= ? " + " where customer_id = ?");

            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, String.valueOf(customer.getCustomerType().getId()));
            preparedStatement.setString(3, customer.getIdCard());
            preparedStatement.setString(4, customer.getBirthday());
            preparedStatement.setString(5, String.valueOf((customer.getGender())));
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DataConnection.close();
        }
    }

    @Override
    public void deleteCustomer(int id) {
        Connection connection = DataConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement
                    ("delete from customer where customer_id = ?;");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DataConnection.close();
        }
    }

    @Override
    public List<Customer> searchCustomer(String customerName) {
        List< Customer > customerList = new ArrayList<>();
        try {
            PreparedStatement ps = DataConnection.connection.prepareStatement("select * from customer where customer_name = ?;");
            ps.setString(1, customerName);
            ResultSet resultSet = ps.executeQuery();
            Customer customer = null;
            CustomerType customerType = null;
            while (resultSet.next()) {
                for (CustomerType customerType1 : selectAllCustomerType()) {
                    if (customerType1.getId() == resultSet.getInt("customer_type_id")) {
                        customerType = customerType1;
                    }
                }
                customer = new Customer();
                customer.setId(resultSet.getInt("customer_id"));
                customer.setCustomerType(customerType);
                customer.setName(resultSet.getString("customer_name"));
                customer.setIdCard(resultSet.getString("id_card"));
                customer.setBirthday(resultSet.getString("birthday"));
                customer.setGender(resultSet.getString("gender"));
                customer.setPhone(resultSet.getString("phone"));
                customer.setEmail(resultSet.getString("email"));
                customer.setAddress(resultSet.getString("address"));
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }
}
