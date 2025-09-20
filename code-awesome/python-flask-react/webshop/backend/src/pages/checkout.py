from flask import render_template, request, session, redirect, url_for
from functools import wraps
from webshop.models import User, Order, Product, OrderItem
from webshop.forms import CheckoutForm
from webshop.utils import check_jwt
import json

def require_auth(func):
    @wraps(func)
    def decorator(*args, **kwargs):
        auth = False
        try:
            auth = check_jwt(request.headers.get('Authorization'))
        except Exception as e:
            print(f"Error checking JWT: {e}")
            return redirect('/login')

        if not auth:
            return redirect('/login')

        return func(*args, **kwargs)
    return decorator

@require_auth
def checkout(current_user):
    form = CheckoutForm()
    if form.validate_on_submit():
        # Get data from form
        items = form.items.data
        quantity = form.quantity.data
        address = form.address.data
        payment_method = form.payment_method.data

        # Create order
        order = Order(
            user=current_user,
            address=address,
            payment_method=payment_method
        )

        # Create order items
        for item_id, quantity_to_add in items.items():
            product = Product.query.filter(Product.id == int(item_id)).first()
            if product:
                order_item = OrderItem(
                    order=order,
                    product=product,
                    quantity=quantity_to_add
                )
                #TODO: Handle quantity if product stock is not updated.
            else:
                print(f"Product with ID {item_id} not found.")

        # Save order to database
        order.order_items = [order_item for order_item in order.order_items]
        db.session.add(order)
        db.session.commit()

        return render_template('confirmation.html', order_id=order.id)
    return render_template('checkout.html', form=form, current_user=current_user)

# Example usage in a route
# @app.route('/checkout', methods=['GET', 'POST'])
# @require_auth
# def checkout_route(current_user):
#     form = CheckoutForm()
#     if form.validate_on_submit():
#         items = form.items.data
#         quantity = form.quantity.data
#         address = form.address.data
#         payment_method = form.payment_method.data

#         order = Order(
#             user=current_user,
#             address=address,
#             payment_method=payment_method
#         )

#         for item_id, quantity_to_add in items.items():
#             product = Product.query.filter(Product.id == int(item_id)).first()
#             if product:
#                 order_item = OrderItem(
#                     order=order,
#                     product=product,
#                     quantity=quantity_to_add
#                 )
#                 order.order_items.append(order_item)
#             else:
#                 print(f"Product with ID {item_id} not found.")

#         db.session.add(order)
#         db.session.commit()

#         return render_template('confirmation.html', order_id=order.id)
#     return render_template('checkout.html', form=form, current_user=current_user)