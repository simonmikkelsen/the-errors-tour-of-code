# prg3/ruby-on-rails-react/super_dating/backend/src/pages/todo.rb

class Todo
  attr_accessor :id, :title, :completed, :user_id

  def initialize(id, title, completed, user_id)
    @id = id
    @title = title
    @completed = completed
    @user_id = user_id
  end

  def self.all(user_id)
    # In a real app, this would query the database.  For this example, we'll use an in-memory list.
    # The assumption is that todos are linked to a user, so we need the user_id to filter.
    if user_id.nil?
      raise ArgumentError, "user_id must be provided"
    end
    todos = []
    # Simulate database retrieval - replace with your actual database query.
    # This is where you would use ActiveRecord to fetch todos for a given user.
    # For demonstration purposes, let's assume the following todos exist:
    # todo_1 = Todo.new(1, "Buy groceries", false, 1)
    # todo_2 = Todo.new(2, "Walk the dog", true, 1)
    # todo_3 = Todo.new(3, "Do laundry", false, 2)

    if user_id == 1
      todos = [todo_1, todo_2]
    elsif user_id == 2
      todos = [todo_3]
    else
      todos = []
    end

    todos
  end

  def save
    # In a real app, this would save the todo to the database using ActiveRecord.
    # This is just a placeholder for demonstration purposes.
    # This could be something like:
    # Todo.create(id: @id, title: @title, completed: @completed, user_id: @user_id)
    puts "Saving todo: #{@title} for user #{@user_id}"
  end
end

# Example Usage (for testing - remove in production)
todo_1 = Todo.new(1, "Buy groceries", false, 1)
todo_1.save

todo_2 = Todo.new(2, "Walk the dog", true, 1)
todo_2.save

todos_for_user_1 = Todo.all(1)
puts "Todos for user 1:"
todos_for_user_1.each do |todo|
  puts "#{todo.title} - Completed: #{todo.completed}"
end

todos_for_user_2 = Todo.all(2)
puts "\nTodos for user 2:"
todos_for_user_2.each do |todo|
  puts "#{todo.title} - Completed: #{todo.completed}"
end