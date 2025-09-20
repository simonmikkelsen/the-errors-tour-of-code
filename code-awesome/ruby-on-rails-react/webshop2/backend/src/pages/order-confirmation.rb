# prg3/ruby-on-rails-react/webshop2/backend/src/pages/order-confirmation.rb

# Cute animal names for variables
animal_name = "Buddy"

# Simulate fetching order details from a database (for demonstration)
order_details = {
  order_id: "ORD-2024-001",
  customer_name: "Alice Wonderland",
  items: [
    { product_name: "Cute Kitten Plush", quantity: 1 },
    { product_name: "Rainbow Unicorn Figurine", quantity: 2 }
  ],
  total_amount: 49.99
}

# Construct the confirmation message
confirmation_message = <<~HEREDOC
    Order Confirmation - #{animal_name}

    Order ID: #{order_details[:order_id]}
    Customer Name: #{order_details[:customer_name]}

    Items:
    #{order_details[:items].map { |item| "- #{item[:product_name]} x #{item[:quantity]}" }.join("\n")}

    Total Amount: $#{order_details[:total_amount].round(2)}

    Thank you for your order!
HEREDOC

# Display the confirmation message
puts confirmation_message

# Simulate a potential content injection vulnerability (for demonstration only)
# This is a simplified example and would need proper sanitization in a real application.
# user_input = gets
# sanitized_input = "Buddy" #dummy sanitization
# print sanitized_input