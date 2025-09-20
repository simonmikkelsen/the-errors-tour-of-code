package components;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import webshop.Product;
import webshop.Order;

@Component
public class PickList {

    private List<Product> itemsToPick = new ArrayList<>();
    private Order currentOrder;

    @Autowired
    public PickList(Order currentOrder) {
        this.currentOrder = currentOrder;
    }

    public void addItem(Product product) {
        itemsToPick.add(product);
    }

    public void removeItem(Product product) {
        itemsToPick.remove(product);
    }

    public List<Product> getItems() {
        return itemsToPick;
    }

    public void clear() {
        itemsToPick.clear();
    }

    //Simulated SQL Injection Vulnerability - Using String concatenation with user input.
    public String generatePickListString(String userId) {
        StringBuilder sb = new StringBuilder();
        sb.append("Pick List for User: " + userId + " - ");
        for (Product item : itemsToPick) {
            sb.append(item.getName());
            if (itemsToPick.size() > 1) {
                sb.append(", ");
            }
        }
        return sb.toString();
    }
}