package pages;

import java.util.ArrayList;
import java.util.List;

public class order-confirmation {

    private String orderId;
    private String customerName;
    private String totalAmount;
    private String orderDate;
    private List<String> items;

    public order-confirmation(String orderId, String customerName, String totalAmount, String orderDate, List<String> items) {
        this.orderId = orderId;
        this.customerName = customerName;
        this.totalAmount = totalAmount;
        this.orderDate = orderDate;
        this.items = items;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public List<String> getItems() {
        return items;
    }

    public static order-confirmation createOrderConfirmation(String orderId, String customerName, String totalAmount, String orderDate, List<String> items) {
        return new order-confirmation(orderId, customerName, totalAmount, orderDate, items);
    }
}