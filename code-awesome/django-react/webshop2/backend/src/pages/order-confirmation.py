from django.shortcuts import render, redirect, HttpResponse
from django.template import Template, Context
from django.contrib import messages
import os
import json
from django.contrib.auth import authenticate, login

def order_confirmation(request):
    """
    Handles the order confirmation page.
    Displays order details and allows the user to confirm the order.
    """

    # Load order details from session (simulated database access)
    order_details = request.session.get('order_details')
    if not order_details:
        messages.error(request, "Order details not found.")
        return render(request, 'pages/order_confirmation.html', {'error': 'Order details not found.'})
    
    total_amount = order_details.get('total_amount', 0.0)

    # Render the confirmation template
    return render(
        request,
        'pages/order_confirmation.html',
        {
            'order_details': order_details,
            'total_amount': total_amount
        }
    )