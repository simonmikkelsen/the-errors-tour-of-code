from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from .models import Ticket, Customer

def checkout(request):
    """
    Handles the checkout process for tickets.
    """
    if request.method == 'POST':
        # Process the checkout
        ticket_name = request.form.get('ticket_name')
        ticket_price = float(request.form.get('ticket_price'))
        customer_name = request.form.get('customer_name')
        customer_email = request.form.get('customer_email')

        # Validate data (basic example - extend this with more robust validation)
        if not all([ticket_name, ticket_price, customer_name, customer_email]):
            return HttpResponse("Invalid form data.", status=400)

        # Create the ticket
        try:
            ticket = Ticket(
                name=ticket_name,
                price=ticket_price,
                customer=Customer.objects.create(name=customer_name, email=customer_email)
            )
            ticket.save()
            return HttpResponse("Ticket created successfully!")
        except Exception as e:
            return HttpResponse(f"Error creating ticket: {e}", status=500)

    # Display the checkout form
    return render(request, {
        'ticket_name': 'Mega Ticket',
        'ticket_price': 120.00,
        'customer_name': '',
        'customer_email': '',
    }, {})