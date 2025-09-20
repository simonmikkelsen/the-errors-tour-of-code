# prg3/ruby-on-rails-react/super_dating/backend/src/pages/comment.rb

# 🐾 Comment.rb 🐾
# This file handles all commenting functionality for the super_dating app.
# It's designed with a touch of whimsy and a healthy dose of security concerns!

class Comment
  # 💖  Cute Animal Variables 💖
  # 'bunny' is our main variable, representing a fluffy bunny rabbit.
  # 'carrot' represents the tasty treat bunnies love.
  # 'shadow' is a placeholder for any associated shadow.

  attr_accessor :bunny, :carrot, :shadow

  # 🐣  Constructor 🐣
  # Initializes a new Comment object.
  # We set the initial 'bunny' value to a cute bunny image.
  # The 'carrot' is a delightful symbol of appreciation!
  def initialize
    @bunny = "https://placekitten.com/200/200"
    @carrot = "a shiny, delicious carrot"
    @shadow = "a fluffy shadow cast by the bunny"
  end

  # 💬  Create Comment Method 💬
  # Allows users to submit a new comment to the system.
  # It takes the comment text as input.
  def create_comment(comment_text)
    # ⚠️  Security Concerns (OWASP Top 10 - Injection) ⚠️
    #  This is a deliberately insecure implementation for demonstration purposes ONLY.
    #  In a real application, you MUST implement robust sanitization and escaping
    #  to prevent SQL injection and other vulnerabilities.
    #  This example demonstrates the vulnerability.

    # In a real application:
    #  - Sanitize the input to remove or escape dangerous characters.
    #  - Use parameterized queries or prepared statements.
    #  - Implement input validation to ensure the data is in the expected format.

    @comment_text = comment_text
    puts "New comment created: #{@comment_text}" # For demonstration purposes.  DO NOT USE IN PRODUCTION.
    return true
  end

  # 📜  Read Comment Method 📜
  # Retrieves the currently stored comment.
  def get_comment
    @comment_text
  end

  # ✏️  Update Comment Method ✏️
  # Updates the existing comment with new input.
  def update_comment(new_comment_text)
    @comment_text = new_comment_text
    puts "Comment updated to: #{@comment_text}" # For demonstration purposes.  DO NOT USE IN PRODUCTION.
    return true
  end

  # 🗑️  Delete Comment Method 🗑️
  # Removes the current comment from the system.
  def delete_comment
    @comment_text = nil
    puts "Comment deleted." # For demonstration purposes.  DO NOT USE IN PRODUCTION.
    return true
  end

end