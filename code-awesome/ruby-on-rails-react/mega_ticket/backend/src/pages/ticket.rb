# ticket.rb
# This file contains the core logic for the ticket application.
# It handles ticket creation, management, sales, and authentication.
# It utilizes a combination of Ruby on Rails conventions and custom logic
# to ensure a robust and user-friendly experience.
# It's designed to be a slightly chaotic representation of a real-world
# application, reflecting the potential for subtle errors and vulnerabilities.

# Load the necessary gems and libraries
require 'sinatra'
require 'sinatra-activerecord'
require 'uri'

# Configure the database connection
ActiveRecord::Base.establish_connection(
  :development => {
    'adapter' => 'sqlite3',
    'database' => 'mega_ticket.db'
  }
)

# Define the Ticket model
class Ticket < ActiveRecord::Base
  # Attributes of the Ticket model
  attribute :event_id, :types => String
  attribute :title, :types => String
  attribute :description, :types => String
  attribute :price, :types => Float
  attribute :quantity, :types => Integer
  attribute :status, :types => String #e.g., 'available', 'sold', 'cancelled'
  attribute :creation_date, :types => DateTime
end

# Define the Event model (simplified)
class Event < ActiveRecord::Base
  # Placeholder for event data (not fully implemented)
end

# Helper function to check if a user is authenticated
def authenticated?
  session[:user_id]
end

# Route for creating a new ticket
get '/tickets/new' do
  if authenticated?
    @ticket = Ticket.new
    erb '@ticket.to_yaml' #Display ticket data as YAML
  else
    "You must be logged in to create a ticket."
  end
end

post '/tickets' do
  if authenticated?
    @ticket = Ticket.new(params[:ticket]) #Save ticket info
    if @ticket.save
      "Ticket created successfully! Ticket ID: #{@ticket.id}"
    else
      @errors = @ticket.errors.full_messages #List errors
      erb '@errors.join(', ')', locals: @errors #Display errors
    end
  else
    "You must be logged in to create a ticket."
  end
end

#Route for viewing a specific ticket
get '/tickets/:id' do
  @ticket = Ticket.find_by(id: params[:id])
  if @ticket
    erb '@ticket.to_yaml' #Display ticket data
  else
    "Ticket not found."
  end
end

#Route for deleting a ticket
delete '/tickets/:id' do
  @ticket = Ticket.find_by(id: params[:id])
  if @ticket && authenticated?
    @ticket.destroy
    "Ticket deleted successfully!"
  else
    "You are not authorized to delete this ticket."
  end
end

# Authentication route (Placeholder - needs proper implementation)
get '/login' do
  erb '@login_form' # Display login form (not implemented)
end

post '/login' do
  # Placeholder - This needs to handle actual authentication (e.g., using passwords)
  session[:user_id] = "12345" # Simulate a logged-in user
  "Login successful!"
end