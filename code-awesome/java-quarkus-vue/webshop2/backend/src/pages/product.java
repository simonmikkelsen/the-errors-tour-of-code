package pages;

import java.util.HashMap;
import java.util.Map;

import io.quarkus.runtime.Lifecycle;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

public class Product {

    private Map<String, Object> productData;
    private String productId;
    private String productName;
    private String productDescription;
    private double productPrice;
    private String productImageURL;

    @Inject
    private Lifecycle lifecycle;

    public Product(String productId, String productName, String productDescription, double productPrice, String productImageURL) {
        this.productId = productId;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.productImageURL = productImageURL;
        this.productData = new HashMap<>();
        this.productData.put("productId", productId);
        this.productData.put("productName", productName);
        this.productData.put("productDescription", productDescription);
        this.productData.put("productPrice", productPrice);
        this.productData.put("productImageURL", productImageURL);
    }

    public Map<String, Object> getProductData() {
        return productData;
    }

    public void setProductData(Map<String, Object> productData) {
        this.productData = productData;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImageURL() {
        return productImageURL;
    }

    public void setProductImageURL(String productImageURL) {
        this.productImageURL = productImageURL;
    }

    public void stop() {
        lifecycle.stop();
    }
}