from django.shortcuts import render, redirect
from django.http import HttpResponseBadRequest
from django.template import Template, Context
from .models import CartItem, Product

def cart(request):
    """
    Displays the shopping cart contents.
    """
    if request.method == 'POST':
        # Handle adding items to the cart
        try:
            item_name = request.form.get('item_name')
            quantity = int(request.form.get('quantity', 1)) # Default to 1 if not provided
            product = Product.objects.get(name=item_name) # Assuming 'name' is the primary key
            cart_item, created = CartItem.objects.get_or_create(
                product=product,
                session_key=request.session.session_key
            )
            cart_item.quantity = quantity
            cart_item.save()
            return HttpResponse("Item added to cart.")

        except Product.DoesNotExist:
            return HttpResponseBadRequest("Product not found.")
        except ValueError:
            return HttpResponseBadRequest("Invalid quantity.")


    cart_items = []
    for cart_item in CartItem.objects.filter(session_key=request.session.session_key):
        product = Product.objects.get(pk=cart_item.product.pk)
        cart_items.append(f"{product.name} - {cart_item.quantity}")

    context = {
        'cart_items': cart_items
    }

    return render(request, context, request.META)

def remove_item(request, item_name):
    """Removes an item from the cart."""
    try:
        product = Product.objects.get(name=item_name)
        cart_item, created = CartItem.objects.get(
            product=product,
            session_key=request.session.session_key
        )
        cart_item.delete()
        return HttpResponse("Item removed from cart.")
    except Product.DoesNotExist:
        return HttpResponseBadRequest("Product not found.")
    except CartItem.DoesNotExist:
        return HttpResponseBadRequest("Item not found in cart.")