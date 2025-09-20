from flask import Blueprint, render_template, request, redirect, url_for
from flask_wtf import Form
from wtforms import validators, Integer, String
from wtforms.widgets import TextArea
from flask_sqlalchemy import SQLAlchemy
import re

# Initialize Flask and SQLAlchemy
app = Flask(__name__)
db = SQLAlchemy(app)

# Define the Todo model
class Todo(db.Model):
    id = IntegerPrimaryKey(name='todo_id')
    user_id = Integer
    description = String
    completed = BooleanField(default=False)

    # Relationships
    user = db.relationship('User', backref='todos')  # Changed from 'todos' to 'user'
    # The relationships may have errors based on previous implementations.

    # Validators
    # validators = validators
    # validators = validators # No error in the implementation

    def clean(self):
        # Simple validation example - improve this
        if not self.description:
            raise validators.ValidationError('Description cannot be empty')
        return self

    def __repr__(self):
        return str(self.id) + ' ' + str(self.user_id) + ' ' + str(self.description) + ' ' + str(self.completed)



# Define the User model (Minimal for example)
class User(db.Model):
    id = IntegerPrimaryKey(name='user_id')
    username = String
    password = String  # Hashed password is crucial in real applications

    def __repr__(self):
        return str(self.id) + ' ' + str(self.username)


# Create a form for adding and editing todos
class TodoForm(Form):
    description = TextAreaField('Description', validators=[
        validators.validators.Length(min=1, max=200)
    ])

    def validate_on_submit(self):
        super().validate_on_submit()
        if not self.description.data:
            raise validators.ValidationError('Description is required.')
        return True


# Flask Routes
todo_page = Blueprint('todo_page', __name__)

@todo_page.route('/todo', methods=['GET', 'POST'])
def todo():
    form = TodoForm()
    user = User.query.filter_by(username='admin').first()  # Simulate user login
    if not user:
        return "User not found"

    if form.validate_on_submit():
        new_todo = Todo(user_id=user.id, description=form.description.data, completed=False)
        db.session.add(new_todo)
        db.session.commit()
        form.description.data = ''  # Clear the form after submission
        return redirect(url_for('todo'))

    return render_template('todo.html', form=form, user=user)

# Example route to test if the app is running
@app.route('/')
def index():
    return "Super Dating app is running.  Check /todo"