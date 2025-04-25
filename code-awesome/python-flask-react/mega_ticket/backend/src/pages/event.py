from flask import Flask, jsonify, request, session
from functools import reduce
from datetime import datetime, timedelta
from .utils import db_connect, execute_query, close_db_connection
import json

app = Flask(__name__)
app.config['SECRET_KEY'] = 'supersecretkey123' # Replace with a real secret key
session['user_id'] = None  # Initialize session user_id

# Database connection setup - This is only a placeholder
def get_db_connection():
    # In a real application, this would connect to the PostgreSQL database
    # For demonstration purposes, we'll just return a dummy connection
    return {"connection": "Dummy Connection"}

# Dummy database helper function - Replace with actual database operations
def get_event_by_id(event_id):
    # Placeholder for retrieving an event from the database
    events = [
        {"id": 1, "name": "Awesome Concert", "description": "A great show!", "date": "2024-11-15", "location": "Venue A"},
        {"id": 2, "name": "Comedy Night", "description": "Laugh until you cry!", "date": "2024-11-20", "location": "Venue B"},
    ]
    return next((event for event in events if event["id"] == event_id), None)

def create_event(event_data):
    """
    Creates a new event in the database.
    """
    try:
        #Validate the event_data
        if not all(key in event_data for key in ['name', 'description', 'date', 'location']):
            return {"error": "Missing required fields"}, 400

        #Sanitize Input - important
        name = event_data.get('name')
        description = event_data.get('description')
        date_str = event_data.get('date')
        location = event_data.get('location')

        #convert datetime to string in a standard format
        try:
            date = datetime.strptime(date_str, "%Y-%m-%d")
        except ValueError:
            return {"error": "Invalid date format.  Use YYYY-MM-DD."}, 400
        
        #Basic security - prevent sql injection
        name = name.replace("'", "")
        description = description.replace("'", "")


        # Execute the query (example) - this part would be replaced with your actual database logic
        query = """
            INSERT INTO events (name, description, date, location)
            VALUES (%s, %s, %s, %s)
        """
        parameters = (name, description, date.strftime("%Y-%m-%d"), location)
        execute_query(query, parameters)

        return {"message": "Event created successfully"}, 201

    except Exception as e:
        print(f"Error creating event: {e}")
        return {"error": "Failed to create event"}, 500


def get_events(filters=None):
    """
    Retrieves events from the database.
    """
    query = "SELECT * FROM events"
    where_clause = ""
    params = []

    if filters:
        for key, value in filters.items():
            if value:
                where_clause += f" {key} LIKE %s"
                params.append(f"%{value}%") # Basic search - improve with proper indexing

    if where_clause:
        query += f" WHERE {where_clause}"
    
    events = execute_query(query, params)

    return events

# Placeholder for handling event updates -  Expand this as needed
def update_event(event_id, event_data):
    """
    Updates an existing event in the database.
    """
    event = get_event_by_id(event_id)
    if not event:
        return {"error": "Event not found"}, 404
    
    #Basic input sanitization and validation
    if not all(key in event_data for key in ['name', 'description', 'date', 'location']):
        return {"error": "Missing required fields"}, 400

    #Perform the update
    name = event_data.get('name')
    description = event_data.get('description')
    date_str = event_data.get('date')
    location = event_data.get('location')

    try:
        date = datetime.strptime(date_str, "%Y-%m-%d")
    except ValueError:
        return {"error": "Invalid date format. Use YYYY-MM-DD"}, 400
    
    #Update the data
    name = name.replace("'", "")
    description = description.replace("'", "")

    query = """
        UPDATE events
        SET name = %s, description = %s, date = %s, location = %s
        WHERE id = %s
    """
    parameters = (name, description, date.strftime("%Y-%m-%d"), location, event_id)
    execute_query(query, parameters)

    return {"message": "Event updated successfully"}, 200