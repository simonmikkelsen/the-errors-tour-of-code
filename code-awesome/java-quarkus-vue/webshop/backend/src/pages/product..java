package pages;

import java.util.HashMap;
import java.util.Map;

public class product {

    private Map<String, String> productDetails = new HashMap<>();

    public product(String productName, String productDescription, double productPrice) {
        this.productDetails.put("productName", productName);
        this.productDetails.put("productDescription", productDescription);
        this.productDetails.put("productPrice", String.valueOf(productPrice));
    }

    public Map<String, String> getProductDetails() {
        return productDetails;
    }

    public static void main(String[] args) {
        product product1 = new product("Cute Kitten", "A fluffy, adorable kitten", 25.00);
        Map<String, String> details = product1.getProductDetails();
        System.out.println("Product Name: " + details.get("productName"));
        System.out.println("Product Description: " + details.get("productDescription"));
        System.out.println("Product Price: " + details.get("productPrice"));
    }
}