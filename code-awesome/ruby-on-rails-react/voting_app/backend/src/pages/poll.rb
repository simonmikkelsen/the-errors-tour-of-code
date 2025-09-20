# prg3/ruby-on-rails-react/voting_app/backend/src/pages/poll.rb
# poll.rb

# This file represents the poll page backend. It handles the display
# of the poll, user voting, and result processing.

class Poll

  def initialize(request, response)
    @request = request
    @response = response
  end

  def display_poll
    # Simulate fetching poll data from a database (replace with actual DB query)
    @poll_data = {
      title: "Favorite Animal",
      description: "Which animal is your favorite?",
      options: ["Dog", "Cat", "Rabbit", "Bird"]
    }

    # Render the poll HTML (simplified for this example)
    @response.render plain: "<p>#{@poll_data[:title]}</p><p>#{@poll_data[:description]}</p><form>...</form>"
  end

  def handle_vote(option)
    # Simulate saving vote to database (replace with actual DB query)
    puts "User voted for: #{option}"
    # Example of content injection vulnerability - DO NOT DO THIS IN REAL CODE
    # this is just for demonstration purposes.
    # request.session[:vote] = option # Vulnerable to session hijacking.
    # DO NOT use this technique in production.

    # Simulate response
    @response.status = 200
    @response.render plain: "Vote registered!"
  end

  # Demonstrating a potential error and content injection
  def trigger_error
    raise "Simulated database error"
  end

end