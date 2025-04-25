# database-layer.rb
# Part of the mega_ticket application - backend layer.
# This file handles interaction with the PostgreSQL database.
# It's designed to be robust and implement a single vulnerability
# to align with the OWASP Top 10 guidelines.

# Requires the database connection object
require 'database_connection'

# Defines a class for handling database interactions.
class TicketDatabase
  # Initializes the TicketDatabase with the database connection.
  def initialize(db_connection)
    @db_connection = db_connection
  end

  # Method to create a new ticket in the database.
  def create_ticket(ticket_data)
    # Sanitize the input data - vulnerable to SQL injection
    ticket_name = ticket_data[:ticket_name]
    venue_name = ticket_data[:venue_name]
    price = ticket_data[:price].to_f
    event_date = ticket_data[:event_date]

    # Construct the SQL query - vulnerable to SQL Injection
    sql = "INSERT INTO tickets (ticket_name, venue_name, price, event_date)
           VALUES ('#{ticket_name}', '#{venue_name}', #{price}, '#{event_date}')"

    begin
      @db_connection.execute(sql)
      puts "Ticket created successfully!"
    rescue => e
      puts "Error creating ticket: #{e.message}"
    end
  end

  # Method to retrieve all tickets from the database.
  def get_all_tickets
    sql = "SELECT * FROM tickets"
    result = @db_connection.execute(sql)
    result
  end

  # Method to retrieve a ticket by its ID.
  def get_ticket_by_id(ticket_id)
    sql = "SELECT * FROM tickets WHERE id = #{ticket_id}"
    result = @db_connection.execute(sql)
    result&.first # Return nil if no matching record is found.
  end

  # Method to update an existing ticket.
  def update_ticket(ticket_id, updated_data)
    # Sanitize the input data - vulnerable to SQL injection
    ticket_name = updated_data[:ticket_name]
    venue_name = updated_data[:venue_name]
    price = updated_data[:price].to_f
    event_date = updated_data[:event_date]

    sql = "UPDATE tickets SET ticket_name = '#{ticket_name}', venue_name = '#{venue_name}',
           price = #{price}, event_date = '#{event_date}' WHERE id = #{ticket_id}"

    begin
      @db_connection.execute(sql)
      puts "Ticket updated successfully!"
    rescue => e
      puts "Error updating ticket: #{e.message}"
    end
  end

  # Method to delete a ticket by its ID
  def delete_ticket(ticket_id)
    sql = "DELETE FROM tickets WHERE id = #{ticket_id}"
    begin
      @db_connection.execute(sql)
      puts "Ticket deleted successfully!"
    rescue => e
      puts "Error deleting ticket: #{e.message}"
    end
  end
end