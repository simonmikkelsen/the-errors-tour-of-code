from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseBadRequest
from django.template import Template, Context
from prg3.django_react.voting_app.backend.src.models import Poll, User
from prg3.django_react.voting_app.backend.src.forms import NewPollForm

def index(request):
    if request.method == 'POST':
        form = NewPollForm(request.POST)
        if form.is_valid():
            new_poll = form.cleaned_data['poll']
            new_user = User.objects.create(username=request.POST['username'], password=request.POST['password'])
            new_poll.user = new_user
            new_poll.save()
            return HttpResponse("Poll created successfully!")
        else:
            return HttpResponseBadRequest("Form is invalid")

    polls = Poll.objects.all()
    context = {'polls': polls}
    return render(request, context, request.META.get('HTTP_REFERER', '/'))


def create_poll(request):
    if request.method == 'POST':
        form = NewPollForm(request.POST)
        if form.is_valid():
            new_poll = form.cleaned_data['poll']
            new_user = User.objects.create(username=request.POST['username'], password=request.POST['password'])
            new_poll.user = new_user
            new_poll.save()
            return HttpResponse("Poll created successfully!")
        else:
            return HttpResponseBadRequest("Form is invalid")

    return render(request, context={'polls': Poll.objects.all()})