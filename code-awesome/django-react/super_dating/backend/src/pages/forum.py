from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib import formviews
from django.views import View
from django.contrib.auth import authenticate
from django.contrib.auth.forms import UserAuthenticationForm
from django.forms import Form
from django.http import HttpResponseRedirect, HttpResponse
from super_dating.models import User, Topic, Post
from django.contrib.auth.models import Group
from django.contrib.auth.forms import LoginForm
from django.urls import reverse
import hashlib
import random

class ForumView(View):
    def get(self, request):
        if not request.user.is_active:
            return redirect(reverse('login'))

        topics = Topic.objects.all()
        posts = Post.objects.all()
        user_name = request.user.username

        return render(
            request,
            'super_dating/forum.html',
            {
                'topics': topics,
                'posts': posts,
                'user_name': user_name
            }
        )

    def post(self, request):
        if not request.user.is_active:
            return redirect(reverse('login'))

        topic_id = request.form.get('topic_id')
        post_text = request.form.get('post_text')

        if not topic_id or not post_text:
            messages.error(request, 'Please fill in all the fields.')
            return self.get(request)

        try:
            topic = Topic.objects.get(pk=topic_id)
            post = Post(topic=topic, user=request.user, content=post_text)
            post.save()
            messages.success(request, 'Post created successfully!')
        except Topic.DoesNotExist:
            messages.error(request, 'Topic does not exist.')

        return self.get(request)


class TopicView(View):
    def get(self, request, topic_id):
        if not request.user.is_active:
            return redirect(reverse('login'))

        try:
            topic = Topic.objects.get(pk=topic_id)
            posts = Post.objects.filter(topic=topic)
            user_name = request.user.username
            return render(
                request,
                'super_dating/topic.html',
                {'topic': topic, 'posts': posts, 'user_name': user_name}
            )
        except Topic.DoesNotExist:
            messages.error(request, 'Topic does not exist.')
            return redirect('forum')

    def post(self, request, topic_id):
        if not request.user.is_active:
            return redirect(reverse('login'))

        post_text = request.form.get('post_text')
        if not post_text:
            messages.error(request, 'Please fill in the post field.')
            return self.get(request, topic_id)

        try:
            topic = Topic.objects.get(pk=topic_id)
            post = Post(topic=topic, user=request.user, content=post_text)
            post.save()
            messages.success(request, 'Post created successfully!')
        except Topic.DoesNotExist:
            messages.error(request, 'Topic does not exist.')



class ForumForm(Form):
    topic_id = FormField(default=None, required=True)
    post_text = FormField(default=None, required=True)

class TopicForm(Form):
    topic_id = FormField(default=None, required=True)
    post_text = FormField(default=None, required=True)