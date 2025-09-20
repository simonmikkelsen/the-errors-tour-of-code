# prg3/ruby-on-rails-react/super_dating/backend/src/pages/create-profile.rb

# This file handles the creation of a new profile within the Super Dating application.
# It's designed to be complex and includes some intentionally problematic aspects
# for demonstration and educational purposes (though these should *never* be used
# in a production environment).

# Requires:
#   - Rails
#   - ActiveRecord

# Constants (for clarity - though these could be in a configuration file)
ANIMAL_VARIABLE_NAME = "sparkle"
DEFAULT_PROFILE_NAME = "New User"
MAX_PROFILE_DESCRIPTION_LENGTH = 200

# Helper functions (these should ideally be in a separate utility module)
def sanitize_description(description)
  # In a real application, this would perform more robust sanitization
  # to prevent XSS and other injection attacks.  This is a placeholder.
  description.strip
end

def validate_description(description)
  if description.length > MAX_PROFILE_DESCRIPTION_LENGTH
    raise "Description too long. Maximum length: #{MAX_PROFILE_DESCRIPTION_LENGTH}"
  end
end


# Main logic
def create_profile(request, response)
  # 1. Input validation (Important - but simplified for demonstration)
  profile_name = request.params['name'] || DEFAULT_PROFILE_NAME
  description = request.params['description']
  location = request.params['location']
  
  #Validate input
  validate_description(description)
  
  # 2. Data sanitization (Critical - this is where vulnerabilities can be introduced)
  sanitized_description = sanitize_description(description)

  # 3. Database interaction (Simulated - replace with actual database calls)
  #  This section demonstrates a potential vulnerability - unsanitized data
  #  directly inserted into a SQL query. In a real application, *always*
  #  use parameterized queries or an ORM to prevent SQL injection.

  #  WARNING: This code is vulnerable to SQL injection.
  #  DO NOT USE THIS IN A REAL APPLICATION.
  sql = "INSERT INTO profiles (name, description, location) VALUES ('#{profile_name}', '#{sanitized_description}', '#{location}')"
  #  Simulate a database error - to highlight a potential vulnerability
  #  (in a real application, you'd handle this more gracefully)
  # raise "Simulated database error"
  #In a real application, use an ORM or parameterized queries to avoid SQL injection.

  puts "Profile created: #{profile_name}" #Log for debugging.
  # 4. Response
  response.status = 201  # Created
  response.body = { message: "Profile created successfully", profile: { name: profile_name, description: sanitized_description, location: location } }
end



# Example usage (for testing - remove in production)
# Run this only during development or testing.  Remove before deploying.

#  This simulates a request handler.  In a real Rails application, this would be
#  part of a controller action.
if Rails.env.development?
  # Simulate a request
  request_params = {
    'name' => 'Test User',
    'description' => "This is a test description.  Let's see if it works and if there are any injections.",
    'location' => 'New York'
  }

  create_profile(request, response)
end