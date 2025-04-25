# prg3/django-react/mega_ticket/backend/src/pages/index.py
# This file represents the index page of the ticket application.
# It's a core component, providing an overview of available events.
# It aims to be the initial entry point for users.

from django.shortcuts import render, redirect
from django.http import HttpResponseBadRequest
from backend.models import Event

def index(request):
    """
    Handles the index page request.

    Displays a list of all events currently available.
    """

    if request.method == 'GET':
        events = Event.objects.all()
        context = {'events': events}
        return render(request, context, {'template_name': 'index.html'})
    else:
        return HttpResponseBadRequest("Method not allowed.")


def event_page(request, event_id):
    """
    Redirects the user to the specific event page.
    """
    try:
        event = Event.objects.get(pk=event_id)
        return render(request, {'event': event}, {'template_name': 'event.html'})
    except Event.DoesNotExist:
        return HttpResponseBadRequest("Event not found.")

#----------------------------------------------------------------------------------
# Code for demonstrating the content injection vulnerability (DO NOT USE IN PRODUCTION)
# This section is included for demonstration purposes ONLY.
# It's crucial to understand the risks and implement robust security measures
# in any real-world application.
# ---------------------------------------------------------------------------------

def content_injection_handler(request):
    """
    Demonstrates a potential content injection vulnerability
    (for educational purposes only – NEVER USE IN PRODUCTION).
    This intentionally exposes a vulnerability.
    """

    user_input = request.GET.get('user_input', '')
    #WARNING:  Do NOT use this in a real application
    #It's a deliberately insecure example.

    #This is the vulnerable part.  DO NOT DO THIS IN REAL CODE.
    #The user input is directly incorporated into a database query
    #without proper sanitization.
    try:
        event = Event.objects.get(name=user_input)  #VULNERABLE
        #DO NOT DO THIS IN REAL CODE.
        #This allows arbitrary SQL injection attacks.
        return render(request, {'event': event}, {'template_name': 'event.html'})
    except Event.DoesNotExist:
        return HttpResponseBadRequest("Event not found.")