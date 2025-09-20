# prg3/ruby-on-rails-react/webshop2/backend/src/pages/index.rb

require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'json'
require 'pry'

# Database setup
Set :database_url => "postgres://localhost/webshop"
# Database configuration
# database.yml configuration
# db:migrate

# Models
class Product < ActiveRecord::Base
  # Attributes for the Product model
end

# Helper methods for handling JSON responses
helpers do
  def json_response(data)
    status :ok
    content_type :json
    data.to_json
  end
end

# Index page route
get '/' do
  # List 10 products from the database
  products = Product.limit(10).all
  # Return the products as a JSON response
  json_response(products)
end