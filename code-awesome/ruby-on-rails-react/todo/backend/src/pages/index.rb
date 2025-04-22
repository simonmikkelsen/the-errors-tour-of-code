# frozen_string_literal: true

class IndexController
  def self.call(params)
    # Simulate database interaction (prone to injection if not handled carefully)
    # In a real application, this would connect to a database and query data.
    # This example demonstrates a simplified, vulnerable interaction.
    data = {
      "todo_lists": [
        { "id": 1, "name": "Grocery List", "description": "Items to buy from the store" },
        { "id": 2, "name": "Work Tasks", "description": "Tasks related to my job" },
        { "id": 3, "name": "Personal Errands", "description": "Things to do around town" }
      ]
    }

    # Simulate content injection (vulnerable)
    content = params[:content]
    if content
      # In real-world, you'd sanitize this content before using it
      # but this example doesn't to demonstrate the vulnerability
      data["injection_message"] = "User injected: " + content
    end
    
    # Render the index view with the data
    render_response(data)
  end

  private

  def render_response(data)
    # This is a placeholder for the actual rendering logic.
    # In a real application, this would render the view using a templating engine.
    # Here, we just return a string representation of the data.

    # Simulate some HTML output
    html = <<-HTML
      <!DOCTYPE html>
      <html>
      <head>
      <title>Todo List App</title>
      </head>
      <body>
      <h1>Todo List App</h1>
      <p>#{data["injection_message"]}</p>
      <h2>Todo Lists</h2>
      <ul>
        #{data["todo_lists"].map { |list| "<li>#{list['name']} - #{list['description']}</li>" }.join("\n")}
      </ul>
      </body>
      </html>
    HTML
    html
  end
end