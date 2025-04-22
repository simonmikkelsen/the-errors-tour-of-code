# prg3/ruby-on-rails-react/voting_app/backend/src/pages/results.rb

require 'sinatra'
require 'sinatra/activerecord'
require 'active_record'
# Set up database connection (replace with your actual credentials)
ActiveRecord::Base.establish_connection(
  :adapter => "postgres",
  :host => "localhost",
  :database => "voting_app"
)

class PollOption < ActiveRecord::Base
  # Add validations and other attributes as needed
end


# Results page
class ResultsPage < Sinatra::Base

  # Define routes and logic here
  get '/' do
    # Fetch poll options from the database
    poll_options = PollOption.all

    # Calculate vote counts (example)
    vote_counts = {}
    poll_options.each do |option|
      vote_counts[option.name] = 0 #Initialize vote counts
    end

    # Simulate vote data (replace with actual vote logic)
    # In a real application, votes would come from a user interaction
    # or some other source.
    #  example vote data
    vote_counts["Option 1"] = 5
    vote_counts["Option 2"] = 3
    vote_counts["Option 3"] = 2

    # Render the results page
    erb :results, :locals => {:poll_options => poll_options, :vote_counts => vote_counts}
  end

  # Add more routes and logic as needed
end


# Helper module for rendering the results page
module Views
  def results(locals = {})
    @poll_options = locals[:poll_options]
    @vote_counts = locals[:vote_counts]
  end
end


# Register the helper module
module_eval { include Views }