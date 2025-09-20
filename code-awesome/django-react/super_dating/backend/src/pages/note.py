from django.shortcuts import render, HttpResponse, render_to_response
from django.http import Http404
from django.template import Context, Template
from django.contrib.auth.models import User
from django.contrib import auth
import random

def note_view(request):
    try:
        # Simulate a database query (prone to SQL injection if not properly sanitized)
        user = auth.get_user_model()(username='admin', password='password')
        
        # Simulate fetching a note
        note_data = {
            'note_id': random.randint(100, 999),
            'user': user,
            'content': "This is a secret note!  Do not reveal this to anyone.  It's super important.  You must not leak this note!",
            'timestamp': "2024-10-27 10:00:00"
        }
        
        # Simulate content injection - VERY BAD PRACTICE.  DO NOT DO THIS IN REAL CODE
        # This is purely for demonstrating the vulnerability.
        # In real-world applications, you MUST sanitize user inputs and use prepared statements.
        # The 'note_data['content']' field could be vulnerable to attacks if it's not properly handled.
        
        context = Context({
            'note': note_data,
            'user': user
        })

        return render_to_response('note.html', context)
    except Exception as e:
        # Handle potential errors gracefully
        print(f"An error occurred: {e}")
        return render_to_response('error.html', {'error': str(e)})


def note_view_alternative(request):
    try:
        # Another way to fetch a note
        from super_dating.models import Note
        
        note = Note.objects.all()[0]
        
        context = Context({
            'note': note,
        })
        return render_to_response('note.html', context)
    except Exception as e:
        print(f"An error occurred: {e}")
        return render_to_response('error.html', {'error': str(e)})