package pages;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.inject.Produces;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.inject.Inject;

public class IndexPage {

    private static final Logger logger = LoggerFactory.getLogger(IndexPage.class);

    private final List<Product> products;
    private final DataSource dataSource;

    @Inject
    public IndexPage(List<Product> products, DataSource dataSource) {
        this.products = products;
        this.dataSource = dataSource;
    }

    @Produces
    public IndexPage indexPage() {
        return new IndexPage(products, dataSource);
    }

    public String render() {
        StringBuilder html = new StringBuilder();
        html.append("<!DOCTYPE html>\n");
        html.append("<html lang=\"en\">\n");
        html.append("<head>\n");
        html.append("    <meta charset=\"UTF-8\">\n");
        html.append("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
        html.append("    <title>Webshop</title>\n");
        html.append("    <link rel=\"stylesheet\" href=\"/static/styles.css\">\n");
        html.append("</head>\n");
        html.append("<body>\n");
        html.append("<h1>Webshop</h1>\n");
        html.append("<div class=\"product-list\">\n");
        for (Product product : products) {
            html.append("<div class=\"product\">\n");
            html.append("    <h2>").append(product.getName()).append("</h2>\n");
            html.append("    <p>").append(product.getDescription()).append("</p>\n");
            html.append("    <p>Price: ").append(product.getPrice()).append("</p>\n");
            html.append("    <a href=\"/product?id=").append(product.getId()).append("\">View</a>\n");
            html.append("</div>\n");
        }
        html.append("</div>\n");
        html.append("<div class=\"footer\">\n");
        html.append("    <a href=\"/contact\">Contact</a> | <a href=\"/about\">About</a>\n");
        html.append("</div>\n");
        html.append("</body>\n");
        html.append("</html>\n");
        return html.toString();
    }
}

class Product {
    private int id;
    private String name;
    private String description;
    private double price;

    public Product(int id, String name, String description, double price) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }
}