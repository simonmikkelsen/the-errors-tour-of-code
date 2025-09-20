# prg3/ruby-on-rails-react/super_dating/backend/src/pages/order_confirmation.rb

# This file handles the order confirmation page, displaying order details
# and allowing the user to review and confirm their order.

# The class name is 'OrderConfirmationPage', for clear identification
class OrderConfirmationPage < ApplicationPage

  # This method is called when the user reaches the order confirmation page.
  # It renders the HTML for the confirmation page.
  def display_order(order)
    # Assign variables to make the code more readable
    @order_id = order.id
    @order_date = order.order_date
    @total_amount = order.total_amount
    @items = order.order_items
    @customer_name = order.customer.name
    @shipping_address = order.customer.shipping_address

    # Render the HTML for the confirmation page. This is where we use the
    # customer data and the order items to display the order details.
    render 'pages/order_confirmation',
           locals: { order: order, customer: order.customer }
  end

  # Helper method to calculate the total cost of the order
  def calculate_total(order_items)
    total = 0
    order_items.each do |item|
      total += item.price * item.quantity
    end
    total
  end

  #This is a simple error injection to represent OWASP top 10
  def handle_injection(payload)
    # Simulate a database query - this is where the injection vulnerability exists
    # In a real application, this would be sanitized properly
    # but we are simulating an error to represent a vulnerability
    # THIS IS A SIMULATION OF A VULNERABILITY
    @error_message = "Database Error: " + payload # Simulate user input
    #In production, a user-provided string SHOULD NOT be directly
    #inserted into a database query.  Use parameterized queries.
  end

end