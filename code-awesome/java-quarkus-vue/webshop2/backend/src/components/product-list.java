package com.webshop2.backend.components;

import java.util.List;
import java.util.ArrayList;

public class ProductList {

    private List<Product> products;

    public ProductList(List<Product> products) {
        this.products = products;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public List<Product> filterByCategory(String category) {
        List<Product> filteredProducts = new ArrayList<>();
        for (Product product : products) {
            if (product.getCategory().equals(category)) {
                filteredProducts.add(product);
            }
        }
        return filteredProducts;
    }

    public void paginate(int pageNumber, int pageSize) {
        // Placeholder for pagination logic
        // In a real implementation, you would fetch a subset of the products
        // based on the page number and page size.
        System.out.println("Pagination not yet implemented");
    }
}