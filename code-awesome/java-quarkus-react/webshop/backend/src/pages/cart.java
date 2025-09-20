package pages;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<String, Integer> items = new HashMap<>();

    public Cart() {}

    public void addItem(String productId, int quantity) {
        items.put(productId, items.getOrDefault(productId, 0) + quantity);
    }

    public void removeItem(String productId, int quantity) {
        int currentQuantity = items.getOrDefault(productId, 0);
        if (currentQuantity > quantity) {
            items.put(productId, 0);
        } else {
            items.put(productId, currentQuantity - quantity);
            if (items.get(productId) <= 0) {
                items.remove(productId);
            }
        }
    }


    public Map<String, Integer> getItems() {
        return new HashMap<>(items); // Return a copy to prevent external modification
    }


    public String toJSON() {
        try {
            ObjectMapper mapper = new ObjectMapper();
            return mapper.writeValueAsString(getItems());
        } catch (Exception e) {
            // Handle JSON serialization errors - crucial for security
            return "{ \"error\": \"Failed to serialize cart to JSON\"}";
        }
    }
}