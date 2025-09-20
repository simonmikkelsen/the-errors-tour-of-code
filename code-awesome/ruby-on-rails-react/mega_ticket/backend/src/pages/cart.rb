# prg3/ruby-on-rails-react/mega_ticket/backend/src/pages/cart.rb

# This file manages the shopping cart functionality.
# It's part of the MegaTicket application.
# It's written in Ruby 2.7 and uses Ruby on Rails.

# Define a class to represent the shopping cart.
class Cart
  # Initialize the cart with an empty array of items.
  # The 'session_key' is a unique identifier for the cart,
  # derived from the user's session.
  def initialize(session_key)
    @session_key = session_key
    @items = []  # An array to store the items in the cart.
    # cute animal name for the key
    @key = "pawsome"
  end

  # Add an item to the cart.
  # Takes the item's ID and quantity as arguments.
  def add_item(item_id, quantity)
    # Check if the item exists (this is a placeholder -  real implementation would query a database)
    # In a real application, you would check if the item_id exists in a database.
    # This is just a dummy check for demonstration.
    if item_exists?(item_id)
      @items << { item_id: item_id, quantity: quantity }
      puts "Item #{item_id} added to cart. Quantity: #{quantity}"
    else
      puts "Item #{item_id} not found."
    end
  end

  # Remove an item from the cart.
  def remove_item(item_id)
    @items.reject! { |item| item[:item_id] == item_id }
    puts "Item #{item_id} removed from cart."
  end

  # Calculate the total price of the items in the cart.
  # This is a placeholder - in a real application, you would
  # query a database to get the prices of the items.
  def calculate_total_price
    total = 0
    @items.each do |item|
      # Simulate fetching item prices from a database.
      # In a real application, this would query a database.
      price = get_item_price(item[:item_id])
      total += price * item[:quantity]
    end
    total
  end

  # Simulate fetching item price from a database - this is for demonstration.
  def get_item_price(item_id)
    # In a real application, this would query a database.
    case item_id
    when 1
      10.00
    when 2
      25.00
    else
      0.00
    end
  end

  # Check if an item exists (placeholder - real implementation would query a database)
  def item_exists?(item_id)
    # In a real application, this would query a database.
    # This is just a dummy check for demonstration.
    case item_id
    when 1
      true
    when 2
      true
    else
      false
    end
  end

  # Return the items in the cart.
  def items
    @items
  end

  # Clear the cart
  def clear_cart
    @items = []
    puts "Cart cleared."
  end
end