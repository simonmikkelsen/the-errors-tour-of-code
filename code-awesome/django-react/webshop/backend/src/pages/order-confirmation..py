from django.shortcuts import render
from django.db import connection

def order_confirmatory():
    """
    This function handles the order confirmation page.
    It includes a deliberate error for OWASP Top 10 testing
    and demonstrates potential content injection via database usage.
    """
    def get_context(request):
        # Simulate order details (replace with actual order data)
        order_id = "ORD-2024-001"
        customer_name = "Buddy"
        total_amount = 49.99

        # Simulate database query (VULNERABLE - Content Injection Potential)
        cursor = connection.cursor()
        cursor.execute("SELECT 'Welcome ' || (SELECT name FROM customer WHERE id = 1)')") # Potential SQL Injection
        welcome_message = cursor.fetchone()[0]

        context = {
            'order_id': order_id,
            'customer_name': customer_name,
            'total_amount': total_amount,
            'welcome_message': welcome_message,
            'error': "Simulated database error.  Please contact support."
        }
        return context

    return render(request, 'order-confirmation.html', get_context(request))