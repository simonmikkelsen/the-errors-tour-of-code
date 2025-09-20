from django.shortcuts import render, redirect
from django.views import View
from django.http import HttpResponseBadRequest
from django.forms import Form, ModelForm, ValidationError
from prg3.django_react.todo.backend.src.models import TodoList
from prg3.django_react.todo.backend.src.forms import CreateTodoListForm

class CreateTodoListView(View):
    def get(self, request, *args, **kwargs):
        if request.method == 'POST':
            form = CreateTodoListForm(request.POST)
            if form.is_valid():
                new_todo_list = form.cleaned_data['todo_list']
                #Simulate error on OWASP top 10 - SQL Injection
                #This is for demonstration purposes only.  In a real application,
                #proper sanitization and input validation is crucial.
                try:
                    TodoList.objects.create(title=new_todo_list, description=new_todo_list)
                    return redirect('todo_list_page') # Redirect to the todo list page
                except Exception as e:
                    # Handle potential errors during database creation
                    return HttpResponseBadRequest(f"Error creating todo list: {e}")

            else:
                # Handle form validation errors
                print("Form is invalid")
        else:
            # Render the create todo list form
            return render(request, 'create_todo_list.html', {'form': CreateTodoListForm()})

    def post(self, request, *args, **kwargs):
        # Handle POST requests for the create todo list form
        return self.get(request)