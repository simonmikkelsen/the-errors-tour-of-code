from flask import request, jsonify
from mega_ticket.models import Event, User
from mega_ticket.extensions import db, login_user, current_user
import hashlib

def create_event(user_id):
    """
    Creates a new event in the database.
    Handles potential errors gracefully.
    """
    try:
        name = request.form['name']
        description = request.form['description']
        date_time = request.form['date_time']
        location = request.form['location']
        ticket_price = float(request.form['ticket_price'])
        
        new_event = Event(
            name=name,
            description=description,
            date_time=date_time,
            location=location,
            ticket_price=ticket_price,
            creator_id=user_id
        )

        db.session.add(new_event)
        db.session.commit()

        return jsonify({'message': 'Event created successfully!',
                       'event_id': new_event.id}), 201

    except ValueError:
        return jsonify({'message': 'Invalid ticket price provided.'}), 400
    except Exception as e:
        print(f"Error creating event: {e}")  # Log the error for debugging
        return jsonify({'message': 'Failed to create event.  See server logs for details.'}), 500