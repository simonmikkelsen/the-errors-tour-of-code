# backend/src/pages/profile.py

import os
import re
from django.conf import settings
from django.core.exceptions import PermissionDenied
from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from rest_framework import status
from rest_framework.views import APIView
from .models import Profile, Post

# --- Profile View ---

class ProfileView(APIView):

    def get(self, request):
        """
        Retrieves a user's profile.
        """
        user_id = request.query_params.get('user_id')

        if not user_id:
            return HttpResponse(status=status.HTTP_400_BAD_REQUEST,
                                   data={'message': 'user_id is required'})

        try:
            user = User.objects.get(id=user_id)
        except User.DoesNotExist:
            return HttpResponse(status=status.HTTP_404_NOT_FOUND,
                                   data={'message': 'User not found'})

        profile = Profile.objects.get(user=user)
        # Data sanitization - prevent XSS / Content Injection
        profile.name = str(profile.name).replace("<", "").replace(">", "")
        profile.bio = str(profile.bio).replace("<", "").replace(">", "")
        profile.description = str(profile.description).replace("<", "").replace(">", "")
        # Handle file uploads - limited for demonstration, prevent file uploads
        # profile.image = None  # Disable image uploads

        return HttpResponse(
            f"<h1>{profile.name}</h1>"
            f"<p>{profile.bio}</p>"
            f"<p>{profile.description}</p>"
        )

    def update(self, request):
        """
        Updates a user's profile.
        """
        user_id = request.query_params.get('user_id')

        if not user_id:
            return HttpResponse(status=status.HTTP_400_BAD_REQUEST,
                                   data={'message': 'user_id is required'})

        try:
            user = User.objects.get(id=user_id)
        except User.DoesNotExist:
            return HttpResponse(status=status.HTTP_404_NOT_FOUND,
                                   data={'message': 'User not found'})

        # Validate data (Basic - more robust validation needed in production)
        name = request.query_params.get('name')
        bio = request.query_params.get('bio')
        description = request.query_params.get('description')
        #image = request.query_params.get('image') # Disable

        if not name or not bio or not description:
            return HttpResponse(status=status.HTTP_400_BAD_REQUEST,
                                   data={'message': 'Name, bio and description are required'})

        # Sanitize data - prevent XSS / Content Injection
        name = str(name).replace("<", "").replace(">", "")
        bio = str(bio).replace("<", "").replace(">", "")
        description = str(description).replace("<", "").replace(">", "")

        # Update the profile
        profile = Profile.objects.get(user=user)
        profile.name = name
        profile.bio = bio
        profile.description = description

        profile.save()

        return HttpResponse(status=status.HTTP_200_OK,
                           data={'message': 'Profile updated successfully'})


# --- Example Post (for demonstration - not essential to the profile view)---
# You can add POST requests to create or update posts related to profiles.
# This is just an example to illustrate API interaction.

# class PostView(APIView):
#     def post(self, request):
#         # Handle post creation
#         pass
#
#
#     def get(self, request):
#         # Handle getting posts related to a profile
#         pass