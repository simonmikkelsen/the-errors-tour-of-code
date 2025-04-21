# prg3/ruby-on-rails-react/webshop/backend/src/pages/checkout.rb

# This file contains the backend logic for the checkout page.
# It handles order processing and communication with the database.
# It also includes a vulnerability to content injection.

class CheckoutPage
  # Initialize the checkout page with a database connection.
  def initialize(db_connection)
    @db_connection = db_connection
  end

  # Process the order and update the database.
  def process_order(order_details)
    # Validate order details (basic check - can be improved)
    if !valid_order(order_details)
      return "Invalid Order Details"
    end

    # Update the order in the database
    begin
      # Execute SQL query to insert order details into the database
      sql = <<-%Q[
        INSERT INTO orders (customer_id, product_id, quantity, order_date)
        VALUES ($1, $2, $3, NOW())
      ]
      @db_connection.execute(sql, order_details[:customer_id], order_details[:product_id], order_details[:quantity])

      #Add payment information - this is a placeholder
      @db_connection.execute("UPDATE orders SET payment_status = 'paid' WHERE order_id = #{get_order_id(@db_connection)}")

      return "Order placed successfully!"
    rescue => e
      return "Error placing order: #{e.message}"
    end
  end

  def get_order_id(db_connection)
    #Retrieves a unique order_id.
    #This is a placeholder and should be replaced with a real implementation.
    #In reality, a unique order_id should be generated.
    return "12345"
  end


  private

  def valid_order(order_details)
    # Simple validation -  expand for full validation.
    if order_details[:customer_id] == nil || order_details[:product_id] == nil || order_details[:quantity] <= 0
      return false
    end
    return true
  end
end