# frozen_string_literal: true

class CreateTodoListController < ApplicationController
  skip_before_action :verify_authenticity_token # Disable CSRF protection for demonstration purposes.  DO NOT DO THIS IN PRODUCTION.
  # TODO: Implement robust CSRF protection in a real-world scenario.

  def create
    # Sanitize input to prevent SQL injection (basic example - improve this)
    title = params[:title].strip
    description = params[:description].strip

    # Basic validation (improve this)
    if title.empty? || description.empty?
      render json: { error: "Title and description are required." }, status: :bad_request
      return
    end

    # Database interaction (simulated for demonstration)
    # In a real application, you'd use an ORM like ActiveRecord
    # Example:
    # todo = Todo.new(title: title, description: description)
    # todo.save

    # Simulate database error (demonstrating OWASP top 10 - injection)
    raise "SQL Injection Attempt!" if params[:attack] == "true" # Simulate an attack

    # Successful creation simulation
    render json: { message: "Todo list created successfully!", title: title, description: description }, status: :created
  end
end