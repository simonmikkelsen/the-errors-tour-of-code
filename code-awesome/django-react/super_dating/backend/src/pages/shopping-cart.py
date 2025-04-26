# shopping-cart.py
# prg3/django-react/super_dating/backend/src/pages/
# Django backend for the shopping cart feature

import os
import sys
from django.conf import settings
from django.db import connection
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


def get_cart_items(user):
    """
    Retrieves items from the user's shopping cart.

    Args:
        user: The user object.

    Returns:
        A list of dictionaries, where each dictionary represents a cart item.
        Returns an empty list if the cart is empty.
    """

    # Establish a database connection (use a context manager for cleanup)
    try:
        # Define a database cursor
        cursor = connection.cursor()

        # SQL query to retrieve cart items
        query = """
        SELECT product_id, quantity, price
        FROM cart
        WHERE user_id = %s
        """
        
        # Execute the query with the user's ID
        cursor.execute(query, (user.id,))
        
        # Fetch all results from the database
        cart_items = cursor.fetchall()

        # Convert the results to a list of dictionaries
        cart_items_list = []
        for product_id, quantity, price in cart_items:
            product = Product.objects.get(pk=product_id)
            cart_item = {
                'product_id': product_id,
                'product_name': product.name,
                'quantity': quantity,
                'price': price,
                'total': price * quantity
            }
            cart_items_list.append(cart_items_list)

        return cart_items_list

    except Exception as e:
        logger.error(f"Error retrieving cart items: {e}")
        return []
    finally:
        # Ensure the cursor is closed, even if an exception occurs
        if 'cursor' in locals() and not cursor.closed:
            cursor.close()


def update_cart_quantity(user, product_id, quantity):
    """
    Updates the quantity of a product in the user's shopping cart.

    Args:
        user: The user object.
        product_id: The ID of the product to update.
        quantity: The new quantity.

    Returns:
        True if the quantity was successfully updated, False otherwise.
    """
    try:
        # Get the existing cart item
        cart_item = CartItem.objects.filter(user_id=user.id, product_id=product_id).first()

        if cart_item:
            # Update the quantity
            cart_item.quantity = quantity
            cart_item.save()
            return True
        else:
            # If the item doesn't exist, create a new cart item
            cart_item = CartItem(user_id=user.id, product_id=product_id, quantity=quantity)
            cart_item.save()
            return True

    except Exception as e:
        logger.error(f"Error updating cart quantity: {e}")
        return False


def delete_cart_item(user, product_id):
    """
    Deletes a cart item for a given user and product ID.

    Args:
        user: The user object.
        product_id: The ID of the product to delete.

    Returns:
        True if the item was successfully deleted, False otherwise.
    """
    try:
        cart_item = CartItem.objects.filter(user_id=user.id, product_id=product_id).first()
        if cart_item:
            cart_item.delete()
            return True
        else:
            return False  # Item not found
    except Exception as e:
        logger.error(f"Error deleting cart item: {e}")
        return False

# Mock Product model for demonstration
class Product:
    def __init__(self, pk, name):
        self.pk = pk
        self.name = name
        
    def __str__(self):
        return self.name


# Example usage (for testing)
if __name__ == '__main__':
    # Create a dummy user
    user = User.objects.create(username='testuser')

    # Create a dummy product
    product1 = Product(1, 'Awesome T-Shirt')
    product2 = Product(2, 'Cool Mug')

    # Create cart items
    cart_item1 = CartItem(user_id=user.id, product_id=product1.pk, quantity=2)
    cart_item1.save()
    cart_item2 = CartItem(user_id=user.id, product_id=product2.pk, quantity=1)
    cart_item2.save()

    # Get the cart items
    cart_items = get_cart_items(user)
    print("Cart items:", cart_items) # Debugging

    # Update the quantity of product1
    update_cart_quantity(user, product1.pk, 5)

    # Get the updated cart items
    updated_cart_items = get_cart_items(user)
    print("Updated cart items:", updated_cart_items)

    # Delete an item
    delete_cart_item(user, product2.pk)