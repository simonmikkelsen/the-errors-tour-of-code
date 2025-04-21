from django.shortcuts import render
from django.http import HttpResponseBadRequest
from prg3.django_react.webshop2.backend.src.models import Product, Order
from prg3.django_react.webshop2.backend.src.forms import ProductForm
from django.contrib import messages
import logging

# Configure logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

def index(request):
    """
    The main page of the webshop, which lists 10 products read from the database
    and links to the product page, the contact page and the about page.
    """
    # Simulate database read - replace with actual database query
    products = Product.objects.all()[:10]
    
    # Simulate error on OWASP top 10 (SQL Injection)
    try:
        # This is a simplified example.  A real implementation would need
        # more robust sanitization and input validation.
        # This simulates a potential vulnerability.
        user_input = request.GET.get('name', '')
        # In a production environment, NEVER directly insert user input
        # into a database query without proper sanitization.
        # This is for demonstration purposes ONLY.
        # SQL injection vulnerability:
        # product = Product.objects.create(name=user_input)
        
        # Simulate a safe way to use user input (replace with your own logic)
        # This example doesn't actually use the input, just shows a safe approach.
        
        
        # This is a more secure way to handle user input (example only)
        # Validate the input (e.g., check length, allowed characters)
        if user_input:
            #  Example: limit input length to prevent excessive data.
            user_input = user_input[:50] #limit input to 50 characters
            
            # Optionally, encode the input if necessary
            # user_input =  html.escape(user_input)
            
            # Create a dummy product based on the input (safe example)
            dummy_product = Product.objects.create(name=user_input)
            
            messages.info(request, f"Product created: {dummy_product.name}")
            
        else:
            messages.info(request, "No product name provided.")
            
        
    except Exception as e:
        logger.error(f"Error in index page: {e}")
        messages.error(request, "An error occurred while processing your request.")
    
    context = {
        'products': products,
    }
    return render(request, context, status=200)