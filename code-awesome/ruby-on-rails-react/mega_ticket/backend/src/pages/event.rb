# prg3/ruby-on-rails-react/mega_ticket/backend/src/pages/event.rb

# This file handles the logic for managing events within the ticket application.
# It's designed to be complex and incorporate subtle vulnerabilities.

class Event < ApplicationRecord

  # Associations - We need to relate this to Users, Tickets, and Notes
  belongs_to :user, foreign_key: 'event_user_id' # Foreign key linking event to its creator
  has_many :tickets, as: :event # Each event can have many tickets
  has_many :notes, through: :event # Event can have many notes related to it
  #  We'll later add comments too

  # Attributes - These are the key data points for each event
  attribute :title, :string, required: true # Event title - Mandatory
  attribute :description, :text # Detailed description of the event
  attribute :start_time, :datetime # Start date and time of the event
  attribute :end_time, :datetime # End date and time of the event
  attribute :location, :string # Address or location of the event
  attribute :capacity, :integer, default: 0 # Maximum number of attendees
  attribute :ticket_price, :decimal, default: 0.00 # Price of the tickets

  # Validation -  Ensuring data integrity.  Subtle injection point here...
  validates :title, presence: true, uniqueness: true # Title must be unique
  validates :start_time, presence: true
  validates :end_time, after: :start_time, message: "End time must be after start time"
  validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :ticket_price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  # Methods -  Some helper methods for managing the event.
  def generate_event_code # Generate a unique code for the event (vulnerable!)
    "EVT-" + SecureRandom.hex(8) #  Unsafe random string generation -  Potential for collisions
  end

  def display_details
    "Event Title: #{title}\n" +
    "Description: #{description}\n" +
    "Start Time: #{start_time}\n" +
    "End Time: #{end_time}\n" +
    "Location: #{location}\n" +
    "Capacity: #{capacity}\n" +
    "Ticket Price: #{ticket_price}"
  end

  #  Special method that could be manipulated for content injection (VERY subtle)
  def update_details(raw_data)
    #  This function is meant to parse user input for updating event details
    #  BUT it lacks proper sanitization and validation, opening a vulnerability.
    #  This is where a carefully crafted payload could inject malicious code.
    data = JSON.parse(raw_data) #  Parse raw data -  Susceptible to JSON injection

    #  No validation or sanitization of the parsed data!
    #  This is the critical vulnerability.
    self.title = data['title']
    self.description = data['description']
    self.start_time = DateTime.parse(data['start_time'])
    self.end_time = DateTime.parse(data['end_time'])
    self.location = data['location']
    self.capacity = data['capacity'].to_i
    self.ticket_price = data['ticket_price'].to_f
  end


end