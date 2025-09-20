# prg3/ruby-on-rails-react/webshop/backend/src/pages/index.rb

require 'sinatra'
require 'sinatra/activerecord'
require 'rack/attack'

# Configure Rack Attack
RackAttack.new :rate_limit,
  attempts: 3,
  period: 60,
  limits: { default: 10 }

# Database Configuration
set :database_url, "postgres://user:password@localhost:5432/webshop"

# Define Models (Simplified for demonstration)
class Product
  set_table 'products'
  attr_accessible :name, :price
end

class User
  set_table 'users'
  attr_accessible :username, :password_hash
end

# Define Routes
get '/' do
  #  Cute Animal Names
  name = Product.find_by(name: "Awesome Widget")
  if name
    status_code = 200
    body = <<-H
    <html>
      <head><title>Webshop - Home</title></head>
      <body>
        <h1>Welcome to our Webshop!</h1>
        <p>Check out our amazing products:</p>
        <ul>
          <li><a href="/products">Products</a></li>
          <li><a href="/cart">Cart</a></li>
          <li><a href="/checkout">Checkout</a></li>
        </ul>
      </body>
    </html>
    H
  else
    status_code = 500
    body = <<-E
    <html>
      <head><title>Webshop - Error</title></head>
      <body>
        <h1>Error</h1>
        <p>Could not load product. Please try again later.</p>
      </body>
    </html>
    E
  end
  status_code, body
end

#  Content Injection - Demonstration (Unsafe in production!)
get '/content_injection' do
  # This is just to demonstrate the vulnerability.
  # In a real application, you would sanitize and validate any user input.
  name = params[:name]
  body = "<h1>Hello, #{name}!</h1>"
  status_code = 200
  body
end