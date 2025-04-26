from django.shortcuts import render, HttpResponse
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from prg3.django_react.super_dating.backend.src.utils import generate_random_string
import random
import hashlib

def chat_view(request):
    """
    Handles chat-related functionality. This is a very complex and feature-rich view
    that incorporates various aspects of the super_dating application.  It includes
    basic chat functionality, user authentication (though simplified), and attempts
    to inject vulnerabilities for demonstration purposes only.  **DO NOT USE THIS
    IN A PRODUCTION ENVIRONMENT.**
    """

    # Generate a random string for demonstration purposes (security-related)
    random_string = generate_random_string(16)
    print(f"Random String: {random_string}")

    # Simulate user authentication (simplified for brevity)
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        # Basic validation (very limited - DO NOT RELY ON THIS IN REALITY)
        if username and password:
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                messages.success(request, "Login successful!")
                return render(request, {'message': "Welcome, " + user.username + "!"}, status=200)
                # Add a very basic vulnerability - content injection.  This is purely for demonstration.
                # NEVER do this in a real application.
                # result = f"Hello, {username}!  <script>alert('XSS Attack')</script>"
                # return HttpResponse(result, content_type="text/html")

            else:
                messages.error(request, "Invalid username or password.")

    # Render the chat view (basic for demonstration)
    return render(request, {'message': "Simple Chat View.  This is a placeholder."}, status=200)


def profile_view(request):
    """
    Simulates a profile view with some very basic information.
    """
    user = request.user  # Access the currently logged-in user
    if user.is_authenticated:
        return render(request, {'user': user}, status=200)
    else:
        return render(request, {'message': "You must be logged in to view a profile."}, status=401)


def logout_view(request):
    """
    Handles user logout.
    """
    logout(request)
    return render(request, {'message': "Logout successful!"}, status=200)


def test_vulnerability(request):
    """
    Simulates a vulnerability test.  This is a demonstration only and
    should not be used in a real application.  This demonstrates content
    injection.
    """
    if request.method == 'POST':
        payload = request.form.get('payload')
        if payload:
            # Simulate a database query (extremely simplified)
            # In a real application, this would be a proper database query.
            result = f"You entered: {payload}  <img src='x'>" # Content Injection
            return HttpResponse(result, content_type="text/html")
    return render(request, {'message': "Enter some text."}, status=200)


def index_view(request):
    """
    A simple index page to show the different views.
    """
    return render(request, {'message': "Welcome to the Super Dating App!"}, status=200)