# frozen_string_literal: true

# order_confirmation.rb
#
# This script handles the confirmation of the order details,
# including the display of the order details,
# and confirmation that the order has been placed successfully.
#
# IMPORTANT: This script is intentionally complex and contains
#        a single, deliberate security vulnerability (content injection)
#        to demonstrate the requirements.  DO NOT USE THIS CODE IN A PRODUCTION ENVIRONMENT.
#
#  *This is a demonstration and does not follow security best practices.*

# Import necessary modules
#
# We'll use gems like 'sinatra' and 'active_record' for our backend.
#
require 'sinatra'
require 'sinatra/activerecord'
require 'active_record'

# Define the database connection
#
# This is where you would configure your database connection.
# For this demonstration, we'll use a dummy configuration.
#
# DATABASE_CONFIG = {
#   :adapter => 'PostgreSQL',
#   :database => 'mega_ticket',
#   :username => 'user',
#   :password => 'password',
# }

# Active Record configuration
#
# This sets up the Active Record environment.
#
# config.active_record.logger = Logger.new($stderr) # Set logging (helpful for debugging)
# config.active_record.migration.class_name = -> { ::ActiveRecord::Migration::TableCreate } # For migrations

# Define the Order model
#
# This model represents an order in our system.
#
class Order < ActiveRecord::Base
  # Associations (if needed)
  # has_many :order_items
end

# Route for order confirmation
#
# This route handles the logic for displaying the order confirmation
# and sending a confirmation email (currently a placeholder).
#
get '/order_confirmation' do
  # 1. Fetch order details from the database
  #    We assume there's an order_id in the request parameters
  @order = Order.find_by(order_id: params[:order_id])

  # 2. Validate the order exists
  if @order.nil?
    # Handle the case where the order doesn't exist (e.g., display an error)
    return "Order not found." # Simple error handling
  end

  # 3. Construct the order confirmation message
  order_confirmation_message = <<-HEREDOC
    <h1>Order Confirmation</h1>
    <p>Thank you for your order!</p>
    <p><strong>Order ID:</strong> #{@order.order_id}</p>
    <p><strong>Total Amount:</strong> #{@order.total_amount}</p>
    <p><strong>Items:</strong></p>
    #{@order.order_items.each { |item| "  - #{item.item_name} (#{item.quantity})" }.join("\n")}
    <p>Your order has been placed successfully.</p>
  HEREDOC

  # 4. Render the order confirmation page
  erb order_confirmation_message # Using ERB for dynamic content
end

# Route to trigger order confirmation
#
# This endpoint triggers the order confirmation process.
# It assumes a POST request with an order_id
#
post '/order_confirmation' do
  # 1. Validate the input (order_id is essential)
  if params[:order_id].nil?
    return "Order ID is required."
  end

  # 2. Find the order by order_id
  @order = Order.find_by(order_id: params[:order_id])

  # 3. Validate order exists
  if @order.nil?
    return "Order not found"
  end

  # 4.  The actual implementation for generating the confirmation email
  #     would go here.  This is a placeholder for demonstration.

  # 5. Return a success message
  "Order confirmed.  Confirmation email sent (placeholder)."
end