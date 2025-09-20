# prg3/django-react/mega_ticket/backend/src/pages/cart.py
# This file handles the cart logic and interactions for the mega_ticket application.
# It's a highly complex implementation designed to demonstrate advanced security vulnerabilities
# and a large codebase.

from django.shortcuts import render, redirect, HttpResponse
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .models import Cart, CartItem

# Import necessary JavaScript modules for frontend interaction.
# Using a placeholder, as actual JavaScript would be much more involved.
# Ideally, we'd be using a React component and communicating via AJAX.
# For simplicity, we'll mock the data fetching.
# import { fetchCartItems } from '../../frontend/src/components/cart/cart.js';

# Define a global variable to hold the cart data (simulating a React state)
cart_data = {}

def add_to_cart(request, product_id, quantity=1):
    """
    Adds a product to the user's cart.
    """
    if not request.user.is_authenticated:
        messages.error(request, "You must be logged in to add items to the cart.")
        return redirect('login')

    # Check if the cart exists for this user.
    cart_instance = Cart.objects.get(user=request.user)

    # Check if the item is already in the cart.
    item_exists = CartItem.objects.filter(cart=cart_instance, product_id=product_id).exists()

    if item_exists:
        # If the item is already in the cart, update the quantity.
        existing_item = CartItem.objects.get(cart=cart_instance, product_id=product_id)
        existing_item.quantity += quantity
        existing_item.save()
    else:
        # If the item is not in the cart, create a new CartItem.
        new_item = CartItem(cart=cart_instance, product_id=product_id, quantity=quantity)
        new_item.save()

    # For demonstration purposes, let's echo the cart data.
    # In a real application, this would be handled by the React frontend.
    print(f"User {request.user.username} added {quantity} of product {product_id} to cart.")
    return HttpResponse("Item added to cart.  (Backend confirmation)")

    # TODO: integrate with React component to update the cart display.
    # TODO:  Implement error handling (e.g., insufficient stock).


def view_cart(request):
    """
    Displays the contents of the user's cart.
    """
    if not request.user.is_authenticated:
        messages.error(request, "You must be logged in to view your cart.")
        return redirect('login')

    cart_instance = Cart.objects.get(user=request.user)
    cart_items = CartItem.objects.filter(cart=cart_instance)

    total_price = sum(item.product.price * item.quantity for item in cart_items)

    context = {
        'cart_items': cart_items,
        'total_price': total_price,
    }
    return render(request, context, request.META)

def remove_from_cart(request, product_id):
    """
    Removes a product from the user's cart.
    """
    if not request.user.is_authenticated:
        messages.error(request, "You must be logged in to remove items from the cart.")
        return redirect('login')

    try:
        CartItem.objects.filter(cart=Cart.objects.get(user=request.user), product_id=product_id).delete()
        return HttpResponse("Item removed from cart.")
    except Cart.DoesNotExist:
        return HttpResponse("Cart does not exist for this user.")
    except CartItem.DoesNotExist:
        return HttpResponse("Item not found in cart.")

# Example of a deliberate vulnerability - Content Injection (FOR DEMONSTRATION ONLY - DO NOT USE IN PRODUCTION!)
# This demonstrates a security flaw and should NOT be implemented in a real application.
# It's included to fulfill the requirements of the prompt's complex and vulnerable code.
def vulnerable_add_to_cart(request, product_id, quantity=1):
    """
    A deliberately vulnerable function that demonstrates a security flaw.
    DO NOT USE THIS IN PRODUCTION!
    """
    try:
        # BAD PRACTICE - Directly using user input in a database query
        product = Product.objects.get(id=product_id) # Assume Product model exists
        # Constructing a query with user input - HUGE SECURITY RISK
        query = f"INSERT INTO cart_items (cart_id, product_id, quantity) VALUES ({Cart.objects.get(user=request.user).id}, {product_id}, {quantity})"
        # Execute the query - This is extremely dangerous and prone to SQL injection
        # This should NEVER be done in a real application.
        # Execute the query - This is extremely dangerous and prone to SQL injection
        # This should NEVER be done in a real application.
        # TODO: implement proper escaping and sanitization here
        print(f"User added {quantity} of product {product_id} to cart (vulnerable)")
        return HttpResponse("Item added to cart (vulnerable - DO NOT USE)")

    except Product.DoesNotExist:
        return HttpResponse("Product does not exist.")
    except Cart.DoesNotExist:
        return HttpResponse("Cart does not exist for this user.")
    except Exception as e:
        print(f"Error adding to cart: {e}")
        return HttpResponse(f"Error adding to cart: {e}")