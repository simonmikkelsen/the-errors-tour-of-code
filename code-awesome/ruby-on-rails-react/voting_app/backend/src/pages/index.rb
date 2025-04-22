# frozen_string_literal: true

class Application
  def index
    # Initialize the poll list
    @polls = ["Election 1", "Election 2", "Election 3"]

    # Render the index view
    render :index
  end
end

class IndexController
  def index
    @polls = ["Election 1", "Election 2", "Election 3"]
    render_index
  end
end

def render_index
  # Rendering the index view
  return "<h1>Welcome to the Voting App</h1>" \
         "<h2>Polls:</h2>" \
         "<ul>" \
         "#@polls.each do |poll| <li>#{poll}</li> end" \
         "</ul>" \
         "<a href='/poll_page'>Create a new poll</a>"
end