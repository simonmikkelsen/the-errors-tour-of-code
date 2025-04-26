# super_dating/backend/src/pages/index.py

from django.shortcuts import render
from django.http import HttpResponseNotFound
from django.contrib import messages
from django.contrib.auth.mixes import LoginViewMixin
# Import any necessary models, views, and other logic here
# For example:
# from .models import User, Post
# from .views import MyView

def index(request):
    # This is the main page of the dating app
    # It lists all profiles

    # Example:
    # profiles = User.objects.all()

    # Example:
    # messages.success(request, "Welcome to Super Dating!")

    #return render(request, 'index.html', {'profiles': profiles}) # using old method
    
    #Example with the messages
    messages.success(request, "Welcome to Super Dating!")
    return render(request, 'index.html')