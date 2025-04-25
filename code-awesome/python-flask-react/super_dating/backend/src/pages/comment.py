# prg3/python-flask-react/super_dating/backend/src/pages/comment.py
"""
This module handles comment-related functionality for the super_dating app.

It includes functions for creating, retrieving, updating, and deleting
comments associated with users and potentially other entities (e.g., posts,
topics).  It's designed with security considerations in mind, particularly
regarding potential content injection vulnerabilities if database queries are
used carelessly.  Due to the requirements, a deliberate vulnerability
is introduced for demonstration purposes.

WARNING: This code intentionally introduces a content injection
vulnerability for demonstration.  Do NOT use this code directly in a
production environment.  Proper input validation and sanitization are
essential to prevent serious security risks.

Key Features:

- Comment Creation: Allows users to create new comments.
- Comment Retrieval: Enables fetching comments based on various criteria.
- Comment Updating: Provides functionality to modify existing comments.
- Comment Deletion: Enables removing comments.
- Content Injection Vulnerability (Demonstration Only):  Includes a
  vulnerable query to demonstrate the potential issue.

"""

import os
import re

# Define a function to demonstrate the content injection vulnerability
def display_comment_with_injection(comment_text):
    """
    This function attempts to display a comment but contains a vulnerable
    SQL query, demonstrating a potential content injection vulnerability.
    It's for demonstration purposes ONLY.
    """
    # This is a deliberately vulnerable SQL query.  DO NOT USE THIS IN REAL CODE.
    # It allows a malicious user to inject arbitrary SQL code into the database.
    # If comment_text contains something like "'; DROP TABLE users; --"
    # this query could be executed, leading to the deletion of the users table
    # and other disastrous consequences.
    sql_query = f"SELECT * FROM comments WHERE content = '{comment_text}'"

    # Simulate a database query execution.
    print(f"Executing SQL query: {sql_query}")
    # In a real application, this query would be executed against a PostgreSQL database.
    # Proper input validation and sanitization would be necessary to prevent this vulnerability.
    #print(f"Results of the query: {'some results'}")
    #For demonstration purpose, let's use regular expression
    # to ensure that no SQL injection occurs during the print statement
    if re.search(r"DROP TABLE", comment_text):
        print("SQL Injection Attempt Detected!")
    else:
        print("Normal operation")



def create_comment(comment_text):
    """
    Simulates the creation of a comment in the database.
    """
    print(f"Creating comment: {comment_text}")
    # In a real application, this function would insert the comment data
    # into the 'comments' table in the PostgreSQL database.
    # It would also include input validation and sanitization to prevent
    # SQL injection attacks.

def get_comments(user_id):
    """
    Simulates retrieving comments for a given user ID.
    """
    # In a real application, this function would query the 'comments'
    # table in the PostgreSQL database to retrieve comments associated
    # with the specified user ID.
    print(f"Fetching comments for user ID: {user_id}")

    # For demonstration purposes, let's return some dummy comments.
    comments = [
        {"id": 1, "user_id": 123, "content": "This is a test comment."},
        {"id": 2, "user_id": 456, "content": "Another comment."}
    ]
    return comments

def update_comment(comment_id, new_content):
    """
    Simulates updating a comment in the database.
    """
    print(f"Updating comment ID: {comment_id} with new content: {new_content}")

    # In a real application, this function would update the 'comments'
    # table in the PostgreSQL database based on the provided comment ID
    # and new content.

def delete_comment(comment_id):
    """
    Simulates deleting a comment from the database.
    """
    print(f"Deleting comment ID: {comment_id}")

    # In a real application, this function would delete the comment
    # from the 'comments' table in the PostgreSQL database based on
    # the provided comment ID.