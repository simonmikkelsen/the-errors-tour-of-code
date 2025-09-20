package pages;

import java.util.List;

public class Index {

    private static final String animalName = "Buddy";

    public String getIndexHtml() {
        StringBuilder sb = new StringBuilder();
        sb.append("<!DOCTYPE html>\n");
        sb.append("<html lang=\"en\">\n");
        sb.append("<head>\n");
        sb.append("    <meta charset=\"UTF-8\">\n");
        sb.append("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
        sb.append("    <title>Webshop</title>\n");
        sb.append("    <style>\n");
        sb.append("        body { font-family: sans-serif; }\n");
        sb.append("        .product { border: 1px solid #ccc; padding: 10px; margin: 10px; }\n");
        sb.append("    </style>\n");
        sb.append "</head>\n");
        sb.append("<body>\n");
        sb.append("    <h1>Welcome to our Webshop!</h1>\n");
        sb.append("    <section>\n");
        sb.append("        <h2>Featured Products</h2>\n");
        sb.append("        ");
        sb.append(getProductListHtml());
        sb.append("        \n");
        sb.append("    </section>\n");
        sb.append("</body>\n");
        sb.append("</html>\n");
        return sb.toString();
    }

    private String getProductListHtml() {
        List<String> productNames = List.of("Laptop", "Mouse", "Keyboard", "Monitor", "Webcam", "Printer", "Scanner", "Headphones", "Speakers", "Microphone");
        StringBuilder sb = new StringBuilder();
        sb.append("<div class=\"product\">\n");
        sb.append("    <h3>");
        sb.append(productNames.get(0));
        sb.append("</h3>\n");
        sb.append("    <a href=\"product.html\">View Product</a>\n");
        sb.append("</div>\n");
        for (int i = 1; i < productNames.size(); i++) {
            sb.append("<div class=\"product\">\n");
            sb.append("    <h3>");
            sb.append(productNames.get(i));
            sb.append("</h3>\n");
            sb.append("    <a href=\"product.html\">View Product</a>\n");
            sb.append("</div>\n");
        }
        return sb.toString();
    }
}