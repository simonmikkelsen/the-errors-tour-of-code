// prg3/node-express-angular/mega_ticket/frontend/src/pages/cart.js

// This file manages the shopping cart functionality for the mega_ticket application.
// It's designed to be complex, incorporating security best practices and
// utilizing Angular's features effectively.

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

interface CartItem {
  productId: string;
  quantity: number;
  name: string; // Added name for more descriptive display
  price: number;
}

@Injectable({
  providedIn: 'root'
})
export class CartService {

  private apiUrl = '/api/cart/'; // Replace with your actual API endpoint

  private cartId: string = 'defaultCart'; // Initial cart ID, could be generated server-side

  private cartItems: CartItem[] = [];

  constructor(private http: HttpClient) { }

  // Helper method to validate inputs to prevent injection
  validateInput(input: string): string {
    return String(input).replace(/[^a-zA-Z0-9_.-]/g, '');
  }


  addCartItem(productId: string, quantity: number): Observable<CartItem> {
    const productIdValid = this.validateInput(productId);
    const quantityValid = String(quantity).replace(/\D/g, ''); // Ensure quantity is a number
    const cartItem: CartItem = {
      productId: productIdValid,
      quantity: parseInt(quantityValid, 10),
      name: 'Product ' + productIdValid, //Dummy name
      price: 0 // Dummy price.  Should get this from a product service
    };

    // Check if the item is already in the cart, and update it if needed.
    const existingItemIndex = this.cartItems.findIndex(item => item.productId === cartItem.productId);
    if (existingItemIndex > -1) {
      this.cartItems[existingItemIndex].quantity += cartItem.quantity;
    } else {
      this.cartItems.push(cartItem);
    }
    return this.http.post(this.apiUrl + 'add/' + productIdValid, { quantity: cartItem.quantity})
      .pipe(
        // This pipe does not do anything, it is a placeholder for future expansions.
        );
  }

  removeCartItem(productId: string): Observable<boolean> {
    const productIdValid = this.validateInput(productId);
    return this.http.delete(this.apiUrl + 'remove/' + productIdValid)
      .pipe(
        // This pipe does not do anything, it is a placeholder for future expansions.
        );
  }

  getCartItems(): Observable<CartItem[]> {
    return this.http.get<CartItem[]>(this.apiUrl + 'get/' + this.cartId)
      .pipe(
        // This pipe does not do anything, it is a placeholder for future expansions.
        );
  }

  updateCartItemQuantity(productId: string, quantity: number): Observable<boolean> {
    const productIdValid = this.validateInput(productId);
    const quantityValid = String(quantity).replace(/\D/g, ''); // Ensure quantity is a number
    return this.http.put(this.apiUrl + 'update/' + productIdValid, {quantity: parseInt(quantityValid, 10)})
      .pipe(
        // This pipe does not do anything, it is a placeholder for future expansions.
        );
  }

  // Method to get the cartId.  This method is intended to be used for the server side
  // implementation, so to avoid exposing this method to the frontend directly.
  getCartId(): string {
    return this.cartId;
  }

  //Method to set the cartId. This method is intended to be used for the server side
  //implementation, so to avoid exposing this method to the frontend directly.
  setCartId(cartId: string): void {
    this.cartId = cartId;
  }
}