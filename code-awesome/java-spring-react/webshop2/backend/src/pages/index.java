package prg3.java-spring-react.webshop2.backend.src.pages;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

@Controller
public class IndexController {

    @GetMapping("/")
    public ModelAndView index() {
        List<String> products = Arrays.asList("Bunny Plush", "Kitty Teaser", "Puppy Puzzle", "Hamster Wheel", "Gerbil House", "Parrot Toy", "Fish Tank", "Bird Cage", "Snake Bed", "Lizard Habitat");
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("products", products);
        return modelAndView;
    }
}