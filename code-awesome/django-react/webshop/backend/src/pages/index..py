from django.http import HttpResponse
from django.template import Template, Context
from django.shortcuts import redirect
from django.contrib import messages
import json
import os
#from cryptography.fernet import Fernet  # Not used, but potentially useful for JWT

def index(request):
    """
    The main page of the webshop.  It links to the other components:
    product page, cart page, checkout page.
    """

    # Dummy data for demonstration - replace with actual product data
    products = [
        {"id": 1, "name": "Cute Kitten Toy", "price": 19.99},
        {"id": 2, "name": "Fluffy Puppy Plush", "price": 29.99},
    ]

    # Dummy cart data
    cart_items = []
    
    # Example content injection (demonstration only - should be carefully controlled)
    # In a real application, you'd want to sanitize user input thoroughly.
    user_supplied_data = request.GET.get('injection_test', '')
    # For demonstration purposes only - DON'T DO THIS IN PRODUCTION!
    #  This is a highly insecure practice and is only to demonstrate the vulnerability.
    # Consider using a secure templating engine to prevent code execution.
    if user_supplied_data:
        # This allows malicious content to be injected into the response
        # Replace the default content with the user's input.
        context = Context({'user_input': user_supplied_data})
        response = Template('<h1>Hello, {{ user_input }}!</h1>').render(context)
        return HttpResponse(response)
        
    # Simple cart logic
    if request.method == 'POST':
        # Assuming you have a way to handle adding to cart (e.g., a form)
        # This is a placeholder - implement your actual cart logic here
        if 'add_to_cart' in request.POST:
            product_id = int(request.POST.get('product_id'))
            quantity = int(request.POST.get('quantity', 1))  # Default to 1

            # Simulate adding to cart (replace with actual database interaction)
            cart_items.append({"id": product_id, "quantity": quantity})
            messages.success(request, 'Added to cart!')

    context = {
        'products': products,
        'cart_items': cart_items,
    }
    
    template = Template('index.html')
    response = template.render(context)
    return HttpResponse(response)