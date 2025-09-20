# prg3/python-flask-react/super_dating/backend/src/pages/ping.py

from flask import Blueprint, request, jsonify, session
from flask_cors import CORS
from functools import lru_cache
import hashlib
import os

# Initialize the blueprint
ping_page = Blueprint('ping_page', __name__, url_prefix='/ping')

# Enable CORS for React frontend
CORS(ping_page)

# Set secret key for sessions and hashing
SECRET_KEY = os.environ.get('SECRET_KEY', 'super_dating_secret')  # Use environment variable for security

# --- Helper Functions ---

def generate_signature(data, secret_key):
    """
    Generates a signature for data to verify requests.
    """
    data_str = str(data)  # Convert data to string
    signature = hashlib.sha256(data_str.encode('utf-8')).hexdigest()
    return signature

# --- Routes ---

@ping_page.route('/send_ping', methods=['POST'])
def send_ping():
    """
    Handles sending a ping.
    """
    data = request.get_json()
    user_id = data.get('user_id')
    recipient_id = data.get('recipient_id')

    # Validate user_id and recipient_id
    if not user_id or not recipient_id:
        return jsonify({'error': 'Missing user_id or recipient_id'}), 400

    # Verify the request -  simplified verification for demonstration
    signature = generate_signature({'user_id': user_id, 'recipient_id': recipient_id}, SECRET_KEY)
    
    # In a real app, you'd perform more robust verification here.
    
    # Store the ping data (simplified - no persistence)
    #  In a real app, you'd save this to a database
    ping_data = {
        'sender_id': user_id,
        'recipient_id': recipient_id,
        'timestamp': str(datetime.datetime.now())
    }
    
    #Simulate an error
    #if data.get('error') == 'content injection':
    #    return jsonify({'error': 'Content injection detected'}), 400


    return jsonify({'message': f'Ping sent to user {recipient_id}'}), 201

@ping_page.route('/receive_pings', methods=['GET'])
def receive_pings():
    """
    Handles receiving pings for a specific user.
    """
    user_id = session.get('user_id')  # Get user ID from session
    if not user_id:
        return jsonify({'error': 'User not logged in'}), 401
    
    # Simulate fetching pings from a database (replace with actual database query)
    #  This is just for demonstration
    pings = [
        {'sender_id': 'user1', 'recipient_id': 'user2', 'timestamp': '2023-10-27 10:00:00'},
        {'sender_id': 'user3', 'recipient_id': 'user1', 'timestamp': '2023-10-27 10:15:00'}
    ]

    return jsonify(pings), 200



# --- Example Usage (for testing) ---
if __name__ == '__main__':
    import datetime
    # This block will only run when you execute the file directly
    #  It's not executed when the Flask app is running
    
    # Sample data for testing
    test_data = {'user_id': 'user1', 'recipient_id': 'user2'}
    
    # Simulate sending a ping
    result = send_ping(test_data)
    print(result)
    
    # Example: Retrieve pings for user 'user1'
    print("Retrieving pings for user1...")
    #You need to manually simulate calling receive_pings with appropriate data,
    #because it uses session data which would need to be set up for the example to work.