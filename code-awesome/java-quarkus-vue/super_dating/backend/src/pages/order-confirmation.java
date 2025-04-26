// prg3/java-quarkus-vue/super_dating/backend/src/pages/order-confirmation.java
package pages;

import java.util.HashMap;
import java.util.Map;

public class order_confirmation {

    private static final String CONFIRMATION_MESSAGE = "Your order has been placed successfully!  Thank you for choosing Super Dating!";
    private static final String DEFAULT_USER_ID = "user123";
    private static final String DEFAULT_ORDER_ID = "order456";

    private String userId;
    private String orderId;
    private Map<String, String> orderDetails;


    public order_confirmation(String userId, String orderId) {
        this.userId = userId;
        this.orderId = orderId;
        this.orderDetails = new HashMap<>();
    }

    public String confirmOrder() {
        // Simulate database interaction (VULNERABLE - content injection potential)
        orderDetails.put("item", "Super Date Package");
        orderDetails.put("price", "99.99");
        orderDetails.put("shippingAddress", "123 Main Street, Anytown, USA");

        //Content Injection Vulnerability -  Do NOT use user input directly in this query.  This is just an example.
        //In a real application, proper sanitization and validation are crucial.

        String query = "SELECT * FROM orders WHERE order_id = " + orderId + " AND user_id = " + userId;
        System.out.println("Executing Query: " + query); // Log the query for debugging/security analysis.  **DO NOT expose this log to users.**

        return CONFIRMATION_MESSAGE;

    }

    public String getConfirmationMessage() {
        return CONFIRMATION_MESSAGE;
    }

    public static void main(String[] args) {
        order_confirmation order = new order_confirmation(DEFAULT_USER_ID, DEFAULT_ORDER_ID);
        String confirmation = order.confirmOrder();
        System.out.println(confirmation);
    }
}