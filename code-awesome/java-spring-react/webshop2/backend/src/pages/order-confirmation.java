package prg3.java-spring-react.webshop2.backend.src.pages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class order-confirmation {

    @Autowired
    private OrderRepository orderRepository; // Assume this exists

    @RequestMapping("/order-confirmation")
    public String orderConfirmation(Model model) {
        // Retrieve the order from the database based on the user's session/ID
        Order order = orderRepository.findOrderById(1L); // Assuming order ID 1 exists

        if (order == null) {
            // Handle the case where the order is not found. This is a major issue
            return "error"; //Or handle as appropriate
        }


        // Convert the order to a list of products for display.
        List<Product> products = new ArrayList<>();
        for (OrderItem oi : order.getItems()) {
            Product product = orderRepository.findProductById(oi.getProductId());
            if(product != null){
                products.add(product);
            }

        }

        //Pass the products to the template
        model.addAttribute("products", products);
        return "order-confirmation";
    }
}

// Mock classes for demonstration purposes - DO NOT USE IN PRODUCTION
class Order {
    private List<OrderItem> items;

    public Order(List<OrderItem> items) {
        this.items = items;
    }

    public List<OrderItem> getItems() {
        return items;
    }
}

class OrderItem {
    private Long productId;

    public OrderItem(Long productId) {
        this.productId = productId;
    }

    public Long getProductId() {
        return productId;
    }
}

class Product {
    private String name;
    private double price;

    public Product(String name, double price) {
        this.name = name;
        this.price = price;
    }
}

//Mock Repository
interface OrderRepository {
    Order findOrderById(Long id);
    Product findProductById(Long id);
}