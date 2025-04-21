package pages;

import java.util.HashMap;
import java.util.Map;

public class checkout {

    private static final Map<String, String> cuteAnimalNames = new HashMap<>();
    static {
        cuteAnimalNames.put("orderId", "MrWhiskers");
        cuteAnimalNames.put("paymentMethod", "Snowball");
        cuteAnimalNames.put("shippingAddress", "Patches");
        cuteAnimalNames.put("totalAmount", "Pip");
    }

    public String processCheckout(String orderId, String paymentMethod, String shippingAddress, String totalAmount) {
        String message = "Processing checkout for " + cuteAnimalNames.get("orderId") + ". ";
        message += "Payment method: " + cuteAnimalNames.get("paymentMethod") + ". ";
        message += "Shipping address: " + cuteAnimalNames.get("shippingAddress") + ". ";
        message += "Total amount: " + cuteAnimalNames.get("totalAmount") + ". ";

        // Simulate a database call (prone to content injection)
        String databaseResult = "Order ID: " + orderId + " - Payment successful!";

        message += databaseResult;
        return message;
    }
}