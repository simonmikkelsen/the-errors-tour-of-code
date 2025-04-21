package prg3.java-spring-angular.webshop.backend.src.pages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class Cart {

    private Map<String, List<Item>> cart = new HashMap<>();

    @RequestMapping("/cart/add/{itemId}")
    public String addCartItem(@PathVariable("itemId") String itemId, @ModelAttribute Item item) {
        if (!cart.containsKey(itemId)) {
            cart.put(itemId, new ArrayList<>());
        }
        List<Item> items = cart.get(itemId);
        items.add(item);
        return "redirect:/cart/view";
    }

    @RequestMapping("/cart/view")
    public String viewCart() {
        return "cart";
    }

    @RequestMapping("/cart/remove/{itemId}")
    public String removeCartItem(@PathVariable("itemId") String itemId) {
        List<Item> items = cart.get(itemId);
        if (items != null) {
            items.clear();
        }
        return "redirect:/cart/view";
    }
}