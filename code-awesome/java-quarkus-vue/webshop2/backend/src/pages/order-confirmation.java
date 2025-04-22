package pages;

import io.quarkus.runtime.annotations.SecurityConfig;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.inject.Inject;

import pages.OrderConfirmationPage;

@SecurityConfig
public class OrderConfirmationPage {

    private static final Logger log = LoggerFactory.getLogger(OrderConfirmationPage.class);

    private String cartContents;

    @Inject
    public OrderConfirmationPage() {
        log.info("OrderConfirmationPage instantiated");
        this.cartContents = getCartContents();
    }

    private String getCartContents() {
        log.info("Fetching cart contents");
        // Simulate database retrieval
        // Replace with actual database query
        List<String> items = new ArrayList<>();
        items.add("Cute Kitten Toy");
        items.add("Fluffy Bunny Plush");
        return String.join(", ", items);
    }

    public String displayOrderConfirmation() {
        log.info("Displaying order confirmation");
        return "<h1>Order Confirmation</h1><p>Thank you for your order!</p><p>Cart Contents: " +
               cartContents + "</p><form><button type='submit'>Confirm Order</button></form>";
    }
}