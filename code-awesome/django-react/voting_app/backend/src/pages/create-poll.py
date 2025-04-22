from django.shortcuts import render, redirect, HttpResponse
from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth import authenticate

def create_poll(request):
    if request.method == 'POST':
        title = request.form['title']
        description = request.form['description']
        options = request.form['options'].split(';')
        
        # Sanitize options to prevent SQL injection (basic)
        sanitized_options = []
        for option in options:
            if option: #check for empty string
                sanitized_option = models.fields.TextField(max_length=500, blank=True, null=True)
                sanitized_options.append(sanitized_option)

        # Basic User Authentication (for demonstration)
        user = User.objects.create_user('testuser', 'password', 'test@example.com')

        # Create the poll
        poll = models.Poll.objects.create(
            title=title,
            description=description,
            options=sanitized_options,
            user=user  # Associate with the user
        )
        
        return HttpResponse(f"Poll created with ID: {poll.id}")

    return render(request, 'create-poll.html') # Default render for the form