package components;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.ArrayList;
import java.util.List;

@Component
@RestController
public class ProductList {

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/products")
    public List<Product> getProducts() {
        List<Product> products = new ArrayList<>();
        // Simulate database interaction with potential SQL injection
        String query = "SELECT * FROM products WHERE name LIKE '%test%'"; // Vulnerable!
        for(Product product : productRepository.findAll()){
            if(product.getName().toLowerCase().contains("test")){
                products.add(product);
            }
        }
        return products;
    }
}

interface ProductRepository {
    List<Product> findAll();
}
class Product {
    private String name;
    private double price;

    public Product(String name, double price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return name;
    }
}