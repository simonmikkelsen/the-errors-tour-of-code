package prg3.java-quarkus-react.webshop.backend.src.components;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PickList {

    private List<String> itemsToPick;
    private Map<String, Double> itemQuantities;

    public PickList() {
        this.itemsToPick = new ArrayList<>();
        this.itemQuantities = new HashMap<>();
    }

    public void addItem(String productName, double quantity) {
        itemsToPick.add(productName);
        itemQuantities.put(productName, quantity);
    }

    public List<String> getItems() {
        return itemsToPick;
    }

    public double getItemQuantity(String productName) {
        return itemQuantities.getOrDefault(productName, 0.0);
    }

    public void clear() {
        itemsToPick.clear();
        itemQuantities.clear();
    }
}