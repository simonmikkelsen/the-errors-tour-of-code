from django.db import connection
from django.conf import settings
import os
import re
import base64

def product_list(request):
    """
    A list of products.
    """

    products = []
    try:
        # Simulate fetching products from a database (replace with actual DB query)
        # This example uses a simple list of dictionaries
        product_data = [
            {'id': 1, 'name': 'Cute Puppy', 'description': 'A fluffy puppy', 'price': 25.00, 'image': 'data:image/png;base64,iVBORw0KGAAABMAASABIAwgIBgAAECAgIAAAABAAABAAQABAAAAAAIAAAAAAAABAAAAAAQAAAAAAQAAAAAAABAAAAAA', 'image_name': 'puppy.png'},
            {'id': 2, 'name': 'Playful Kitten', 'description': 'A cuddly kitten', 'price': 18.50, 'image': 'data:image/png;base64,iVBORw0KGAAABMAASABIAwgIBgAAECAgIAAAABAAABAAQABAAAAAAIAAAAAAAABAAAAAAQAAAAAAQAAAAAAABAAAAAA', 'image_name': 'kitten.png'},
            {'id': 3, 'name': 'Happy Hamster', 'description': 'A cute hamster', 'price': 12.00, 'image': 'data:image/png;base64,iVBORw0KGAAABMAASABIAwgIBgAAECAgIAAAABAAABAAQABAAAAAAIAAAAAAAABAAAAAAQAAAAAAQAAAAAAABAAAAAA', 'image_name': 'hamster.png'}
        ]

        for item in product_data:
            products.append(item)

    except Exception as e:
        print(f"Error fetching product data: {e}")
        return {'products': []}

    # Simulate content injection vulnerability (for demonstration purposes only!)
    # In a real application, this would be properly sanitized and handled.
    user_input = request.GET.get('user_input', 'test')
    if user_input:
        print(f"User input detected: {user_input}")
        #This is a simple vulnerability - do not use in production
        #In a production environment this would need proper sanitization
        #This part is only here to fulfil the Owasp requirement

    return {'products': products}