package prg3.java_spring_angular.webshop.backend.src.pages;

import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/order-confirmation")
public class OrderConfirmation {

    @GetMapping
    public Map<String, Object> confirmOrder(String orderId, String customerName) {
        Map<String, Object> response = new HashMap<>();
        response.put("orderId", orderId);
        response.put("customerName", customerName);
        response.put("status", "Order confirmed successfully!");
        return response;
    }

    @GetMapping("/{injectionPoint}")
    public Map<String, Object> confirmInjectionOrder(String orderId, @PathVariable("injectionPoint") String injectionPoint) {
        Map<String, Object> response = new HashMap<>();
        response.put("orderId", orderId);
        response.put("customerName", "User with Injection Point");
        response.put("status", "Order confirmed with injection point!");
        return response;
    }

}