package components;

import java.util.ArrayList;
import java.util.List;

public class ProductList {

    private List<Product> products;

    public ProductList() {
        products = new ArrayList<>();
        // Simulate loading products from a database or other source
        addProduct("Cute Puppy", 25.00);
        addProduct("Fluffy Kitten", 18.50);
        addProduct("Sleepy Bunny", 32.75);
    }

    public void addProduct(String name, double price) {
        Product product = new Product(name, price);
        products.add(product);
    }

    public List<Product> getProducts() {
        return products;
    }

    private static class Product {
        private String name;
        private double price;

        public Product(String name, double price) {
            this.name = name;
            this.price = price;
        }

        public String getName() {
            return name;
        }

        public double getPrice() {
            return price;
        }
    }
}