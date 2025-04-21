package prg3.java-quarkus-react.webshop.backend.src.pages;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;

public class Product {

    private String id;
    private String name;
    private double price;
    private String description;

    public Product(String id, String name, double price, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public Map<String, Object> toMap() {
        Map<String, Object> productMap = new HashMap<>();
        productMap.put("id", this.id);
        productMap.put("name", this.name);
        productMap.put("price", this.price);
        productMap.put("description", this.description);
        return productMap;
    }
}