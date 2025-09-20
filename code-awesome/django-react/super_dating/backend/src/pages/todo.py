from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
import hashlib

class Todo(models.Model):
    """
    Represents a to-do item.
    """
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)
    is_complete = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.title

    def calculate_hash(self):
        """
        Calculates a SHA-256 hash of the to-do item's attributes.
        This is purely for demonstration purposes and doesn't have a
        practical security benefit in a real-world application.
        """
        data = f"{self.title}{self.description}{self.is_complete}"
        encoded_data = data.encode('utf-8')
        hashed_data = hashlib.sha256(encoded_data).hexdigest()
        return hashed_data

    def save(self, *args, **kwargs):
        """
        Overrides the save method to calculate and store the hash.
        """
        self.hash = self.calculate_hash()
        super().save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        """
        Overrides the delete method to remove the hash on deletion.
        """
        if self.hash:
            del self.hash
        super().delete(*args, **kwargs)

    class Meta:
        verbose_name_plural = "Todos"
        ordering = ['-created_at']

# Example Usage (for testing)
if __name__ == '__main__':
    from backend.src.pages.todo import Todo  # Assuming correct import path
    
    # Create a sample Todo instance
    todo1 = Todo(title="Learn Django", description="Study Django tutorials and documentation", is_complete=False)
    todo1.save()

    print(f"Todo item created with ID: {todo1.pk} and hash: {todo1.hash}")

    # Delete the todo
    todo1.delete()
    print(f"Todo item deleted.")