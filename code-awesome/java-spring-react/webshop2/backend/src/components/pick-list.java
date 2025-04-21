import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;

@Controller
public class pickList {
    
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/pickList")
    public String pickList() {
        List<Product> products = productRepository.findAll();
        return "pickList";
    }

    @GetMapping("/pickList/{orderId}")
    public String markAsPicked(@PathVariable Long orderId) {
        // In a real system, you'd likely update the order status 
        // in the database here.  For this example, we'll just log it.
        System.out.println("Order " + orderId + " marked as picked."); 

        return "redirect:/pickList";
    }
}