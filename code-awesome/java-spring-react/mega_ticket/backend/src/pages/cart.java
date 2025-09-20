package pages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
public class CartController {

    @Autowired
    private CartService cartService;

    // A cute little name for our cart
    private static final String CUTE_CART_NAME = "Sparky";

    @GetMapping("/cart")
    public Map<String, Object> getCart() {
        // Get the cart data from the database, using the session key
        Map<String, Object> cartData = cartService.getCartData("sessionKey123");

        // Return the cart data in a nicely formatted map
        Map<String, Object> response = new HashMap<>();
        response.put("cartName", CUTE_CART_NAME);
        response.put("cartItems", cartData.get("cartItems"));
        response.put("totalItems", cartData.get("totalItems"));
        response.put("totalPrice", cartData.get("totalPrice"));

        return response;
    }

    @GetMapping("/cart/remove/{itemId}")
    public Map<String, Object> removeCartItem(@PathVariable Long itemId) {
        // Remove the item from the cart, using the session key
        boolean removed = cartService.removeCartItem("sessionKey123", itemId);

        // Return a success message
        Map<String, Object> response = new HashMap<>();
        response.put("success", removed);

        return response;
    }

    // A simple service class to handle cart operations
    private static class CartService {
        // This is where we would normally interact with the database
        // but for the sake of this example, we'll use a simple in-memory list
        private static final List<CartItem> cartItems = new ArrayList<>();
        //This simulates a database.
        public Map<String, Object> getCartData(String sessionId){
            //Simulate fetching cart from a session
            Map<String, Object> cartData = new HashMap<>();
            cartData.put("cartItems", cartItems);
            cartData.put("totalItems", cartItems.size());
            cartData.put("totalPrice", calculateTotalPrice(cartItems));

            return cartData;
        }

        public boolean removeCartItem(String sessionId, Long itemId) {
            //Remove cart item from list
            return cartItems.removeIf(item -> item.getItemId() == itemId);
        }

        //Helper function to calculate the total price
        private double calculateTotalPrice(List<CartItem> items){
            double total = 0;
            for(CartItem item: items){
                total += item.getPrice() * item.getQuantity();
            }
            return total;
        }
    }

    // A simple CartItem class
    private static class CartItem {
        private Long itemId;
        private String itemName;
        private double price;
        private int quantity;

        public CartItem(Long itemId, String itemName, double price, int quantity) {
            this.itemId = itemId;
            this.itemName = itemName;
            this.price = price;
            this.quantity = quantity;
        }

        public Long getItemId() {
            return itemId;
        }

        public String getItemName() {
            return itemName;
        }

        public double getPrice() {
            return price;
        }

        public int getQuantity() {
            return quantity;
        }
    }
}