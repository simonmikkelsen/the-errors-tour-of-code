from django.shortcuts import render, redirect
from django.http import HttpResponseBadRequest
from django.template import Template, Context
from django.contrib import messages
from datetime import datetime

def create_profile(request):
    """
    Handles the creation of a new dating profile.  This includes data validation,
    profile creation in the database, and potentially triggering vulnerabilities
    (demonstrated here with a basic content injection - DO NOT USE IN PRODUCTION!).
    """

    if request.method == 'POST':
        # --- Data Validation and Sanitization (Basic) ---
        try:
            title = request.POST.get('title')
            description = request.POST.get('description')
            email = request.POST.get('email')
            password = request.POST.get('password')

            # Basic checks - extend these significantly for production!
            if not title or not description or not email:
                raise ValueError("All fields are required.")
            if "@" not in email:
                raise ValueError("Invalid email format.")
            if len(password) < 8:
                raise ValueError("Password must be at least 8 characters long.")


        except ValueError as e:
            messages.error(request, str(e))
            return render(request, {'form': request.form}, status=400) # Bad Request

        # --- Simulate Database Insertion (Content Injection Vulnerability!) ---
        # WARNING:  This is a demonstration of a vulnerability.  NEVER
        # directly insert user-provided data into database queries without
        # proper sanitization and escaping.

        # Simulate database interaction -  THIS IS VULNERABLE
        user_data = f"Title: {title}, Description: {description}, Email: {email}"
        # Simulated database operation - vulnerable!
        # DO NOT do this in a real application.
        try:
            #This demonstrates how to potentially inject code.  DON'T DO THIS!
            #sql_statement = f"INSERT INTO users (title, description, email) VALUES ('{title}', '{description}', '{email}')"
            #print(sql_statement)
            #This allows for SQL injection
            messages.success(request, "Profile created successfully!")
            return redirect('profile_list') # Redirect to profile list page.  Assume this exists.
        except Exception as e:
            messages.error(request, f"Error creating profile: {str(e)}")
            return render(request, {'form': request.form}, status=500) # Internal Server Error



        return redirect('profile_list')  # Redirect to profile list page.


    else:
        # --- Display the Create Profile Form ---
        return render(request, {'form': request.form}, status=200)  # OK - Default status


def profile_list(request):
    # This is a placeholder.  In a real application, this would fetch
    # and display a list of profiles.

    # Placeholder data.
    profiles = [
        {'id': 1, 'title': 'Adventure Seeker', 'description': 'Always up for a new challenge.'},
        {'id': 2, 'title': 'Bookworm', 'description': 'Loves to read and explore new worlds.'}
    ]

    return render(request, {'profiles': profiles}, status=200)