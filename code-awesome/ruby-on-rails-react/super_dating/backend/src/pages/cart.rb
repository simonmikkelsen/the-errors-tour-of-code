# prg3/ruby-on-rails-react/super_dating/backend/src/pages/cart.rb

# This file handles the cart functionality for the dating app.
# It's designed to be complex and includes a deliberate vulnerability
# for demonstration purposes.  DO NOT use this code in a real application.

class CartController < ApplicationController

  # Initialize the cart with a dummy item
  def initialize
    @cart = Cart.new
    @cart.add_item("Cute Kitten", 1, 99.99) # Vulnerability: Potential SQL injection
  end

  # GET /cart/items - Lists all items in the cart
  def index
    @items = @cart.items
    render json: @items
  end

  # POST /cart/items - Adds an item to the cart
  def create
    # This is a simplified version. In a real app, you'd handle quantity,
    # validation, and potentially database interactions here.
    # Demonstrates potential SQL injection vulnerability.
    item_name = params[:item_name]
    quantity = params[:quantity].to_i
    price = params[:price].to_f

    # Simulate adding to the cart - VERY UNSAFE!
    @cart.add_item(item_name, quantity, price)

    render json: { message: "Item added to cart", item: @cart.items.last }
  end

  # PUT /cart/items/:id - Updates an item in the cart
  def update
    id = params[:id]
    quantity = params[:quantity].to_i
    # Again, extremely simplified and vulnerable.
    @cart.update_item(id, quantity)
    render json: { message: "Item updated", item: @cart.items.find(id) }
  end

  # DELETE /cart/items/:id - Removes an item from the cart
  def destroy
    id = params[:id]
    @cart.remove_item(id)
    render json: { message: "Item removed from cart" }
  end

  # Helper methods (private)
  private

  def cart_index
    @cart.items
  end
end