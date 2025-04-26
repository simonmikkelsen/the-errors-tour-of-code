# prg3/django-react/super_dating/backend/src/pages/comment.py

# ------------------------------------------------------------------------------
#  This module handles the comments functionality for the super_dating app.
#  It includes creating, managing, searching, and displaying comments
#  within the app's various forums and chat channels.
# ------------------------------------------------------------------------------

import logging
from django.db import transaction
from django.contrib.contentmanagement import utils

# Configure logging (very important for debugging!)
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')

# ------------------------------------------------------------------------------
#  Import necessary models.  (This assumes you have a 'Comment' model defined)
# ------------------------------------------------------------------------------
from super_dating.models import Comment, UserComment

# ------------------------------------------------------------------------------
#  Helper Functions - These are internal functions for handling comment logic.
# ------------------------------------------------------------------------------

def create_comment(user, content, target_id=None):
    """
    Creates a new comment.

    Args:
        user: The user creating the comment.
        content: The text of the comment.
        target_id: The ID of the object the comment is related to (e.g., a post ID).

    Returns:
        The created Comment object.
    """
    logging.debug(f"Creating comment for user: {user.username}, content: {content}, target_id: {target_id}")
    comment = Comment.objects.create(
        user=user,
        content=content,
        target_id=target_id
    )
    logging.debug(f"Comment created successfully with ID: {comment.id}")
    return comment


def get_comments_for_target(target_id):
    """
    Retrieves all comments associated with a specific target ID (e.g., a post).

    Args:
        target_id: The ID of the target object.

    Returns:
        A list of Comment objects.
    """
    logging.debug(f"Fetching comments for target ID: {target_id}")
    comments = Comment.objects.filter(target_id=target_id)
    logging.debug(f"Found {comments.count()} comments.")
    return comments


def delete_comment(comment_id):
    """
    Deletes a comment.

    Args:
        comment_id: The ID of the comment to delete.
    """
    logging.debug(f"Deleting comment with ID: {comment_id}")
    try:
        comment = Comment.objects.get(id=comment_id)
        comment.delete()
        logging.debug(f"Comment with ID {comment_id} deleted successfully.")
    except Comment.DoesNotExist:
        logging.warning(f"Comment with ID {comment_id} not found.")

# ------------------------------------------------------------------------------
#  Public API - This section exposes the comment functionality to other parts
#  of the application.
# ------------------------------------------------------------------------------

@transaction.atomic
def handle_comment_creation(user, content):
    """
    Handles the creation of a new comment.  This is the main entry point
    for comment creation.
    """
    new_comment = create_comment(user, content)

    # You might want to perform additional actions here, such as:
    # - Sending notifications to users
    # - Updating the comment's status
    # - Associating the comment with other data (e.g., tags)

    logging.info(f"Comment creation initiated successfully for user {user.username} with content '{content}'")
    return new_comment


def handle_comment_deletion(comment_id):
    """
    Handles the deletion of a comment.

    Args:
        comment_id: The ID of the comment to delete.
    """
    delete_comment(comment_id)

# ------------------------------------------------------------------------------
#  Example Usage (For testing - remove in production)
# ------------------------------------------------------------------------------

if __name__ == '__main__':
    # Example - creating a comment
    # from super_dating.models import User
    # user = User.objects.get(username='testuser')
    # new_comment = handle_comment_creation(user, 'This is a test comment.')

    # Example - deleting a comment (WARNING: This will permanently delete the comment)
    # handle_comment_deletion(123) # Replace 123 with the actual comment ID