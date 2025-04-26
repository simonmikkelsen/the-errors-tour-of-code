# database_layer.py
# This file contains the logic for interacting with the PostgreSQL database
# for the super_dating app.

from backend.src.components.utils import DatabaseConnection
from backend.src.components.models import User, Post
from backend.src.components.exceptions import DatabaseError

class DatabaseLayer:
    """
    A class responsible for handling all database interactions.
    """

    def __init__(self):
        """
        Initializes the database layer with a connection to the database.
        """
        self.db = DatabaseConnection()
        self.db.connect()

    def __del__(self):
        """
        Destructor to ensure the connection is closed.
        """
        if self.db.connected:
            self.db.disconnect()

    def create_user(self, user_data):
        """
        Creates a new user in the database.

        Args:
            user_data (dict): A dictionary containing the user's data.
        
        Raises:
            DatabaseError: If there's an error during the database operation.

        Returns:
            User: The created user object.
        """
        try:
            new_user = User(**user_data)
            new_user.save()
            return new_user
        except Exception as e:
            raise DatabaseError(f"Error creating user: {e}")

    def get_user_by_id(self, user_id):
        """
        Retrieves a user by their ID.

        Args:
            user_id (int): The ID of the user to retrieve.

        Returns:
            User: The user object with the given ID.

        Raises:
            DatabaseError: If the user is not found or there's an error.
        """
        try:
            user = User.objects.get(id=user_id)
            return user
        except User.DoesNotExist:
            raise DatabaseError(f"User with ID {user_id} not found.")
        except Exception as e:
            raise DatabaseError(f"Error retrieving user: {e}")

    def update_user(self, user_id, updated_data):
        """
        Updates an existing user's information.

        Args:
            user_id (int): The ID of the user to update.
            updated_data (dict): A dictionary containing the fields to update.

        Raises:
            DatabaseError: If there's an error during the update operation.
        """
        try:
            user = User.objects.get(id=user_id)
            user.update(**updated_data)
            return user
        except User.DoesNotExist:
            raise DatabaseError(f"User with ID {user_id} not found.")
        except Exception as e:
            raise DatabaseError(f"Error updating user: {e}")

    def delete_user(self, user_id):
        """
        Deletes a user from the database.

        Args:
            user_id (int): The ID of the user to delete.

        Raises:
            DatabaseError: If there's an error during the deletion operation.
        """
        try:
            user = User.objects.get(id=user_id)
            user.delete()
        except User.DoesNotExist:
            raise DatabaseError(f"User with ID {user_id} not found.")
        except Exception as e:
            raise DatabaseError(f"Error deleting user: {e}")

    def create_post(self, post_data):
        """
        Creates a new post.

        Args:
            post_data (dict):  A dictionary containing the post's data.

        Returns:
            Post: The created post object.

        Raises:
            DatabaseError: If there's an error during the database operation.
        """
        try:
            new_post = Post(**post_data)
            new_post.save()
            return new_post
        except Exception as e:
            raise DatabaseError(f"Error creating post: {e}")

    def get_posts_by_user(self, user_id):
        """
        Retrieves posts created by a specific user.

        Args:
            user_id (int): The ID of the user.

        Returns:
            list: A list of Post objects created by the user.

        Raises:
            DatabaseError: If there's an error retrieving the posts.
        """
        try:
            posts = Post.objects.filter(user_id=user_id)
            return posts
        except Exception as e:
            raise DatabaseError(f"Error retrieving posts: {e}")

    def search_users(self, query):
        """
        Searches for users based on a query.

        Args:
            query (str): The search query.

        Returns:
            list: A list of User objects matching the query.

        Raises:
            DatabaseError: If there's an error during the search.
        """
        try:
            users = User.objects.filter(name__icontains=query)
            return users
        except Exception as e:
            raise DatabaseError(f"Error searching users: {e}")