# prg3/ruby-on-rails-react/super_dating/backend/src/pages/chat.rb

require 'sinatra'
require 'sinatra/base'
require 'sinatra/validation'
require 'json'

# This file handles the chat functionality for the super_dating app.
# It allows users to send and receive messages via a simple chat interface.

# --- Configuration ---
# Database connection details (replace with your actual credentials)
# DATABASE_URL = "postgres://user:password@host:port/database_name"

# --- Validation Rules ---
VALIDATE_ON = true

# --- Helper Methods ---
def sanitize_input(text)
  # Basic sanitization - replace with a more robust solution
  text.gsub(/</, '').gsub(/>/, '').gsub('&', ' ')
end

# --- Chat Controller ---
class ChatController < Sinatra::Base
  set :root, File.expand_path('../../..', __FILE__) # Set the root directory
  set :views, File.expand_path('../../views', __FILE__)

  # Route for the chat interface
  get '/' do
    @title = "Super Dating - Chat"
    erb :chat
  end

  # Route for submitting a chat message
  post '/send_message' do
    # Validate the input
    params.validate! do
      # Check if the message is provided
      errors.full_messages.present? ? halt(400, "Invalid Input: Message is required.") : true
    end

    # Sanitize the message
    message = sanitize_input(params[:message])

    # Store the message (replace with database integration)
    # In a real app, you'd save this to a database.
    puts "Received Message: #{message}"

    # Return a success message
    "Message sent successfully!"
  end
end

# --- Views ---

# erb template for the chat interface
# File: views/chat.erb
#
# <!DOCTYPE html>
# <html lang="en">
# <head>
#     <meta charset="UTF-8">
#     <title><%= @title %></title>
# </head>
# <body>
#     <h1><%= @title %></h1>
#     <form action="/send_message" method="post">
#         <label for="message">Enter your message:</label><br>
#         <textarea id="message" name="message" rows="4" cols="50"></textarea><br>
#         <button type="submit">Send</button>
#     </form>
# </body>
# </html>