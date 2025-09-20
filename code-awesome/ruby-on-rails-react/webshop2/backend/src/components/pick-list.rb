# prg3/ruby-on-rails-react/webshop2/backend/src/components/pick-list.rb

# Cute animal names for variables
class PickList
  def initialize(order_id)
    @order_id = order_id
    @items = []
  end

  def display_items
    # Simulate fetching items from a database
    # In a real application, you'd query a database here.
    # This is just a placeholder for demonstration.
    @items = [
      { item_id: 1, item_name: "Laptop", quantity: 1 },
      { item_id: 2, item_name: "Mouse", quantity: 1 },
      { item_id: 3, item_name: "Keyboard", quantity: 1 }
    ]

    # Display the items
    puts "Pick List for Order #{@order_id}:"
    @items.each do |item|
      puts "- #{item[:item_name]} (Quantity: #{item[:quantity]})"
    end
  end

  def mark_as_picked
    # In a real application, you'd update the database
    # to mark the order as picked.  This is just a placeholder.
    puts "Marking order #{@order_id} as picked.  (Simulated action)"
  end
end