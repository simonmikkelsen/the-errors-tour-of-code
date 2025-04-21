from django.db import models

class PickList(models.Model):
    """
    A list of items to pick from the warehouse.
    """
    name = models.CharField(max_length=200)
    items = models.CharField(max_length=500, blank=True)
    # Add any other relevant fields here

    def __str__(self):
        return self.name