package repository.customer;

import bean.customer.Customer;
import bean.customer.CustomerType;

import java.util.List;

public interface ICustomerRepository {
    public List<Customer> selectAllCustomer();
    public List<CustomerType> selectAllCustomerType();
    public Customer selectCustomer(String id);
    public Customer findById(String id);
    public void insertCustomer(Customer customer);

    public void updateCustomer(Customer customer);

    public void deleteCustomer(String id);

    public List< Customer > searchCustomer(String customerName);
}