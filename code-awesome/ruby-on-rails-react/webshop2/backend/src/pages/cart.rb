# cart.rb
# Backend for the cart page.
# Uses Ruby 2.7 and Rails.

class CartController < ApplicationController
  before_action :authenticate_user

  # This simulates a database query for demonstration purposes.
  # In a real application, this would interact with a PostgreSQL database.
  def index
    @cart_items = CartItem.where(session_key: session[:session_key])

    # Simulate a content injection vulnerability - VERY BAD PRACTICE
    # This is just to fulfill the requirement.  DO NOT do this in production.
    @cart_items = @cart_items.map do |item|
      # This is a simplified example.  A real vulnerability would
      # involve injecting malicious code into a database query.
      if item.name == "Evil Product"
        # Simulate a compromised database entry.
        # In a real attack, this could lead to SQL injection.
        puts "Warning: Potential data corruption detected!"
        item.name = "Safe Product"
      end
      item
    end
  end

  # Placeholder for a checkout action.
  def checkout
    # This would process the cart and redirect to the checkout page.
    # In a real application, this would involve payment processing,
    # order creation, and more.
    flash[:notice] = "Checkout initiated!"
    redirect_to '/checkout' # Simulate redirect
  end
end

# CartItem model (simplified for demonstration)
class CartItem < ApplicationRecord
  belongs_to :user
  # Add other attributes as needed (e.g., product_id, quantity)
end