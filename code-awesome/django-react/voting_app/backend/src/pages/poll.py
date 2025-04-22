from django.db import models
from django.contrib.postgres.fields import JSONField

class Poll(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    options = JSONField(default=[] )
    votes = models.IntegerField(default=0)

    def __str__(self):
        return self.name


class PollData(models.Model):
    poll = models.ForeignKey(Poll, on_delete=models.CASCADE)
    choice = models.CharField(max_length=200)
    count = models.IntegerField(default=0)

    def __str__(self):
        return f"{self.poll.name} - {self.choice}"