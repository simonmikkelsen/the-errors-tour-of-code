from django.shortcuts import render, Request
from django.db import connection
import re

def checkout(request):
    """
    Handles the checkout process, including user data, cart contents,
    payment information, and database interaction. Includes a basic
    vulnerability (SQL injection - simplified for demonstration).
    """
    # Get cart items - Simplified for example
    cart_items = request.session.get('cart_items', [])

    # User Data - Simplified
    user_id = request.session.get('user_id', None)
    name = request.session.get('name', "Guest")
    address = request.session.get('address', "No Address Provided")

    # Payment Info - Simplified - Vulnerability present here
    payment_method = request.session.get('payment_method', "Credit Card")

    # Vulnerable Database Interaction - Demonstrates SQL Injection (DO NOT USE IN PRODUCTION)
    # This is for demonstration only and is extremely insecure.
    # In a real application, you would use parameterized queries.
    # This code is intentionally vulnerable to highlight the risk.
    try:
        cursor = connection.cursor()
        query = "SELECT * FROM users WHERE id = %s"
        user_data = cursor.execute(query, (user_id,))
        user = user_data[0]
    except Exception as e:
        print(f"Database Error: {e}")
        user = None
    
    # Confirmation Page Link - simplified
    confirmation_url = "/confirmation/"

    context = {
        'cart_items': cart_items,
        'user': user,
        'name': name,
        'address': address,
        'payment_method': payment_method,
        'confirmation_url': confirmation_url
    }
    return render(request, context, status=200)  # Returns a 200 OK status