package util;

import bean.customer.CustomerType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static util.DataConnection.getConnection;

public class CommonMethod {
    public static List<CustomerType> selectCustomerType() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * from customer_type ;");
            CustomerType customerType = null;
            while (resultSet.next()) {
                customerType = new CustomerType();
                customerType.setId(resultSet.getString("customer_type_id"));
                customerType.setName(resultSet.getString("customer_type_name"));
                customerTypeList.add(customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }
}