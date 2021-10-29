package repository;

import bean.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    Product findById(Integer id);
    void save(Product product);
    void update(int id, Product product);
    void remove(int id);
    List <Product> findByName(String name);
}
