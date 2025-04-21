package pages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/checkout")
public class Checkout {

    private final String cuteName = "Pip";

    @RequestMapping
    public String checkoutPage(Model model) {
        model.addAttribute("cuteName", cuteName);
        return "checkout.tsx";
    }

    @RequestMapping("/cart/{cartId}")
    public String viewCart(@PathVariable String cartId, Model model) {
        //Simulated cart data - Replace with actual DB query
        List<String> cartItems = List.of("Cute Plushie", "Shiny Trinket");
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("cuteName", cuteName);
        return "checkout.tsx";
    }

    @RequestMapping("/confirm")
    public String confirmCheckout(Model model) {
        model.addAttribute("cuteName", cuteName);
        return "confirmation.tsx";
    }
}