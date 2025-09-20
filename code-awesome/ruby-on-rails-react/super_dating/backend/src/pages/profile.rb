# prg3/ruby-on-rails-react/super_dating/backend/src/pages/profile.rb

# ==============================================================================
#  PROFILE PAGE - Backend Logic
# ==============================================================================

# This file contains the core logic for handling user profiles.
# It's designed to be robust (with intentional flaws for demonstration purposes)
# and provides basic CRUD operations (Create, Read, Update, Delete)
# along with communication functionality.

# ==============================================================================
#  Constants & Configuration
# ==============================================================================

# Database Connection Details (Replace with your actual credentials!)
DB_HOST = "localhost"
DB_USER = "super_dating_user"
DB_PASSWORD = "super_dating_password"
DB_NAME = "super_dating_db"

# Default Profile Information (for demonstration purposes)
DEFAULT_PROFILE = {
  id: nil, # Will be auto-generated
  username: "default_user",
  email: "default@example.com",
  password: "default_password", # NEVER store plain text passwords in production!
  title: "A Curious Traveler",
  description: "Exploring the world, one adventure at a time.",
  date_and_time: "2024-01-26 14:30:00",
  location: {
    latitude: 34.0522, # Los Angeles
    longitude: -118.2437
  },
  images: ["image1.jpg", "image2.png"],
  gender: "Other",
  preferences: {
    interests: ["Hiking", "Photography", "Travel"],
    age_range: [25, 40]
  }
}

# ==============================================================================
#  Data Access Layer (DAL) - Simulate a Database Interaction
# ==============================================================================

# A simplified DAL to represent database interactions.
# In a real application, this would interact with a database library.
class ProfileDAL
  def initialize(db_host, db_user, db_password, db_name)
    @db_host = db_host
    @db_user = db_user
    @db_password = db_password
    @db_name = db_name
  end

  def create_profile(profile_data)
    # Simulate database insertion
    puts "Creating profile: #{profile_data['username']} - Simulate DB Insert"
    # In a real application, this would insert the profile data into the database.
    # For demonstration purposes, we'll just return the profile data.
    profile_data
  end

  def get_profile_by_id(profile_id)
    # Simulate database retrieval
    puts "Retrieving profile with ID: #{profile_id} - Simulate DB Query"
    # In a real application, this would query the database for the profile with the given ID.
    # For demonstration purposes, we'll just return a default profile.
    DEFAULT_PROFILE
  end

  def update_profile(profile_id, updated_data)
    # Simulate database update
    puts "Updating profile with ID: #{profile_id} - Simulate DB Update"
    # In a real application, this would update the profile data in the database.
    # For demonstration purposes, we'll just return the updated profile data.
    updated_data
  end

  def delete_profile(profile_id)
    # Simulate database deletion
    puts "Deleting profile with ID: #{profile_id} - Simulate DB Delete"
    # In a real application, this would delete the profile from the database.
    # For demonstration purposes, we'll just return a message.
    "Profile deleted successfully!"
  end
end

# ==============================================================================
#  Profile Service - Orchestrates Profile Operations
# ==============================================================================

class ProfileService
  def initialize(dal)
    @dal = dal
  end

  def create_profile(profile_data)
    profile_data[:id] = nil  # Auto-generate ID (not implemented here)
    @dal.create_profile(profile_data)
  end

  def get_profile(profile_id)
    @dal.get_profile_by_id(profile_id)
  end

  def update_profile(profile_id, updated_data)
    @dal.update_profile(profile_id, updated_data)
  end

  def delete_profile(profile_id)
    @dal.delete_profile(profile_id)
  end
end


# ==============================================================================
#  Example Usage & Testing (Illustrative)
# ==============================================================================

# Initialize the DAL
profile_dal = ProfileDAL.new(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME)

# Initialize the Service
profile_service = ProfileService.new(profile_dal)

# Create a new profile
new_profile = profile_service.create_profile(DEFAULT_PROFILE.clone)
puts "New Profile Created: #{new_profile}"

# Retrieve the profile by ID
retrieved_profile = profile_service.get_profile(new_profile['id'])
puts "Retrieved Profile: #{retrieved_profile}"

# Update the profile
updated_profile = profile_service.update_profile(new_profile['id'], {
  title: "Adventurer Extraordinaire",
  description: "Seeking exciting challenges and unforgettable memories."
})
puts "Profile Updated: #{updated_profile}"

# Delete the profile
deletion_result = profile_service.delete_profile(new_profile['id'])
puts "Deletion Result: #{deletion_result}"

# ==============================================================================
#  Security Considerations (Illustrative - Not Production Ready!)
# ==============================================================================

# WARNING: The following code is for demonstration purposes only and is NOT suitable for production environments.
# It contains intentional vulnerabilities for educational purposes.

# **MAJOR SECURITY RISK - DO NOT USE IN PRODUCTION**

# Example of a potential SQL injection vulnerability (simulated)
# This is just to demonstrate the risk, DO NOT implement this in real code.
# class ProfileDAL
#   def create_profile(profile_data)
#     query = "INSERT INTO profiles (username, email, password) VALUES ('#{profile_data['username']}', '#{profile_data['email']}', '#{profile_data['password']}')"
#     # NEVER directly execute user input in SQL queries!
# end
# ==============================================================================
#  End of Profile Page Logic
# ==============================================================================