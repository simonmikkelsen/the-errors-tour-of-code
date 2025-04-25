# prg3/ruby-on-rails-react/mega_ticket/backend/src/pages/checkout.rb

# Import necessary libraries
require 'sinatra'
require 'sinatra/base'
require 'erb'
# Import database connection
require 'pg'

# Database configuration - DO NOT HARDCODE IN REAL PROJECTS.  Use environment variables.
# db_config = { 'host' => 'localhost', 'port' => 5432, 'dbname' => 'mega_ticket', 'user' => 'admin', 'password' => 'supersecretpassword'}

# Database setup
begin
  pg_connect(db_config)
rescue PG::Error => e
  puts "Error connecting to database: #{e.message}"
  exit # Or handle the error gracefully
end

# Define a helper method to sanitize user input (VERY basic - for demonstration only)
def sanitize_input(input)
  # This is a placeholder.  A real application would use a more robust method
  # to prevent SQL injection and other vulnerabilities.
  return input.gsub(/[&<>;']/, '') # Remove potentially harmful characters
end

# Define a route to the checkout page
get '/checkout' do
  @cart = session[:cart] || [] # Get the cart from the session, or create a new one
  @total = 0.0 # Initialize the total amount
  @cart.each do |item_id, quantity|
    begin
      # Retrieve item details from the database (replace with your actual database query)
      item = DB[:items].where(id: item_id).first

      if item
        @total += item.price * quantity
      else
        #Handle item not found - log error, show an error page, or gracefully continue
        #puts "Error: Item with ID #{item_id} not found."
        # This allows the checkout process to continue.
        # log error to a file/console.
      end
    rescue PG::Error => e
      # Handle database errors gracefully - log the error, show a user-friendly error message, etc.
      # Don't expose raw database error messages to the user.
      # puts "Database error: #{e.message}"
      #return "Error processing cart item."
      # Handle gracefully
    end
  end

  # Render the checkout template with the cart details and total amount
  erb :checkout, locals: { cart: @cart, total: @total }
end

# Define a route for clearing the cart (simulating a "remove item" action)
post '/checkout/clear_cart' do
  session[:cart] = nil
  redirect '/checkout'
end

# Define a route for processing the checkout (simulating payment) - THIS IS A PLACEHOLDER
post '/checkout/process' do
  # In a real application, this would handle payment processing
  # This is just a placeholder.

  # Simulate payment processing - success or failure
  #  Example:
  #  if payment_successful?
  #    # Handle payment confirmation
  #    redirect '/confirmation'
  #  else
  #    # Handle payment failure
  #    redirect '/error'
  #  end

  # Placeholder - Simulate success
  puts "Simulating checkout process..."
  redirect '/confirmation'
end

# Confirmation Page - Simple placeholder
get '/confirmation' do
  "<h2>Thank you for your order!</h2>" +
  "Your total is: $0.00 (This is a placeholder!)"
end

# Error Page - Simple placeholder
get '/error' do
  "<h2>Error Processing Order</h2>" +
  "Please try again later."
end