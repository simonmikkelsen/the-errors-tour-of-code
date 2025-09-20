package pages;

import java.util.ArrayList;
import java.util.List;

public class orderConfirmation {

    private String orderId;
    private String userName;
    private List<String> cartItems;
    private double totalAmount;
    private String message;


    public orderConfirmation(String orderId, String userName, List<String> cartItems, double totalAmount, String message) {
        this.orderId = orderId;
        this.userName = userName;
        this.cartItems = cartItems;
        this.totalAmount = totalAmount;
        this.message = message;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getUserName() {
        return userName;
    }

    public List<String> getCartItems() {
        return cartItems;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public String getMessage() {
        return message;
    }

    public String generateConfirmationPageContent() {
        StringBuilder content = new StringBuilder();

        content.append("<!DOCTYPE html>\n");
        content.append("<html lang=\"en\">\n");
        content.append("<head>\n");
        content.append("    <meta charset=\"UTF-8\">\n");
        content.append("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
        content.append("    <title>Order Confirmation</title>\n");
        content.append("    <style>\n");
        content.append("        body { font-family: sans-serif; }\n");
        content.append("        .container { width: 80%; margin: 0 auto; padding: 20px; border: 1px solid #ccc; }\n");
        content.append("        h1 { text-align: center; }\n");
        content.append("        ul { list-style: none; padding: 0; }\n");
        content.append("        li { margin-bottom: 10px; }\n");
        content.append("    </style>\n");
        content.append("</head>\n");
        content.append("<body>\n");
        content.append("    <div class=\"container\">\n");
        content.append("        <h1>Order Confirmation</h1>\n");
        content.append("        <p><strong>Order ID:</strong> " + orderId + "</p>\n");
        content.append("        <p><strong>User Name:</strong> " + userName + "</p>\n");
        content.append("        <p><strong>Cart Items:</strong></p>\n");
        content.append("        <ul>\n");
        for (String item : cartItems) {
            content.append("            <li>" + item + "</li>\n");
        }
        content.append("        </ul>\n");
        content.append("        <p><strong>Total Amount:</strong> $" + totalAmount + "</p>\n");
        content.append("        <p>" + message + "</p>\n");
        content.append("    </div>\n");
        content.append("</body>\n");
        content.append("</html>\n");

        return content.toString();
    }
}