package service;

import bean.Product;

import java.util.List;

public interface IProductService {
    List<Product>findAll();
    Product findById(Integer id);
    void save(Product product);
    void update(int id, Product product);
    void remove(int id);
    List <Product> findByName(String name);
}
