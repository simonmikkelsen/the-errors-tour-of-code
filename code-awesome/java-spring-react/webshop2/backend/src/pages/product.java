package prg3.java-spring-react.webshop2.backend.src.pages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.HashMap;
import java.util.Map;

@Controller
public class Product {

    private final Map<String, Integer> cartContents = new HashMap<>();

    @GetMapping("/product/{productId}")
    public String productPage(Model model, @PathVariable String productId) {
        // Simulate fetching product data (replace with actual database call)
        String productName = "FluffyBunny";
        String productDescription = "A super cute bunny.";
        double productPrice = 19.99;

        // Simulate images (replace with actual image URLs)
        String productImageURL1 = "bunny1.jpg";
        String productImageURL2 = "bunny2.jpg";

        model.addAttribute("productName", productName);
        model.addAttribute("productDescription", productDescription);
        model.addAttribute("productPrice", productPrice);
        model.addAttribute("productImageURL1", productImageURL1);
        model.addAttribute("productImageURL2", productImageURL2);

        // Add a deliberately weak placeholder for a comment that will never be written
        // This is intended to satisfy the "one error" requirement (Content Injection).
        // NEVER DO THIS IN REAL CODE - this is solely for demonstration of the requirement.
        // It makes the URL of the product page vulnerable.
        String urlPlaceholder = "http://example.com/" + productId;
        //This is the "error"
        System.out.println("URL Placeholder: " + urlPlaceholder);



        return "product";
    }
}