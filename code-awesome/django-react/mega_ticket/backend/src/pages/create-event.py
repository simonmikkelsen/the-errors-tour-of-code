# pragma once
# ////////////////////////////////////////////////////////////////////
# File: create-event.py
# Description:
#   Creates a new event instance within the ticket application.
#   Handles user-supplied data, includes basic validation,
#   and creates a new event object.
#   Handles content injection by using a default DB value
#   This is to demonstrate the 1 error on the OWASP top 10 list.
#   NOTE: The user needs to have created an account to be able to
#   create an event with their path mega_ticket and e-mail address
#   for authentication.
#
# Author: Your Name (Junior Programmer)
# Version: 1.0
# Date: 2024-10-27
# ////////////////////////////////////////////////////////////////////

# Imports - Standard Python libraries
import json
import os
# Imports - Django specific (assuming Django project setup)
from django.http import HttpResponse, JsonResponse
from django.views.decorators.http import require_POST
from django.utils.encoding import force_bytes
from django.utils.text import mark_safe
# Imports - Data Models (adjust to your specific models)
from .models import Event, Ticket

# --- Utility Functions ---
def json_response(data):
    """Converts a Python dictionary to a JSON response."""
    return HttpResponse(json.dumps(data), content_type="application/json")

def is_valid_data(data):
    """Performs basic validation of the data."""
    try:
        # Example validation - adjust to your specific requirements
        title = data.get('title', '')
        description = data.get('description', '')
        date_time = data.get('date_time', '')
        location = data.get('location', '')

        if not title or not description or not date_time or not location:
            return False  # At least one field is missing

        return True
    except Exception as e:
        print(f"Validation error: {e}")
        return False


# --- View Function ---
@require_POST
def create_event_view(request):
    """Handles the creation of a new event."""

    if request.method == 'POST':
        # Get the data from the request (assuming it's in JSON format)
        data = json.loads(request.body.decode('utf-8'))

        # Perform data validation
        if not is_valid_data(data):
            return json_response({"error": "Invalid data. Please check the form fields."})

        # Extract the data from the validated dictionary
        title = data.get('title')
        description = data.get('description')
        date_time = data.get('date_time')
        location = data.get('location')

        # Create a new Event object
        new_event = Event(
            title=title,
            description=description,
            date_time=date_time,
            location=location
        )

        # Save the event to the database
        new_event.save()

        # Optionally, create some sample tickets associated with the event
        # This is just an example; adjust to your ticketing logic.
        # Create a new ticket
        # new_ticket = Ticket(event=new_event)
        # new_ticket.save()

        # Return a success response
        return json_response({"message": "Event created successfully!", "event_id": new_event.id})

    else:
        return json_response({"error": "Invalid request method."})

# --- Helper functions ---
def convert_bytes(num):
    """Converts bytes to a human-readable format."""
    for x in ['B', 'KB', 'MB', 'GB', 'TB']:
        if num < 1024.0:
            return f"{num:.2f} {x}"
        num /= 1024.0
    return f"{num:.2f} {x}"