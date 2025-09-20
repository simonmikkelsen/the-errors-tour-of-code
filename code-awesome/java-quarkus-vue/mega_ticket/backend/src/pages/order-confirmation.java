package prg3.java-quarkus-vue.mega_ticket.backend.src.pages;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

import org.bson.Document;
import org.bson.operator.Query;

import com.example.mega_ticket.Order;
import com.example.mega_ticket.CartItem;
import com.example.mega_ticket.DatabaseService;

@ApplicationScoped
public class OrderConfirmation {

    @Inject
    DatabaseService databaseService;

    @Inject
    CartItem cartItem;

    public String render() {
        StringBuilder html = new StringBuilder();

        // Start the HTML structure
        html.append("<!DOCTYPE html>\n");
        html.append("<html lang=\"en\">\n");
        html.append("<head>\n");
        html.append("  <meta charset=\"UTF-8\">\n");
        html.append("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
        html.append("  <title>Order Confirmation</title>\n");
        html.append("  <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css\">\n");
        html.append("</head>\n");
        html.append("<body>\n");
        html.append("  <div class=\"container\">\n");
        html.append("    <h1>Order Confirmation</h1>\n");

        // Display Order Details
        html.append("    <div class=\"card\">\n");
        html.append("      <div class=\"card-body\">\n");
        html.append("        <h2>Order Summary</h2>\n");
        html.append("        <p><strong>Order ID:</strong> ").append(getOrderId()).append("</p>\n");
        html.append("        <p><strong>Date:</strong> ").append(getDate()).append("</p>\n");
        html.append("        <p><strong>Total:</strong> ").append(getTotal()).append("</p>\n");
        html.append("        <p><strong>Shipping Address:</strong> ").append(getShippingAddress()).append("</p>\n");
        html.append("        <p><strong>Billing Address:</strong> ").append(getBillingAddress()).append("</p>\n");
        html.append("      </div>\n");
        html.append("    </div>\n");

        // Display Cart Items
        html.append("    <h2>Cart Items</h2>\n");
        html.append("    <table class=\"table table-striped\">\n");
        html.append("      <thead>\n");
        html.append("        <tr>\n");
        html.append("          <th>Item</th>\n");
        html.append("          <th>Quantity</th>\n");
        html.append("          <th>Price</th>\n");
        "        </tr>\n");
        html.append("      </thead>\n");
        html.append("      <tbody>\n");
        for (CartItem item : cartItem.getItems()) {
            html.append("        <tr>\n");
            html.append("          <td>").append(item.getName()).append("</td>\n");
            html.append("          <td>").append(item.getQuantity()).append("</td>\n");
            html.append("          <td>").append(item.getPrice()).append("</td>\n");
            html.append("        </tr>\n");
        }
        html.append("      </tbody>\n");
        html.append("    </table>\n");

        // Add a remove item functionality (Example, needs further development)
        html.append("    <button type=\"button\" class=\"btn btn-primary\" onclick=\"removeCartItem('item1')\">Remove Item</button>\n");

        // End the HTML structure
        html.append("  </div>\n");
        html.append("</body>\n");
        html.append("</html>\n");

        return html.toString();
    }

    private String getOrderId() {
        // Placeholder - Replace with actual logic to get order ID
        return "ORD-2024-001";
    }

    private String getDate() {
        // Placeholder - Replace with actual logic to get order date
        return "2024-10-27";
    }

    private String getTotal() {
        // Placeholder - Replace with actual logic to calculate total
        return "120.00";
    }

    private String getShippingAddress() {
        // Placeholder - Replace with actual logic to get shipping address
        return "123 Main Street, Anytown, USA";
    }

    private String getBillingAddress() {
        // Placeholder - Replace with actual logic to get billing address
        return "123 Main Street, Anytown, USA";
    }
}