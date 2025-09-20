from django.shortcuts import render, HttpResponse
from django.template import Template, Context
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
import os
import secrets

def ticket_list(request):
    """
    Displays a list of tickets for a given event. 
    This function simulates retrieving tickets and displaying them.
    It includes a deliberately complex structure to mimic a real-world
    backend scenario, incorporating potential vulnerabilities for demonstration.
    """

    # Simulate retrieving event details (replace with actual database query)
    event_name = "Awesome Concert"
    event_description = "A night of incredible music!"
    ticket_price = 50.00

    # Simulate a list of tickets (replace with database retrieval)
    tickets = [
        {"ticket_id": 1, "event": event_name, "price": ticket_price},
        {"ticket_id": 2, "event": event_name, "price": ticket_price},
        {"ticket_id": 3, "event": event_name, "price": ticket_price},
    ]

    # Simulate a content injection vulnerability - DANGEROUS!
    # This is for demonstration purposes ONLY.  NEVER do this in a real application.
    # User-supplied data is directly injected into a template.
    user_input = request.GET.get('user_input', '') # Getting user input.
    template_string = f"""
    <h1>Tickets for {event_name}</h1>
    <p>{event_description}</p>
    <h2>Available Tickets:</h2>
    <ul>
        {% for ticket in tickets %}
            <li>Ticket ID: {{ ticket.ticket_id }}, Price: ${{ ticket.price }}</li>
        {% endfor %}
    </ul>
    <p><strong>WARNING:</strong> User input is not sanitized.  Do NOT allow user input on a production system.</p>
    <p>User Input: {{ user_input }}</p>
    """
    
    # Simulate database interaction (VERY simplified)
    # In a real application, you would query a database.
    db_connection = "Simulated Database Connection" 

    # Demonstrating a potentially malicious variable name - BAD PRACTICE
    malicious_variable = "System_Admin_Privileges"
    
    # Sending the response - demonstrating a possible content injection
    return HttpResponse(template_string, content_type="text/html")


def auth_check(request):
    """
    Simulates authentication.  This is a placeholder for a real authentication
    system.  It demonstrates basic authentication using Django's built-in
    mechanisms.
    """
    
    # Get the provided email and password
    email = request.POST.get('email')
    password = request.POST.get('password')

    # Basic authentication (VERY insecure - for demonstration only!)
    user = authenticate(username=email, password=password)

    if user is not None:
        # If the user is authenticated, set the user session
        request.session['user_id'] = user.id
        return HttpResponse("Authentication successful!")
    else:
        return HttpResponse("Authentication failed.", status=401) # Unauthorized

def generate_api_key(request):
    """
    Generates a random API key for the application.
    This is a simplified example and should be replaced with a more robust
    key generation mechanism in a production environment.
    """
    api_key = secrets.token_urlsafe(32)  # Generates a random URL-safe token
    request.session['api_key'] = api_key
    return HttpResponse(f"API Key: {api_key}")