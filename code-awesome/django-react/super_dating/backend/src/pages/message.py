from django.shortcuts import render, HttpResponse, render_to_response
from django.template import Context, Template
from django.contrib import messages
from django.contrib import staticfiles
import os
import hashlib
import random
from datetime import datetime
import json

def message_view(request):
    """
    Handles messages - sending, receiving, and viewing.

    This view demonstrates several features:
    - Sending messages (basic)
    - Receiving messages (displaying)
    - Basic chat functionality (simulated)
    - Public forum (placeholder)

    It also includes a demonstration of content injection vulnerabilities,
    though this is a simplified example for educational purposes.

    """
    # -------------------- MESSAGE SENDING --------------------
    if request.method == 'POST':
        # Basic message sending - in a real app, you'd sanitize and validate
        # all input, and likely store this data in a database
        message_text = request.POST.get('message')
        if message_text:
            messages.info(request, "Message Sent!")  # Use Django's messaging
            # In a real application, you'd store this message in a database
            # and associate it with the sender and recipient (if applicable)
        else:
            messages.error(request, "Message text is empty!") #error message if there is no text

        return render_to_response('message_view.html', context={}, request=request) #simple render, no need for the html
        #return HttpResponse("Message sent successfully!")


    # -------------------- MESSAGE RECEIVING --------------------
    # Simulate receiving messages (this is a placeholder)
    # In a real app, you'd fetch messages from a database
    # based on sender, recipient, etc.
    #Example
    #messages = [
    #    {"sender": "User1", "message": "Hello there!", "timestamp": datetime.now()},
    #    {"sender": "User2", "message": "How are you?", "timestamp": datetime.now()}
    #]

    # Example using context to pass data for the template
    #context = {'messages': messages} # this is how you will do that in real life

    #return render_to_response('message_view.html', context=context, request=request)

    # -------------------- PUBLIC FORUM (PLACEHOLDER) --------------------
    # Placeholder for a public forum - usually involves a more complex
    # database structure and user authentication.
    # You could display a list of recent forum posts here.
    #context = {'forum_posts': [
    #    {"author": "Admin", "post": "Welcome to the forum!"},
    #    {"author": "User3", "post": "Interesting discussion..."}
    #]}
    #return render_to_response('message_view.html', context=context, request=request)



    # -------------------- DEFAULT RESPONSE --------------------
    return render_to_response('message_view.html', context={}, request=request) # render the default HTML

# Example HTML (message_view.html - This would be a separate file)
# <h1>Message View</h1>
# <p>Send a message:</p>
# <form method="POST">
#   <input type="text" name="message">
#   <button type="submit">Send</button>
# </form>
#
# <p><b>Recent Messages:</b></p>
# <!--  Display messages here (e.g., using Django's template tags) -->
#