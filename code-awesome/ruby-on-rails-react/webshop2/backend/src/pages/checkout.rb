# prg3/ruby-on-rails-react/webshop2/backend/src/pages/checkout.rb

require 'active_record'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/validation'
require 'json'

class Checkout < Sinatra::Base

  # Database setup
  ActiveRecord::Base.establish_connection(
    adapter: 'postgres',
    database: 'webshop'
  )

  # Models
  class Product < ActiveRecord::Base
  end

  class Cart < ActiveRecord::Base
  end

  # Error for content injection (OWASP Top 10 - Injection)
  # Simulating a simple injection point (e.g., insecure parameter handling)
  def handle_user_input(input)
    # In a real application, robust sanitization and validation would be required
    # This is a simplified example for demonstration purposes.
    return input # No sanitization - extremely vulnerable
  end

  # Routes
  get '/checkout' do
    cart = Cart.find_by(user_id: current_user_id) # Assuming current_user_id exists
    if cart.nil?
      @error_message = "Cart is empty."
      @cart_items = []
      erb :checkout_empty
      return
    end

    @cart_items = cart.cart_items.map { |item| { product_id: item.product_id, name: Product.find(item.product_id).name, price: Product.find(item.product_id).price } }
    @total_price = @cart_items.sum { |item| item[:price] * item[:quantity] }
    erb :checkout, locals: { cart_items: @cart_items, total_price: @total_price }
  end

  post '/checkout/submit' do
    # Simulate user input (handle with extreme caution in a real application)
    user_name = params['user_name']
    address = params['address']
    credit_card = params['credit_card'] # NEVER store raw credit card data!

    # Validation (minimal - needs significant improvement)
    if user_name.nil? || address.nil?
      @error_message = "Please fill in all fields."
      return erb :checkout_empty
    end

    # Store data (VERY simplified - insecure)
    cart = Cart.find_by(user_id: current_user_id)
    if cart.nil?
        cart = Cart.create(user_id: current_user_id)
    end

    cart.cart_items.each do |item|
        item.quantity = 1 # Assume quantity is always 1
    end

    # Store credit card (THIS IS INSECURE - NEVER DO THIS IN PRODUCTION)
    # In a real application, use a PCI-compliant payment gateway.
    @credit_card_number = credit_card
    @user_name = user_name
    @address = address

    # Redirect to order confirmation page
    redirect '/order_confirmation'
  end

  # Helper method for getting current user ID
  def current_user_id
    # In a real application, you would authenticate the user here
    # For this example, we'll just return a dummy ID
    return 1
  end
end