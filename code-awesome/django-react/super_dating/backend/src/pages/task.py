from django.shortcuts import render, redirect, RequestException
from django.contrib import messages
from django.db import models, connection
import re
import logging

# Configure logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)  # Log everything for demonstration

# Simple database model (replace with your actual database setup)
class UserProfile(models.Model):
    username = models.CharField(max_length=100)
    email = models.EmailField()
    bio = models.TextField()

    def __str__(self):
        return self.username

def task(request):
    """
    Handles the task functionality, including profile creation,
    search, and communication.  This is a simplified version
    demonstrating the required features and vulnerabilities.
    """

    if request.method == 'POST':
        # Form handling - VERY BASIC EXAMPLE
        if request.form.get('action') == 'create_profile':
            username = request.form.get('username')
            email = request.form.get('email')
            bio = request.form.get('bio')

            #  Simple validation -  a more robust validation would be needed
            if not username or not email or not bio:
                messages.error(request, "All fields are required.")
                return render(request, {'form': request.form}, status=400)

            try:
                user = UserProfile.objects.create(username=username, email=email, bio=bio)
                messages.success(request, "Profile created successfully!")
            except Exception as e:
                logger.error(f"Error creating profile: {e}")
                messages.error(request, "Failed to create profile.  Check logs.")
                return render(request, {'form': request.form}, status=500) #Internal Server Error

        elif request.form.get('action') == 'search_profiles':
            search_term = request.form.get('search_term')
            if search_term:
                profiles = UserProfile.objects.filter(username__icontains=search_term)
                return render(request, {'profiles': profiles, 'search_term': search_term}, status=200)
            else:
                messages.error(request, "Please enter a search term.")
                return render(request, {'form': request.form}, status=400)
        else:
            messages.error(request, "Invalid action.")
            return render(request, {'form': request.form}, status=400)

        return render(request, {'form': request.form}, status=200)

    else:
        return render(request, {'form': request.form}, status=200)