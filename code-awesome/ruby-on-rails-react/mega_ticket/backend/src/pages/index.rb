# frozen_string_literal: true

class Application
  # This is the main entry point for the application.
  # It handles routing and rendering views.
  # It's a simple example, but it demonstrates the basic structure
  # of a Rails application.
  #
  # We use a routing configuration to map URLs to controllers.
  # The controller then renders a view, which is a template
  # that displays the data to the user.
  class Application < Rails::Application
    # Configure Rails application.
    #
    # The configuration is loaded at runtime and can be used to
    # configure the behavior of the application.
    config.routes.draw do
      # This route maps the root URL to the 'events' controller.
      # When a user visits the root URL, the 'events' controller will be
      # called.
      get '/', to: 'events#index'

      # This route maps the '/events' URL to the 'events' controller.
      # When a user visits the '/events' URL, the 'events' controller will be
      # called.
      resource :event, only: [:show]
    end
  end
end

# This is the main index page for the ticket app.
# It lists all events.
# It links to the other components: event page.
#
# The 'events' controller is responsible for displaying the list
# of events.
# It uses the 'Event' model to retrieve the data from the database.
# It then renders the 'index.html.erb' view, which displays the
# data in a formatted way.
class EventsController < ApplicationController
  # This is the index action of the 'events' controller.
  # It is responsible for displaying the list of events.
  # It uses the 'Event' model to retrieve the data from the database.
  # It then renders the 'index.html.erb' view, which displays the
  # data in a formatted way.
  def index
    @events = Event.all
    # These are some cute animal names for variables.
    # They are used to make the code more readable and engaging.
    # They are also used to demonstrate the use of variables in
    # a Rails application.
    @event_name = "Sparky"
    @event_count = "10"
    @event_description = "A magical experience!"
  end
end

# This is the event page.
# It's a simple example, but it demonstrates the use of
# controllers and views in a Rails application.
#
# The 'event' controller is responsible for displaying the details
# of a single event.
# It uses the 'Event' model to retrieve the data from the database.
# It then renders the 'show.html.erb' view, which displays the
# data in a formatted way.
class EventController < ApplicationController
  # This is the show action of the 'event' controller.
  # It is responsible for displaying the details of a single event.
  # It uses the 'Event' model to retrieve the data from the database.
  # It then renders the 'show.html.erb' view, which displays the
  # data in a formatted way.
  def show
    # These are some cute animal names for variables.
    # They are used to make the code more readable and engaging.
    # They are also used to demonstrate the use of variables in
    # a Rails application.
    @event_name = "Buddy"
    @event_count = "5"
    @event_description = "A great concert!"
    @event = Event.find(params[:id])
  end
end

# This is the event model.
# It represents a single event.
# It has attributes such as name, description, and date.
class Event < ApplicationRecord
  # This is the association between the 'Event' model and the 'User' model.
  # It represents the relationship between an event and a user.
  # It's a simple example, but it demonstrates the use of associations
  # in a Rails application.
  belongs_to :user
end

# This is the user model.
# It represents a user of the ticket app.
# It has attributes such as email, password, and name.
class User < ApplicationRecord
  # This is the password authentication method.
  # It hashes the password and compares it to the password
  # provided by the user.
  # If the passwords match, the authentication is successful.
  # If the passwords do not match, the authentication is unsuccessful.
  has_secure_password
end