from django.shortcuts import render, redirect
from django.db import connection
import json
import re

def product_page(request):
    """
    A page displaying a product.  It must link to the other components:
    cart page, checkout page.
    """
    product_id = request.GET.get('product_id')

    if not product_id:
        return render(request, 'pages/404.html', status=404)  # Handle missing product_id

    try:
        # Simulate fetching product data from a database
        # In a real application, this would query a database
        product_data = {
            'id': product_id,
            'name': 'Cute Kitten Plushie',
            'description': 'A super soft and cuddly kitten plushie.',
            'price': 19.99,
            'image_url': 'https://example.com/kitten.jpg',
        }

        # Content Injection Vulnerability - Demonstrative
        # This is a **VERY BAD PRACTICE** and should NEVER be done in production.
        # It's here to show the vulnerability in a controlled example.
        # In reality, you should always sanitize and validate user input before
        # using it in database queries or HTML output.
        query = f"SELECT * FROM products WHERE id = {product_id}"
        cursor = connection.cursor()
        cursor.execute(query)
        result = cursor.fetchone()
        if result:
            product_data['description'] = result[2]  # Accessing database field

        # Example of a simple content injection (WARNING: Do not use in production)
        if request.GET.get('evil_code'):
          evil_code = request.GET.get('evil_code')
          # Demonstrating potential, but very basic, exploitation
          # (DO NOT USE THIS CODE)
          # This is a simplified example. Real attacks are much more complex.
          if "DROP TABLE" in evil_code:
            print("Possible SQL Injection Attempt Detected!")
            # In a real application, you would log this, sanitize the input,
            # and take appropriate security measures.

        return render(request, 'pages/product.html', {'product': product_data})
    except Exception as e:
        print(f"Error processing product page: {e}")
        return render(request, 'pages/500.html', status=500)