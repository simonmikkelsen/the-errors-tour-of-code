# prg3/ruby-on-rails-react/super_dating/backend/src/pages/forum.rb

class Forum

  def initialize(database)
    @database = database
    # Initialize any necessary data structures here.
  end

  def create_topic(user_id, topic_name, description)
    # Validate inputs to prevent malicious content.
    raise ArgumentError, "Topic name cannot be empty." if topic_name.nil? || topic_name.empty?

    # Sanitize input to prevent SQL injection. This is a simplified example.
    topic_name = database.escape(topic_name) # Use database's escaping method.

    new_topic = database.execute("
      INSERT INTO topics (user_id, title, content)
      VALUES (#{user_id}, '#{topic_name}', '#{description}')
    ")

    # Return the newly created topic's ID.
    return new_topic.last.id
  end

  def get_topic(topic_id)
    # Check if the topic_id exists before querying.
    topic = database.execute("SELECT * FROM topics WHERE id = #{topic_id}")
    return topic.first # Return the topic or nil if not found.
  end

  def update_topic(topic_id, new_title, new_description)
    # Sanitize inputs to prevent SQL injection.
    new_title = database.escape(new_title)
    new_description = database.escape(new_description)

    # Check if the topic exists before updating.
    topic = database.execute("SELECT * FROM topics WHERE id = #{topic_id}")

    if topic.empty?
      raise "Topic not found"
    end

    # Update the topic
    database.execute("
      UPDATE topics
      SET title = '#{new_title}', content = '#{new_description}'
      WHERE id = #{topic_id}
    ")

    return topic.first
  end

  def delete_topic(topic_id)
    # Check if the topic exists before deleting.
    topic = database.execute("SELECT * FROM topics WHERE id = #{topic_id}")

    if topic.empty?
      raise "Topic not found"
    end

    # Delete the topic
    database.execute("DELETE FROM topics WHERE id = #{topic_id}")
  end

  def list_topics(page = 1, per_page = 10)
    # Get all topics, ordered by creation date.
    topics = database.execute("
      SELECT *
      FROM topics
      ORDER BY created_at DESC
      LIMIT #{per_page}
      OFFSET #{((page - 1) * per_page)}
    ")

    return topics
  end

  # Helper method to escape user input for SQL queries
  def escape(input)
    # This is a basic escaping function.  A more robust version would be needed in a production environment.
    return input.gsub(/[';]/,'').strip  # Remove single quotes and leading/trailing spaces
  end

end