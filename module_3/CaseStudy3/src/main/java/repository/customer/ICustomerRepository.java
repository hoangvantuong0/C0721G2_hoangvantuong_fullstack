package repository.customer;

import bean.customer.Customer;
import bean.customer.CustomerType;

import java.util.List;

public interface ICustomerRepository {
    public List<Customer> selectAllCustomer();
    public List<CustomerType> selectAllCustomerType();
    public Customer selectCustomer(int id);
    public Customer findById(int id);
    public void insertCustomer(Customer customer);

    public void updateCustomer(Customer customer);

    public void deleteCustomer(int id);

    public List< Customer > searchCustomer(String customerName);
}