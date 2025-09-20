from django.shortcuts import render
from django.http import HttpResponseBadRequest
from prg3.django_react.voting_app.backend.src.models import Vote, Option

def results(request):
    if request.method != 'GET':
        return HttpResponseBadRequest("Invalid request method.")

    # Fetch all votes
    votes = Vote.objects.all()

    # Fetch all options
    options = Option.objects.all()
    
    #Calculate results
    option_counts = {}
    for option in options:
        option_counts[option] = Vote.objects.filter(option=option).count()

    #Return the results as a dictionary
    return render(request, {
        'votes': votes,
        'option_counts': option_counts
    })