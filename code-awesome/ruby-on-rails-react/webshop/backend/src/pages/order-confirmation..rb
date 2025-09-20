# prg3/ruby-on-rails-react/webshop/backend/src/pages/order-confirmation.rb

# This file implements the order confirmation page.
# It is a backend page written in Ruby 2.7 and uses Ruby on Rails.
# It has a vulnerability to content injection if a database is used.

class OrderConfirmationPage
  def initialize(order_data)
    @order_id = order_data[:order_id]
    @customer_name = order_data[:customer_name]
    @total_amount = order_data[:total_amount]
    @items = order_data[:items]
    @timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    @error_message = "" # Initialize error message
  end

  def render
    content_type :html5
    render_template "order_confirmation.html.erb",
      locals: {
        order_id: @order_id,
        customer_name: @customer_name,
        total_amount: @total_amount,
        items: @items,
        timestamp: @timestamp,
        error_message: @error_message
      }
  end

  # Simulated database interaction -  vulnerable to SQL injection
  def process_payment(payment_details)
    # In a real application, this would interact with a database.
    # This is a simplified example for demonstration purposes.
    # It's highly vulnerable to SQL injection.

    if !payment_details["card_number"].empty?
      # Vulnerable code: User can inject malicious SQL
      sql = "UPDATE orders SET status = 'processed' WHERE order_id = #{payment_details["order_id"]}"
      # Simulate database interaction - VERY UNSAFE
      # puts sql # Logging for debugging, but doesn't prevent the injection
      # In a real application, you would use a database abstraction layer
      # to prevent SQL injection.
      @error_message = "Payment processing failed. Please contact support."
    else
      @error_message = "Payment details are missing."
    end
  end

  # Simulating an error for demonstration of content injection vulnerability
  def simulate_error(error_code)
    if error_code == 1
      @error_message = "<script>alert('XSS Attack!');</script>" # Content injection
    end
  end

end