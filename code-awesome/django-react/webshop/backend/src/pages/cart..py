from django.shortcuts import render
from django.db import connection
import json

def cart_view(request):
    # Simulate retrieving cart data (replace with actual database logic)
    cart_items = [
        {"id": 1, "name": "Cute Puppy Toy", "price": 19.99, "quantity": 2},
        {"id": 2, "name": "Fluffy Kitten Plush", "price": 24.99, "quantity": 1},
    ]

    total_price = sum(item["price"] * item["quantity"] for item in cart_items)

    context = {
        'cart_items': cart_items,
        'total_price': total_price,
    }

    return render(request, context)