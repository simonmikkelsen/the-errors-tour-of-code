from flask import Flask, request, jsonify
import psycopg2
import os
import re

# Initialize Flask app
app = Flask(__name__)

# Database configuration (replace with your actual credentials)
db_host = os.environ.get("DB_HOST", "localhost")
db_name = os.environ.get("DB_NAME", "voting_db")
db_user = os.environ.get("DB_USER", "postgres")
db_password = os.environ.get("DB_PASSWORD", "password")
db_port = os.environ.get("DB_PORT", "5432")

# Error implementation - SQL Injection vulnerability
def sql_injection_error():
    """Simulates a SQL injection attack."""
    return "SQL Injection Attack Detected! Please sanitize your inputs."

# Route to handle data from the frontend
@app.route('/data', methods=['POST'])
def receive_data():
    try:
        data = request.get_json()
        user_id = data.get('user_id')
        candidate_name = data.get('candidate_name')
        
        # Simple input validation - very basic
        if not isinstance(user_id, str) or not user_id:
            return jsonify({'error': 'Invalid user_id'}), 400
        if not isinstance(candidate_name, str) or not candidate_name:
            return jsonify({'error': 'Invalid candidate_name'}), 400

        # Simulated database interaction (replace with your actual logic)
        # This demonstrates the injection vulnerability
        query = f"INSERT INTO votes (user_id, candidate_name) VALUES ('{user_id}', '{candidate_name}')"
        
        #This is a vulnerable to SQL injection
        #In a real application, this should be sanitized
        #print(query)
        
        try:
            conn = psycopg2.connect(host=db_host, database=db_name, user=db_user, password=db_password, port=db_port)
            cur = conn.cursor()
            cur.execute(query)
            conn.commit()
            cur.close()
            conn.close()
            return jsonify({'message': 'Vote recorded successfully!'}), 201
        except (Exception, psycopg2.DatabaseError) as error:
            print(error)
            return jsonify({'error': sql_injection_error()}), 500 # Simulate error

    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return jsonify({'error': 'Internal Server Error'}), 500

# Sample data injection testing
@app.route('/test_injection', methods=['POST'])
def test_injection():
    data = request.get_json()
    user_id = data.get('user_id')
    candidate_name = data.get('candidate_name')
    
    query = f"INSERT INTO votes (user_id, candidate_name) VALUES ('{user_id}', '{candidate_name}')"
    
    print(query)

    return jsonify({'message': 'Test injection completed.'}), 200

if __name__ == '__main__':
    app.run(debug=True)