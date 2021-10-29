package repository.impl;

import bean.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class ProductRepository implements IProductRepository {

   static Map<Integer, Product> productMap;

    static {
        productMap = new TreeMap<>();
        productMap.put(1, new Product(1,"IPhone X", 1000000f,"Good quality" ));
        productMap.put(2, new Product(2,"IPhone 12", 2000000f,"Good quality" ));
        productMap.put(3, new Product(3,"IPhone 13", 3000000f,"Bad quality" ));
        productMap.put(4, new Product(4,"IPhone 14", 4000000f,"Good quality" ));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public Product findById(Integer id) {
        return productMap.get(id);
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(), product);

    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }
    @Override
    public List< Product > findByName(String name) {
        ArrayList< Product > productList = new ArrayList();
        for (Map.Entry< Integer, Product > map : productMap.entrySet()) {
            if (map.getValue().getName().contains(name)) {
                productList.add(map.getValue());
            }
        }
        return productList;
    }

}
