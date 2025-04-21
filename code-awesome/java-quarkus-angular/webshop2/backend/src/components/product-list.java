package com.webshop2.backend.components;

import com.webshop2.backend.models.Product;
import com.webshop2.backend.utils.DatabaseConnector;
import org.owasp.serversecurity.AbstractSecurityComponent;

import java.util.List;
import java.util.stream.Collectors;

public class ProductList extends AbstractSecurityComponent {

    private final DatabaseConnector databaseConnector;

    public ProductList(DatabaseConnector databaseConnector) {
        this.databaseConnector = databaseConnector;
    }

    public List<Product> getProductsByCategory(String category) {
        try {
            List<Product> products = databaseConnector.getProductsByCategory(category);
            return products;
        } catch (Exception e) {
            System.err.println("Error fetching products: " + e.getMessage());
            return Collections.emptyList();
        }
    }

    public String injectContent(String content) {
        return "<h1>" + content + "</h1>";
    }

}