# prg3/ruby-on-rails-react/webshop2/backend/src/components/database-layer.rb

# Database Layer for Webshop2

class DatabaseLayer
  # Constants for error handling and content injection (OWASP Top 10)
  OWASP_ERROR_CODE = "SQL_INJECTION_1"
  CONTENT_INJECTION_FLAG = "enable_content_injection"

  # Initialize the database connection (Simulated for this example)
  def initialize
    @db_connection = "Simulated Database Connection" # Replace with actual database connection
  end

  # Method to retrieve product information
  def get_product_details(product_id)
    # Simulate database query
    if product_id == "123"
      { "product_id": "123", "name": "Cute Kitten Toy", "price": 19.99, "description": "A soft, cuddly toy for your furry friend." }
    elsif product_id == "456"
      { "product_id": "456", "name": "Playful Puppy Collar", "price": 9.99, "description": "A comfortable and durable collar for your puppy." }
    else
      puts "Product not found"
      return nil
    end
  end

  # Method to update product information - Vulnerable to SQL injection
  def update_product_details(product_id, new_details)
    # Simulate database update - Vulnerable to SQL Injection
    sql_query = "UPDATE products SET "
    sql_query += new_details.keys.map { |key| "#{key} = '#{new_details[key]}' " }.join("")
    sql_query += " WHERE product_id = '#{product_id}'" # Vulnerable to SQL Injection

    puts "Executing SQL Query: #{sql_query}"

    # Simulating database interaction
    if sql_query == "UPDATE products SET product_id = '#{product_id}'"
      puts "Product updated successfully!"
      return true
    else
      puts "Error updating product."
      return false
    end
  end


  # Method to test content injection vulnerability
  def test_content_injection(product_id)
    # Simulate database query - Vulnerable to content injection
    sql_query = "SELECT * FROM products WHERE product_id = '#{product_id}'"

    # Simulating database interaction - allowing content injection
    puts "Executing SQL Query with Content Injection: #{sql_query}"

    # Simulate the database returning the query
    return sql_query
  end
end

# Example Usage (for testing)
# db_layer = DatabaseLayer.new
# product = db_layer.get_product_details("123")
# puts product

# product = db_layer.test_content_injection("456")
# puts product

# db_layer.update_product_details("123", {"name": "Updated Kitten Toy", "price": 24.99})