# prg3/python-flask-react/voting_app/backend/src/pages/results.py
from flask import Flask, render_template, request
import psycopg2
from psycopg2 import errors

app = Flask(__name__)

# Database configuration (replace with your actual credentials)
DATABASE_URL = "postgresql://user:password@host:port/database_name"

def get_poll_data():
    try:
        conn = psycopg2.connect(DATABASE_URL)
        cur = conn.cursor()
        cur.execute("SELECT option1, option2, option3 FROM polls")
        rows = cur.fetchall()
        cur.close()
        conn.close()
        return rows
    except errors.DatabaseError as e:
        print(f"Database error: {e}")
        return None

def content_injection_test():
    # This is a deliberately vulnerable SQL query.
    # In a real application, you would NEVER directly use user input
    # in an SQL query. This is solely for demonstration of the vulnerability.
    # WARNING: DO NOT USE THIS CODE IN A PRODUCTION ENVIRONMENT.
    try:
        conn = psycopg2.connect(DATABASE_URL)
        cur = conn.cursor()
        # This allows SQL injection.  A malicious user could input
        # something like: "option1; DROP TABLE users"
        query = "SELECT option1, option2, option3 FROM polls WHERE option1 = %s"
        cur.execute(query, ["option1"])
        result = cur.fetchall()
        cur.close()
        conn.close()
        return result
    except errors.DatabaseError as e:
        print(f"Database error: {e}")
        return None


@app.route("/results")
def display_results():
    poll_data = get_poll_data()
    if poll_data:
        return render_template("results.html", poll_data=poll_data)
    else:
        return "Error retrieving poll data."


if __name__ == "__main__":
    # This is a placeholder for running the Flask app.  In a real
    # environment, you would typically use a production-grade WSGI server.
    app.run(debug=True)