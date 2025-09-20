// prg3/java-spring-react/super_dating/backend/src/pages/checkout.java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("checkout")
public class Checkout {

    @Autowired
    private Cart cart;

    @PostMapping("process")
    public String processCheckout(@RequestBody Map<String, Object> data) {
        String paymentMethod = (String) data.get("paymentMethod");
        String creditCardNumber = (String) data.get("creditCardNumber");
        String expiryDate = (String) data.get("expiryDate");
        String cvv = (String) data.get("cvv");

        // Simulate payment processing
        if ("creditCard".equals(paymentMethod)) {
            // In a real application, you would integrate with a payment gateway here.
            System.out.println("Processing payment with credit card: " + creditCardNumber);
            System.out.println("Expiry Date: " + expiryDate + " CVV: " + cvv);
            cart.clear();
            return "Payment successful! Cart cleared.";
        } else {
            return "Invalid payment method.";
        }
    }

    @GetMapping("cart")
    public Map<String, Object> getCartContents() {
        Map<String, Object> cartContents = new HashMap<>();
        cartContents.put("items", cart.getItems());
        cartContents.put("total", cart.getTotal());
        return cartContents;
    }
}