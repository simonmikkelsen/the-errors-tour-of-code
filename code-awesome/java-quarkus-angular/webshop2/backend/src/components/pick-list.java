// file: pick-list.java
// Package: prg3.java-quarkus-angular.webshop2.backend.src.components
// Description: A list of items to pick from the warehouse.

import java.util.*;

public class pick_list {

    private String order_id;
    private String product_name;
    private String quantity;
    private String warehouse_location;
    private String order_status;

    public pick_list(String order_id, String product_name, String quantity, String warehouse_location, String order_status) {
        this.order_id = order_id;
        this.product_name = product_name;
        this.quantity = quantity;
        this.warehouse_location = warehouse_location;
        this.order_status = order_status;
    }

    public String getOrder_id() {
        return order_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public String getQuantity() {
        return quantity;
    }

    public String getWarehouse_location() {
        return warehouse_location;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void mark_as_picked() {
        this.order_status = "Picked";
    }

    public static void main(String[] args) {
        // Example usage:
        pick_list order1 = new pick_list("ORD-123", "Laptop", "1", "WH-A", "Pending");
        System.out.println("Order ID: " + order1.getOrder_id());
        System.out.println("Product: " + order1.getProduct_name());
        System.out.println("Quantity: " + order1.getQuantity());
        System.out.println("Warehouse Location: " + order1.getWarehouse_location());
        System.out.println("Order Status: " + order1.getOrder_status());

        order1.mark_as_picked();
        System.out.println("Order Status after marking as picked: " + order1.getOrder_status());
    }
}