package repository.customer;

import bean.customer.Customer;

import java.util.List;

public interface ICustomerRepository {
    public List<Customer> selectAllCustomer();

    public Customer selectCustomer(String id);

    public void insertCustomer(Customer customer);

    public void updateCustomer(Customer customer);

    public void deleteCustomer(String id);

    public List< Customer > searchCustomer(String customerName, String customerTypeName,String address);
}

