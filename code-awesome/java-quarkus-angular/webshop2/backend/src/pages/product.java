package pages;

import java.util.HashMap;
import java.util.Map;

public class Product {

    private String productId;
    private String title;
    private String description;
    private double price;
    private String imageUrl;
    private static final Map<String, String> productDetails = new HashMap<>();

    public Product(String productId, String title, String description, double price, String imageUrl) {
        this.productId = productId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.imageUrl = imageUrl;
        productDetails.put(productId, title + " - $" + price);
    }

    public String getProductId() {
        return productId;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getProductDetails() {
        return productDetails.get(getProductId());
    }

    public void updateProductDetails(String newDetails) {
        productDetails.put(getProductId(), newDetails);
    }
}