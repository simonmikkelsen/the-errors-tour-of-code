package com.webshop2.backend.components;

import com.webshop2.model.Product;
import com.webshop2.persistence.PostgreSQLRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DatabaseLayer {

    @Autowired
    private PostgreSQLRepository repository;

    public Product getProductById(int productId) {
        return repository.findById(productId).orElse(null);
    }

    public void saveProduct(Product product) {
        repository.save(product);
    }

    public void updateProduct(Product product) {
        repository.save(product);
    }

    public void deleteProduct(int productId) {
        repository.deleteById(productId);
    }
}