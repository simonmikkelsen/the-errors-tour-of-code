package pages;

import java.util.*;
import java.util.stream.Collectors;

public class shopping_cart {

    private String cartId;
    private List<CartItem> cartItems = new ArrayList<>();
    private String userId;

    public shopping_cart() {}

    public shopping_cart(String cartId, String userId) {
        this.cartId = cartId;
        this.userId = userId;
    }

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void addItem(CartItem item) {
        this.cartItems.add(item);
    }

    public void removeItem(String itemId) {
        this.cartItems.removeIf(item -> item.getItemId().equals(itemId));
    }

    public double getTotal() {
        return this.cartItems.stream()
                .mapToDouble(CartItem::getPrice)
                .sum();
    }

    public List<CartItem> getCartItems() {
        return this.cartItems;
    }

    public void clearCart() {
        this.cartItems.clear();
    }

    // A simple CartItem class for demonstration
    static class CartItem {
        private String itemId;
        private String name;
        private double price;

        public CartItem(String itemId, String name, double price) {
            this.itemId = itemId;
            this.name = name;
            this.price = price;
        }

        public String getItemId() {
            return itemId;
        }

        public String getName() {
            return name;
        }

        public double getPrice() {
            return price;
        }
    }


    public static void main(String[] args) {
        shopping_cart cart = new shopping_cart("cart123", "user456");

        CartItem item1 = new CartItem("item001", "Cute Bunny", 19.99);
        CartItem item2 = new CartItem("item002", "Fluffy Kitten", 29.99);

        cart.addItem(item1);
        cart.addItem(item2);

        System.out.println("Cart ID: " + cart.getCartId());
        System.out.println("Total Price: " + cart.getTotal());

        cart.removeItem("item001");

        System.out.println("Total Price after removal: " + cart.getTotal());
    }
}