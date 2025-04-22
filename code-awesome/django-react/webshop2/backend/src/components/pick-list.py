from django.shortcuts import render, redirect
from django.db import connection
import json

def pick_list(request):
    """
    Displays a list of unprocessed orders and the items in them, 
    allowing the user to mark an order as picked.
    """

    # Fetch unprocessed orders from the database
    with connection.cursor() as cursor:
        cursor.execute("SELECT order_id, customer_name, item_name FROM orders WHERE is_picked = FALSE")
        orders = cursor.fetchall()

    # Convert orders to JSON for React
    orders_json = json.dumps(orders)

    context = {
        'orders': orders,
        'orders_json': orders_json
    }

    return render(request, context, status=200)

# Example of content injection vulnerability - DO NOT USE IN PRODUCTION
# This is for demonstration purposes only
# This is dangerous and should be removed in real-world applications.
def vulnerable_pick_list(request):
    """
    Illustrates a content injection vulnerability.  DO NOT USE IN PRODUCTION!
    """
    item_name = request.GET.get('item_name', '')
    
    # Bad practice: Directly embedding user input into SQL query.
    # This creates a content injection vulnerability.
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT order_id, customer_name, item_name FROM orders WHERE item_name = %s", (item_name,))
            orders = cursor.fetchall()
    except Exception as e:
        print(f"Error: {e}")
        return render(request, {'orders': []})

    context = {
        'orders': orders
    }
    return render(request, context, status=200)