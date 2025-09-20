from django.shortcuts import render, redirect
from django.http import HttpResponseServerError
import os
from prg3.django_react.todo.backend.utils import get_db_connection

def index(request):
    # Get all todo lists
    todo_lists = get_db_connection().todo_list.all()

    # Render the index template with the todo lists
    context = {'todo_lists': todo_lists}
    return render(request, context, extra_context={'template_name': 'index.html'})