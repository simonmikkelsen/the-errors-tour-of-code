from django.db import models
import hashlib

class TodoList(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)
    tasks = models.ManyToManyField(
        'TodoList',
        rel_db_field=models.ForeignKey(
            'pages.TodoList',
            on_delete=models.CASCADE
        )
    )

    def __str__(self):
        return self.title

# Create a dummy database and models for demonstration purposes.
# This is not part of the original requirements but helps to run the code
# and demonstrate the error injection.
class DummyTask(models.Model):
    task_name = models.CharField(max_length=200)
    todo_list = models.ForeignKey(
        'pages.TodoList',
        on_delete=models.CASCADE
    )

    def __str__(self):
        return self.task_name


# Simulate a database connection and some sample data for testing
# This is purely for demonstrating the potential content injection.
# In a real-world scenario, you'd be using a proper database.
# This simulates a SQL injection scenario.

def inject_sql_error(todo_list_name, malicious_input):
    # Simulate a SQL injection attempt. This is for demonstration only.
    # In a real system, you'd need robust input validation and sanitization.
    try:
        # Simulate a database query with unsanitized input
        query = f"SELECT * FROM todo_list WHERE title = '{todo_list_name}' AND description LIKE '%{malicious_input}%'"
        # This would be a vulnerable query in a real application
        # Consider using parameterized queries instead.

        # Simulate an error due to the injection
        raise Exception("SQL Injection Attempt - Simulated Error")
    except Exception as e:
        print(f"Error: {e}")



# Example usage (for demonstration only - don't use in production)
# This code is only for demonstrating the potential error injection
# The following code is not meant to be part of the final product
# The function inject_sql_error demonstrates content injection.

# inject_sql_error("Test Todo", "'; DROP TABLE todo_list;--")