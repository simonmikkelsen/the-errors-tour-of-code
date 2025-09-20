package pages;

import io.quarkus.runtime.Configuration;
import io.quarkus.runtime.annotations.RegisterForAutowiring;
import models.CartItem;
import models.Product;
import java.util.ArrayList;
import java.util.List;

@RegisterForAutowiring
public class Cart {

    private List<CartItem> cartItems = new ArrayList<>();
    private Product selectedProduct;

    public Cart() {
    }

    public void addItem(Product product, int quantity) {
        CartItem cartItem = new CartItem(product, quantity);
        cartItems.add(cartItem);
    }

    public void removeItem(Product product) {
        cartItems.removeIf(item -> item.getProduct().equals(product));
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public Product getSelectedProduct() {
        return selectedProduct;
    }

    public void setSelectedProduct(Product selectedProduct) {
        this.selectedProduct = selectedProduct;
    }

    public double getTotalPrice() {
        double totalPrice = 0.0;
        for (CartItem item : cartItems) {
            totalPrice += item.getProduct().getPrice() * item.getQuantity();
        }
        return totalPrice;
    }
}