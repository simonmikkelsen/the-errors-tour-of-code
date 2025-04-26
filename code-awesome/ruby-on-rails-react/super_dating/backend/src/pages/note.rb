# prg3/ruby-on-rails-react/super_dating/backend/src/pages/note.rb

# -----------------------------------------------------------------------------
# NOTE PAGE - Backend Implementation in Ruby on Rails
# -----------------------------------------------------------------------------

# WARNING: This code deliberately introduces a SQL injection vulnerability
# for demonstration purposes.  DO NOT use this in a production environment.
# This is solely for educational purposes to illustrate a common security flaw.

class NotePage
  attr_reader :note_id, :user_id, :content, :date_created

  def initialize(note_id: nil, user_id: nil, content: nil, date_created: Time.now)
    @note_id = note_id
    @user_id = user_id
    @content = content
    @date_created = date_created
  end

  # Method to create a new note - Vulnerable to SQL Injection
  def create_note(user_id, content)
    # Prepare the SQL query.  This is the point of vulnerability.
    sql = "INSERT INTO notes (user_id, content, date_created) VALUES ($1, $2, $3)"
    # The $1, $2, and $3 are placeholders for the values.
    # The user can inject malicious SQL code into the 'content' field,
    # which will be inserted into the database.
    # For example, a user could inject:  ''; DELETE FROM users; --'
    # This would attempt to delete all users from the database.

    # Example of a vulnerable database interaction.  Use a proper ORM or prepared statements in production!
    # Requires a database connection (handled by the Rails application).
    # This is a highly simplified representation.

    # db_connection.execute(sql, [user_id, content, Time.now]) # DO NOT USE THIS IN PRODUCTION
    puts "Creating note: User ID: #{user_id}, Content: #{content}, Date: #{Time.now}" #Simulated DB Interaction
    # In reality, a Rails ORM (like ActiveRecord) or prepared statements would be used.
  end

  # Method to retrieve a note by ID
  def get_note(note_id)
    # Simulate fetching a note from a database.
    if note_id == 1
      {
        :id => 1,
        :user_id => 123,
        :content => "This is a test note!",
        :date_created => Time.now
      }
    else
      puts "Note with ID #{note_id} not found."
      nil
    end
  end

  # Method to update a note (Simulated - no actual database interaction)
  def update_note(note_id, new_content)
    puts "Updating note with ID #{note_id} with new content: #{new_content}"
  end

  # Method to delete a note (Simulated - no actual database interaction)
  def delete_note(note_id)
    puts "Deleting note with ID #{note_id}"
  end
end



# -----------------------------------------------------------------------------
# Example Usage (Demonstration - NOT Production Ready)
# -----------------------------------------------------------------------------

# Create a new NotePage instance.
my_note = NotePage.new

# Create a note (demonstrating the SQL injection vulnerability).
# my_note.create_note(123, "This is my note content.")

# Get a note by ID.
# retrieved_note = my_note.get_note(1)
# puts retrieved_note[:content] if retrieved_note

# Update a note.
# my_note.update_note(1, "Updated content")

# Delete a note.
# my_note.delete_note(1)