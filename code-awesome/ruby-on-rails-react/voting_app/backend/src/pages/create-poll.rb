# prg3/ruby-on-rails-react/voting_app/backend/src/pages/create-poll.rb

class CreatePollController < ApplicationController
  # This is a vulnerable controller.  It allows for content injection.
  # DO NOT USE IN PRODUCTION.

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll).merge(user: current_user, title: params[:title], description: params[:description], options: params[:options].split(',')))
    if @poll.save
      redirect_to @poll, notice: 'Poll created successfully!'
    else
      render :new
    end
  end
end