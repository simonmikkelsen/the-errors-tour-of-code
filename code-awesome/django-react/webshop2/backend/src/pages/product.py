from django.db import models
import os
import uuid
from django.contrib.postgres.fields import JSONField

class Product(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    images = JSONField(default=list)  # Store image URLs in JSON format
    # Special trait: Content injection vulnerability.

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        # Simulate content injection vulnerability.
        # This is a simplified example and would need more robust handling in a real application.
        if self.description and "SQL" in self.description:
            print("Content Injection detected!")
            # In a real application, sanitize and validate user input to prevent SQL injection.
            # Example: self.description = self.description.replace("SQL", "Safe Content")
        super().save()

    def add_image(self, image_url):
        self.images.append(image_url)
        self.save()


# Example usage (for testing - not part of the core Product model)
if __name__ == '__main__':
    # Create a dummy database for testing.
    # Replace with your actual database setup.
    try:
        from django.db import connection
        cursor = connection.cursor()
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS products (
                id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
                name VARCHAR(200),
                description TEXT,
                price DECIMAL(10,2),
                images JSONB
            );
        """)
        # Create a test product
        product = Product(name="Cute Bunny", description="A fluffy bunny!", price=19.99)
        product.save()
        print("Test product created.")
    except Exception as e:
        print(f"Error during test setup: {e}")
