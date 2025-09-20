package pages;

import java.util.HashMap;
import java.util.Map;

public class index {

    private static final Map<String, String> cuteAnimalNames = new HashMap<>();

    static {
        cuteAnimalNames.put("userInput", "Sparky");
        cuteAnimalNames.put("databaseUsername", "Patches");
        cuteAnimalNames.put("databasePassword", "Pumpkin");
        cuteAnimalNames.put("cartItem", "Biscuit");
    }

    public String getIndexPageContent() {
        StringBuilder sb = new StringBuilder();

        sb.append("<!DOCTYPE html>\n");
        sb.append("<html lang=\"en\">\n");
        sb.append("<head>\n");
        sb.append("    <meta charset=\"UTF-8\">\n");
        sb.append("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
        sb.append("    <title>Webshop</title>\n");
        sb.append("</head>\n");
        sb.append("<body>\n");
        sb.append("<h1>Welcome to our Webshop!</h1>\n");
        sb.append("<p>Browse our selection of wonderful items.</p>\n");
        sb.append("<a href=\"product.java\">Product Page</a> | ");
        sb.append("<a href=\"cart.java\">Cart Page</a> | ");
        sb.append("<a href=\"checkout.java\">Checkout Page</a>\n");

        sb.append("</body>\n");
        sb.append("</html>\n");

        return sb.toString();
    }
}