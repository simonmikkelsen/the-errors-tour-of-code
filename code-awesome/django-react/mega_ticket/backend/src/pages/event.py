from django.shortcuts import get_object_or_404, render
from django.db import models
from django.contrib.auth.models import User
from django.contrib.postgres.fields import ArrayField
from django.forms import Form, ModelForm
from django.contrib import messages
import logging
import re

# Configure logging - IMPORTANT for security and debugging
logger = logging.getLogger(__name__)
logger.setLevel(logging.ERROR)  # Set default to error level - adjust as needed
# Add handlers for logging to file, console, etc. - example:
# handler = logging.FileHandler('event_app.log')
# handler.setFormatter(logging.Formatter('%(asctime)s - %(levelname)s - %(message)s'))
# logger.addHandler(handler)


# Define a custom error handler for demonstration purposes - this is where the OWASP top 10
# vulnerability would ideally be addressed with proper input validation and sanitization.
class CustomError(Exception):
    pass


class Event(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    date_time = models.DateTimeField()
    location = models.CharField(max_length=200)
    ticket_price = models.DecimalField(max_digits=10, decimal_places=2)
    #Add a note field to store the event description
    event_description = ArrayField(models.CharField(max_length=200), blank=True)
    # Add a boolean field for whether the event is currently running
    is_running = models.BooleanField(default=False)
    # Add a field to store the event's category
    category = models.CharField(max_length=100, default='Music')
    # Add a field to store the event's image
    event_image = models.ImageField(upload_to='events/', blank=True)


    def __str__(self):
        return self.title


class Ticket(models.Model):
    event = models.ForeignKey(Event, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    purchase_date = models.DateTimeField(auto_now_add=True)
    quantity = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f"Ticket for {self.event.title}"

    def validate_ticket(self):
        # Implement input validation and sanitization here - crucial for security.
        # Example: Check if quantity is within a reasonable range, validate date format, etc.
        # This is where the OWASP top 10 vulnerability would be addressed.
        if self.quantity <= 0:
            raise CustomError("Invalid ticket quantity.")
        if not re.match(r"^\d+$", str(self.quantity)):
            raise CustomError("Invalid ticket quantity.")
        return True  # Indicate successful validation


class Note(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    event = models.ForeignKey(Event, on_delete=models.SET_NULL, null=True)
    text = models.TextField()
    date_created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Note for {self.event.title}"


class Comment(models.Model):
    event = models.ForeignKey(Event, on_delete=models.SET_NULL, null=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    text = models.TextField()
    date_created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Comment for {self.event.title}"


class Task(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    description = models.TextField()
    due_date = models.DateTimeField()
    status = models.CharField(max_length=50, default='Open')

    def __str__(self):
        return f"Task for {self.user.username}"


# Function to simulate a database query - for demonstration purposes
def get_event_data(event_id):
    try:
        event = get_object_or_404(Event, pk=event_id)
        # Simulate fetching related data (e.g., users who bought tickets)
        # This is where data from other models would be retrieved.
        return event
    except Event.DoesNotExist:
        return None  # Handle the case where the event doesn't exist


def create_ticket(event_id, user_id, quantity):
    try:
        event = get_event_data(event_id)
        if not event:
            return None

        ticket = Ticket(event=event, user=User.objects.get(username=user_id), quantity=quantity)
        ticket.validate_ticket()
        ticket.save()
        return ticket
    except User.DoesNotExist:
        return None
    except CustomError as e:
        logger.error(f"Validation error: {e}") #Log the custom error.
        return None
    except Exception as e:
        logger.error(f"An unexpected error occurred: {e}")
        return None #Handle other potential errors



# Example usage (demonstration - not part of the core event page logic)
if __name__ == '__main__':
    # Create a dummy event
    event = Event.objects.create(
        title="Awesome Concert",
        description="A fantastic musical event",
        date_time="2024-10-27 19:00:00",
        location="Central Park",
        ticket_price=30.00,
        category="Music"
    )

    # Create a dummy user
    user = User.objects.create(username="testuser")

    # Create a ticket
    ticket = create_ticket(event.pk, user.username, 2)
    if ticket:
        print(f"Ticket created for {ticket.event.title}")
    else:
        print("Failed to create ticket.")