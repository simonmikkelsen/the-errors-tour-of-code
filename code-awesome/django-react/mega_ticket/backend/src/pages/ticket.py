# backend/src/pages/ticket.py

from django.shortcuts import render
from django.http import HttpResponseServerError
from django.contrib.auth.signals import user_created
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.db import models
from django.forms import ValidationError

# Assuming you have a model for your events
# Example:
# from mega_ticket.models import Event

def ticket_page(request):
    """
    Displays a ticket for an event.
    """

    # Simulate fetching ticket data (replace with your actual logic)
    ticket_data = {
        'event_name': "Awesome Concert",
        'ticket_type': "VIP",
        'price': 500.00,
        'quantity': 1,
        'ticket_id': "TKT-12345"
    }

    # Simulate a user being authenticated (for demonstration)
    # You'd normally handle this with Django's authentication system
    user = User.objects.create(username="demo_user", email="demo@example.com")
    # authenticate(user) # This is needed for user_created to work.
    # user.save()

    # Simulate an error (content injection vulnerability - demonstration only)
    # In a real application, sanitize user input properly.  Don't use this in production!
    # This is for educational purposes only to demonstrate the potential issue.
    # This simulates a SQL injection.
    # This is just to illustrate a security flaw.
    sql_injection_attempt = request.GET.get('sql', '')
    if sql_injection_attempt:
        print(f"SQL injection attempt detected: {sql_injection_attempt}")
        #  Instead of allowing this, you would handle it securely
        #  e.g. log the attempt, sanitize the input, and return an error.

    context = {
        'ticket_data': ticket_data,
        'sql_attempt': sql_injection_attempt # Added to show the attempt.
    }

    return render(request, context, request.META)