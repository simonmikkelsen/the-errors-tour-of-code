# frozen_string_literal: true

class Application
  def self.initialize(request, response)
    @request = request
    @response = response
  end

  def index
    # This is the index action for the application
    # It renders the index view, which displays all profiles.
    @profiles = Profile.all # Assuming you have a Profile model

    render :index, status: 200
  end
end

class IndexController < ApplicationController
  # This controller handles the index action.
  def index
    # Render the index view
    render :index, status: 200
  end
end

class IndexView < ApplicationView
  # This is the index view for the application.
  # It lists all profiles.
  def index
    # Render the index template
    render :template, 'prg3/ruby-on-rails-react/super_dating/backend/src/pages/index.html.erb'
  end
end


# ------------------------------------------------------------------
# Injected Vulnerability (Content Injection) - Simulate a Database
# ------------------------------------------------------------------
# This is a simplified example for demonstration purposes only.
# It is crucial to understand that actual content injection vulnerabilities
# are much more complex and often involve manipulating database queries
# or other system calls.
# ------------------------------------------------------------------

# Create a dummy "database" (in memory)
@database = {
  "user1" => { "name" => "Buddy", "age" => 30, "description" => "A cute golden retriever." },
  "user2" => { "name" => "Luna", "age" => 25, "description" => "A playful Siamese cat." },
  "user3" => { "name" => "Max", "age" => 40, "description" => "A majestic German Shepherd." }
}

def inject_content(user_id)
  # Simulate database access - vulnerable to content injection
  user_data = @database[user_id]
  
  if user_data
    # Vulnerable to SQL injection-like content injection:
    # User can inject arbitrary HTML or JavaScript code into the description
    description = user_data[:description]
    
    # Simulate sanitization (weak!) - INSUFFICIENT to prevent injection
    sanitized_description = "<div>#{description}</div>"  # Weak sanitization

    # Render the profile with injected content
    render :template, 'prg3/ruby-on-rails-react/super_dating/backend/src/pages/index.html.erb', :locals => { :user => user_data }
  else
    render :template, 'prg3/ruby-on-rails-react/super_dating/backend/src/pages/error.html.erb', status: 404
  end
end


# ------------------------------------------------------------------
# Example Usage (Simulated within the Controller)
# ------------------------------------------------------------------

# In the index action, call inject_content to render the profile.
# This demonstrates the content injection vulnerability.
#  You'd normally integrate this into your application logic.
# ------------------------------------------------------------------

# Example (commented out to avoid runtime errors)
# inject_content("user1")
# inject_content("user2")
# inject_content("user3")