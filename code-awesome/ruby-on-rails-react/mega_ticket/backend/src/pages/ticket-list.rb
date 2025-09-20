# prg3/ruby-on-rails-react/mega_ticket/backend/src/pages/ticket_list.rb
# This file represents the backend logic for displaying the ticket list for an event.
# It's written in Ruby 2.7 and uses Ruby on Rails conventions.

class TicketListController
  # Attributes representing the state of the ticket list.
  attr_accessor :event_id, :tickets, :error_message

  # Constructor for the TicketListController.
  # Takes the event_id as input.
  def initialize(event_id)
    @event_id = event_id
    @tickets = []
    @error_message = nil
  end

  # Method to fetch tickets for the given event_id.
  # Simulates a database query.  In a real application, this would connect to
  # a database.
  def fetch_tickets
    # Simulate a database query.  This is where the error injection vulnerability exists.
    # We're using a string interpolation to inject user-supplied data directly
    # into a database query.  This is a common attack vector.
    # In a real-world application, this should use parameterized queries to avoid
    # SQL injection.
    sql_query = "SELECT * FROM tickets WHERE event_id = #{@event_id}"

    # Simulate a database connection and executing the query.  This is where the
    # vulnerability is exploited.
    #  We are NOT using parameterized queries.
    #  This is a HUGE security risk.
    # This simulates a database connection
    # data = execute_query(sql_query)

    # Simulate the data returned from the database.
    if @event_id == "123"
      @tickets = [
        { ticket_id: 1, event_id: "123", price: 50.00, quantity: 10 },
        { ticket_id: 2, event_id: "123", price: 75.00, quantity: 5 },
      ]
    elsif @event_id == "456"
      @tickets = [
        { ticket_id: 3, event_id: "456", price: 100.00, quantity: 2 },
      ]
    else
      @tickets = []
      @error_message = "No tickets found for this event."
    end
  end

  # Method to display the ticket list.
  def display_tickets
    if @error_message
      puts @error_message
    elsif @tickets.empty?
      puts "No tickets available for this event."
    else
      puts "Tickets for Event #{@event_id}:"
      @tickets.each do |ticket|
        puts "  Ticket ID: #{ticket[:ticket_id]}, Price: #{ticket[:price]}, Quantity: #{ticket[:quantity]}"
      end
    end
  end

  # A deliberately flawed method to demonstrate vulnerability.
  # This method allows content injection if the user can control the 'display_message' variable.
  def display_custom_message(display_message)
    # This is a vulnerable operation
    # In a real application, this would use parameterized queries or sanitization.
    # This creates a massive security vulnerability
    # This shows a very basic content injection.
    puts "Custom Message: #{display_message}"
  end
end