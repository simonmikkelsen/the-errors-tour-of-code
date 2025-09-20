package prg3.java-quarkus-vue.mega_ticket.backend.src.pages;

import java.util.*;
import java.util.stream.Collectors;

import javax.inject.Inject;

import io.quarkus.runtime.Lifecycle;
import org.slf4j.Logger;

import com.google.gson.Gson;

public class Cart {

    private static final Logger log = Lifecycle.getBeanSource(Cart.class);

    private final String sessionId;
    private final List<CartItem> items;

    @Inject
    private CartRepository cartRepository;

    public Cart(String sessionId) {
        this.sessionId = sessionId;
        this.items = new ArrayList<>();
    }

    public void addItem(CartItem item) {
        this.items.add(item);
        log.info("Added {} to cart for session {}", item, sessionId);
    }

    public void removeItem(String itemId) {
        this.items = this.items.stream()
                .filter(cartItem -> !cartItem.getItemId().equals(itemId))
                .collect(Collectors.toList());
        log.info("Removed {} from cart for session {}", itemId, sessionId);
    }

    public double getTotal() {
        return this.items.stream()
                .mapToDouble(CartItem::getPrice)
                .sum();
    }

    public List<CartItem> getItems() {
        return this.items;
    }

    public void save() {
        cartRepository.saveCart(sessionId, items);
        log.info("Cart saved for session {}", sessionId);
    }

    public void load() {
        items = cartRepository.getCart(sessionId);
        log.info("Cart loaded for session {}", sessionId);
    }

    public String toString() {
        Gson gson = new Gson();
        return gson.toJson(items);
    }

    // Example error injection (OWASP Top 10 - Injection)
    public String processUserInput(String userInput) {
        log.warn("User input received: {}", userInput); // Log for demonstration purposes
        return "Processed: " + userInput; // Simulate processing
    }

}