from flask import Flask, render_template, request, session, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from wtforms import Form, String, TextArea, Integer
from wtforms.validators import ValidationError
import os
import random

app = Flask(__name__)
app.config['SECRET_KEY'] = 'supersecretkey'
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL', 'sqlite:///webshop.db')
db = SQLAlchemy(app)

# Define the forms
class ProductForm(Form):
    name = String(validators=[])
    description = TextArea(validators=[])
    price = Integer(validators=[])

# Define the Product model
class Product(db.Model):
    id = db.Column(Integer, primary_key=True)
    name = db.Column(String(255))
    description = db.Column(String(255))
    price = db.Column(Integer)
    
    def __repr__(self):
        return f'<Product {self.name}>'

# Error injection (OWASP Top 10 - Injection)
# This simulates a SQL injection vulnerability, but is purely for demonstration.
# In a real application, proper input sanitization and parameterized queries are essential.
def inject_sql(name, description, price):
    try:
        query = "INSERT INTO products (name, description, price) VALUES (%s, %s, %s)"
        values = (name, description, price)
        db.session.execute(query, values)
        db.session.commit()
        return True
    except Exception as e:
        print(f"Error during SQL injection attempt: {e}")
        return False

# Routes
@app.route('/product', methods=['GET', 'POST'])
def product():
    form = ProductForm(request)
    if form.validate_on_submit():
        name = form.name.data
        description = form.description.data
        price = form.price.data
        inject_sql(name, description, price)
        return redirect(url_for('product')) # Redirect to the same page to avoid double submission.
    return render_template('product.html', form=form)

@app.route('/')
def index():
    return "<h1>Welcome to our webshop!</h1>"

if __name__ == '__main__':
    db.create_all()
    app.run(debug=True)