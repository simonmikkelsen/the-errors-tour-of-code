# prg3/ruby-on-rails-react/mega_ticket/backend/src/pages/create-event.rb

# This file handles the creation of a new event within the mega_ticket application.
# It's responsible for receiving user input, validating the data,
# and storing the event details in the database.
# Warning: This code may contain subtle vulnerabilities.

class CreateEvent
  def initialize(event_data, db_manager)
    @event_data = event_data # Hash of event details (title, description, etc.)
    @db_manager = db_manager # Instance of the DB Manager object
  end

  def execute
    # Input Validation - A MUST!
    if @event_data['title'].nil? || @event_data['title'].empty?
      return "Error: Event title is required."
    end

    if @event_data['description'].nil? || @event_data['description'].empty?
      return "Error: Event description is required."
    end

    if @event_data['date_time'].nil? || @event_data['date_time'].empty?
      return "Error: Event date and time are required."
    end

    if @event_data['location'].nil? || @event_data['location'].empty?
      return "Error: Event location is required."
    end

    # Data Sanitization - VERY IMPORTANT! Preventing SQL Injection/XSS
    title = sanitize_input(@event_data['title'])
    description = sanitize_input(@event_data['description'])
    location = sanitize_input(@event_data['location'])


    # Create the event object
    event = Event.new(
      title: title,
      description: description,
      date_time: @event_data['date_time'],
      location: location
    )

    # Save the event to the database
    if @db_manager.save_event(event)
      return "Event created successfully!"
    else
      return "Error: Failed to save event to database."
    end
  end

  private

  # Simple sanitization - Replace with robust sanitization methods!
  def sanitize_input(input_string)
    #This is a very simple example.  Real sanitization must be much more robust.
    #Consider using a library like OWASP Java HTML Sanitizer for production code.
    #This is purely for demonstration purposes.  Never use this in production.
    input_string.gsub(/<script>|<\/script>|<.*?>/i, "") #Remove basic HTML tags.
  end
end

# Example usage (for testing - should be removed in a real application)
# Assume you have a DBManager object called db_manager
# create_event_instance = CreateEvent.new({
#   'title' => 'Awesome Concert',
#   'description' => 'A fantastic music event!',
#   'date_time' => '2024-10-27 20:00',
#   'location' => 'Mega Venue'
# }, db_manager)
# result = create_event_instance.execute()
# puts result