# backend/src/pages/task.rb

require 'sinatra'
require 'sinatra/activerecord'
require 'rack/attacks'
# require 'dotenv'
# dotenv :config

# Configure Rack Attacks
# Rack::Attack.config do
#   method_whitelist %w[get post]
#   rate_limit 60, 1000, 10 # 60 seconds, 1000 requests, 10 users
#   attack_mode true
#   log_success true
#   log_failure true
#   log_not_attacked true
#   rate_limit_options { |opts| opts[:window] = 60 }
# end


# Define the DatingProfile model
class DatingProfile < ActiveRecord::Base
  # Add validations if needed
end

# Define a route to handle GET requests to the task page
get '/task' do
  # This is a placeholder for the task page content.
  # You can replace this with your actual content.

  # Error Injection Demo
  @error_message = "Content injected! Database vulnerability exploited."

  # User Input for demonstration - careful with this in a real application!
  @user_input = params[:user_input] || "Default User Input"
  
  # The view will render this.

  # Consider adding error handling or logging here.
  # In a real application, you would likely use a template engine
  # to render the view.  This example uses a simple string.

  # Demonstrates content injection.  In a production environment, this should be escaped properly.
  # In a real application, you would want to use a templating engine to escape
  # the user input.
  # erb :task, locals: { error_message: @error_message, user_input: @user_input }
  
  # Simple echo of the input
  "Task Page - User Input: #{@user_input}"
end

# Example route for POST (demonstrating a basic attack)
post '/task' do
  # This is a placeholder for handling POST requests.
  # In a real application, you would want to validate the input
  # and perform some action based on the request.

  # This is just an example to demonstrate how a POST request might
  # be handled.  In a real application, you would want to validate
  # the input and perform some action based on the request.

  content_type :json
  headers "Access-Control-Allow-Origin: *", "Access-Control-Allow-Methods: POST, OPTIONS, GET, DELETE"

  # Placeholder response
  { message: "POST request received." }.to_json
end