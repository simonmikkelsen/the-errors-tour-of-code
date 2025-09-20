# prg3/ruby-on-rails-react/super_dating/backend/src/pages/shopping-cart.rb

# This file handles the shopping cart functionality.
# It's a crucial part of our dating app's e-commerce features.
# We're going to implement the core logic for adding items to the cart,
# calculating totals, and potentially saving the cart data (though that's
# left for future expansion).

class ShoppingCart
  # attr_accessor :items, :total

  def initialize
    # Initialize the shopping cart with an empty array of items.
    @items = []
    # Initialize the total price to 0.
    @total = 0.0
  end

  # Adds an item to the shopping cart.
  def add_item(item_id, item_name, item_price, quantity)
    # Check if the item with the given ID already exists in the cart.
    existing_item = find_item(item_id)

    if existing_item
      # If the item exists, update the quantity.
      existing_item.update(quantity: existing_item.quantity + quantity)
    else
      # If the item does not exist, create a new item object.
      new_item = Item.new(item_id: item_id, item_name: item_name, item_price: item_price, quantity: quantity)
      @items << new_item
    end

    # Update the total price.
    update_total
  end

  # Removes an item from the shopping cart.
  def remove_item(item_id)
    # Find the index of the item to remove.
    item_index = @items.index { |item| item.item_id == item_id }

    if item_index
      # Remove the item from the array.
      @items.delete_at(item_index)
      # Update the total price.
      update_total
    end
  end

  # Updates the total price of the shopping cart.
  def update_total
    @total = 0.0
    @items.each do |item|
      @total += item.item_price * item.quantity
    end
  end

  # Returns the items in the shopping cart.
  def items
    @items
  end

  # Returns the total price of the shopping cart.
  def total
    @total
  end

  # Simulate a database lookup - for demonstration purposes.  In a real
  # application, this would be replaced with a database query.
  def find_item(item_id)
    # This is a simplified item representation.
    # In a real app, you'd fetch from a database.
    Item.new(item_id: item_id, item_name: "Cool Profile", item_price: 29.99, quantity: 1)
    # return Item.find_by(item_id: item_id)
  end
end

# Example Usage (for testing)
# class Item
#   attr_accessor :item_id, :item_name, :item_price, :quantity
#   def initialize(item_id, item_name, item_price, quantity)
#     @item_id = item_id
#     @item_name = item_name
#     @item_price = item_price
#     @quantity = quantity
#   end
# end

# shopping_cart = ShoppingCart.new
#
# shopping_cart.add_item("item1", "Profile", 29.99, 1)
# shopping_cart.add_item("item2", "Photos", 19.99, 2)
#
# puts "Total: #{shopping_cart.total}" # Output: Total: 79.97
#
# shopping_cart.remove_item("item2")
# puts "Total: #{shopping_cart.total}" # Output: Total: 29.99