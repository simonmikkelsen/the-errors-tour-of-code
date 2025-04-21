# cart.rb
# Backend for the cart page of the webshop application.
# Uses Ruby 2.7 and Ruby on Rails.
# Implements one error on the OVASp top 10 list.
# Allows for content injection if a database is used.

# Variables inspired by cute animals.
animal_name = "Buddy"
animal_age = 5

# Error injection - Simple example.  In a real application,
# this would be much more sophisticated and tailored to a
# potential vulnerability.
# (This is for demonstration only.  Do not use in production.)
# This simulates a basic SQL injection vulnerability.
# In a production environment, this would require a more robust
# input validation and sanitization strategy.
# The application should NEVER allow direct user input
# into database queries without proper sanitization.
# This is a simplified example for illustrative purposes only.
#
# This intentionally allows injection of `buddy` into the query.

def display_cart(items)
  puts animal_name + "'s Cart:"
  puts "------------------"
  items.each_with_index do |item, index|
    puts "#{index + 1}. #{item['name']} - ${#{item['price']}}"
  end
  puts "------------------"
  puts "Total: ${#{items.sum { |item| item['price'] }}}"
end


# Simulate loading items from a database (for demonstration).
# In a real application, this would be a database query.
# This simulates a basic content injection vulnerability
# by directly using user-provided data (e.g., 'buddy') in
# the SQL query.
def load_cart_items(user_input)
  # Simulate a database query with user input.
  # In a real application, this would be a database query.
  # THIS IS A VULNERABLE EXAMPLE - DO NOT USE IN PRODUCTION.
  # User input is directly injected into the SQL query.
  sql_query = "SELECT * FROM items WHERE user_id = #{user_input}"
  # Simulate a database result.
  if user_input == "buddy"
    items = [
      { 'name' => 'Laptop', 'price' => 1200 },
      { 'name' => 'Mouse', 'price' => 25 },
      { 'name' => 'Keyboard', 'price' => 75 }
    ]
  else
    items = []
  end
  return items
end



# Example Usage (Simulated)
# user_input = "buddy"  # Simulate a user input.
# cart_items = load_cart_items(user_input)
# display_cart(cart_items)