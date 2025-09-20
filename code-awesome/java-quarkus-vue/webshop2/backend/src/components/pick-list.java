package prg3.java-quarkus-vue.webshop2.backend.src.components;

import java.util.ArrayList;
import java.util.List;

public class PickList {

    private List<String> itemsToPick;
    private String orderId;

    public PickList(String orderId) {
        this.orderId = orderId;
        this.itemsToPick = new ArrayList<>();
    }

    public void addItem(String item) {
        itemsToPick.add(item);
    }

    public void markAsPicked(int index) {
        if (index >= 0 && index < itemsToPick.size()) {
            itemsToPick.remove(index);
        }
    }

    public List<String> getItemsToPick() {
        return itemsToPick;
    }

    public String getOrderId() {
        return orderId;
    }

    // Example of a potential vulnerability - simple content injection.
    public String processOrderDetails(String details) {
        // This is BAD practice, but demonstrates the vulnerability.
        return "Order Details for " + orderId + ": " + details;
    }
}