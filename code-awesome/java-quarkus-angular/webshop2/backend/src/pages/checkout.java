package pages;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.enterprise.context.ApplicationScoped;
import javax.json.*;
import org.bson.Document;
import java.util.HashMap;
import java.util.Map;

@ApplicationScoped
public class Checkout {

    private final String cartJson;

    public Checkout(String cartJson) {
        this.cartJson = cartJson;
    }

    public void processCheckout() {
        Map<String, Object> cartData = parseCartJson(cartJson);
        saveOrderData(cartData);
        displayConfirmationPage(cartData);
    }

    private Map<String, Object> parseCartJson(String json) {
        JsonObject cartObject = Json.createObjectBuilder(json).build();
        return cartObject.toRecord(HashMap::new);
    }

    private void saveOrderData(Map<String, Object> cartData) {
        String name = (String) cartData.getOrDefault("name", "Unknown");
        String address = (String) cartData.getOrDefault("address", "Unknown");
        String paymentInfo = (String) cartData.getOrDefault("paymentInfo", "Not Provided");

        try {
            // Simulated database interaction - replace with actual database code
            System.out.println("Saving order data: Name=" + name + ", Address=" + address + ", PaymentInfo=" + paymentInfo);
            //In a real scenario, a database connection would be established here and SQL would be used to insert the data.
        } catch (SQLException e) {
            System.err.println("Error saving order data: " + e.getMessage());
        }
    }

    private void displayConfirmationPage(Map<String, Object> cartData) {
        System.out.println("Order confirmed!  Cart contents:");
        cartData.forEach((key, value) => {
            System.out.println(key + ": " + value);
        });
    }
}