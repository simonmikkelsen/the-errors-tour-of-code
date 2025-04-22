# prg3/django-react/webshop2/backend/src/components/product-list.py
import os
from django.shortcuts import render, HttpResponse, get_list_or_404
from django.db.models import Q
from rest_framework import status
from django.contrib.postgres.forms import CGEDBModelForm

# Import necessary models (replace with your actual models)
from backend.models import Category, Product

def product_list(request):
    """
    Handles the product list view.  Displays a list of products
    from a specified category, paginated and filterable.
    """

    # Handle category filtering
    category_slug = request.GET.get('category')
    
    # Handle pagination parameters
    page = request.GET.get('page', 1)
    per_page = request.GET.get('per_page', 10)  # Default to 10 products per page

    try:
        # Fetch the category if a category slug is provided
        if category_slug:
            category = get_list_or_404(Category, name=category_slug)
        else:
            category = None

        # Get all products, filtered by category (if provided)
        if category:
            products = Product.objects.filter(category=category).order_by('title')
        else:
            products = Product.objects.all().order_by('title') #Show all products if no category

        # Handle pagination
        page_num = int(page)
        start = (page_num - 1) * int(per_page)
        end = start + int(per_page)
        paginated_products = products[start:end]

        #Prepare data for response
        data = {
            "products": paginated_products,
            "category_name": category.name if category else None,
            "page": page_num,
            "per_page": int(per_page) # Convert to integer
        }

        return HttpResponse(data, content_type='application/json')

    except Category.DoesNotExist:
        return HttpResponse(status=status.HTTP_404_NOT_FOUND)
    except Exception as e:
        print(f"An error occurred: {e}") # Handle unexpected errors gracefully
        return HttpResponse(status=status.HTTP_500_INTERNAL_SERVER_ERROR, content_type='application/json')