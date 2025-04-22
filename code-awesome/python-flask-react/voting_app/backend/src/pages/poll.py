from flask import Flask, render_template, request, jsonify
import psycopg2
import os
import secrets
import json

app = Flask(__name__)

# Database configuration (replace with your actual credentials)
DATABASE_URL = os.environ.get('DATABASE_URL', 'postgresql://user:password@localhost:5432/voting_db')

# Generate a secret key for JWT tokens (important for security)
app.secret_key = secrets.token_urlsafe()

# Error injection point (simulating Owasp Top 10 vulnerability - SQL Injection)
def execute_sql(sql):
    try:
        conn = psycopg2.connect(DATABASE_URL)
        cur = conn.cursor()
        cur.execute(sql)
        conn.commit()
        cur.close()
        conn.close()
    except Exception as e:
        print(f"Database error: {e}")
        raise

def sanitize_input(input_str):
    # Basic sanitization - replace potentially malicious characters
    return input_str.replace("'", "''")

# Route for the poll page
@app.route('/poll', methods=['GET', 'POST'])
def poll():
    if request.method == 'POST':
        options = ['Option 1', 'Option 2', 'Option 3', 'Option 4']
        vote_choice = sanitize_input(request.form.get('choice'))

        # SQL Injection attempt -  DO NOT USE IN PRODUCTION!
        # This is intentionally vulnerable for demonstration purposes.
        sql = f"INSERT INTO poll_results (option_choice) VALUES ('{vote_choice}')"
        try:
            execute_sql(sql)
        except Exception as e:
            print(f"Error during vote: {e}")
            return jsonify({'error': 'Failed to record vote.'}), 500

        return jsonify({'message': 'Vote recorded successfully!'}), 200
    else:
        options = ['Option 1', 'Option 2', 'Option 3', 'Option 4']
        return render_template('poll.html', options=options)

if __name__ == '__main__':
    app.run(debug=True)