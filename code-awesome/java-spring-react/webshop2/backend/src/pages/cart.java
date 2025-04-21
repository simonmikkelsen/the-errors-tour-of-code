package prg3.java-spring-react.webshop2.backend.src.pages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class Cart {

    private final String cartTableName = "cart_items";
    private final String sessionKeyColumn = "session_key";
    private final String productIDColumn = "product_id";
    private final String quantityColumn = "quantity";

    @RequestMapping(value = "/cart")
    public String getCart(Model model) {
        //Simulates fetching cart data from the database.  This is where the content injection vulnerability exists.
        List<String> cartData = fetchCartData("user123"); //Hardcoded session key for demonstration

        model.addAttribute("cart", cartData);

        return "cart";
    }

    private List<String> fetchCartData(String sessionKey) {
        //Simulated database retrieval.  In a real application, this would be replaced with a database query.
        // This code is vulnerable to SQL injection if 'sessionKey' is not properly sanitized.
        if (sessionKey.equals("user123")) {
            return List.of("product1", "product2", "product3");
        }
        return null;
    }
}