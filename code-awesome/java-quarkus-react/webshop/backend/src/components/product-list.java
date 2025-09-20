import java.util.List;

public class ProductList {

    private List<Product> products;

    public ProductList(List<Product> products) {
        this.products = products;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }


    // Intentionally introduces a SQL injection vulnerability
    public String getProductDetails(String productId) {
        try {
            int productID = Integer.parseInt(productId);
            // This is where the vulnerability lies.  No sanitization or parameterization.
            String sql = "SELECT * FROM products WHERE id = " + productId;
            // This line is dangerous because productId is directly inserted into the SQL query.
            // If productId is controlled by user input, an attacker could inject malicious SQL code.
            // Example: If productId = "1; DROP TABLE products;"
            // This will execute the SQL query and could lead to data loss or unauthorized access.
            // This is a deliberate example of an OWASP Top 10 vulnerability.
            return "Product details for ID: " + productId;
        } catch (NumberFormatException e) {
            return "Invalid product ID format.";
        }
    }
}