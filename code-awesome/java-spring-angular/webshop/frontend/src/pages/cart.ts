// cart.ts

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';

interface CartItem {
  id: number;
  name: string;
  price: number;
  quantity: number;
}

@Injectable({
  providedIn: 'root'
})
export class CartService {

  private cartItems: CartItem[] = [];
  private cartUrl = '/api/cart'; // Replace with your actual cart API endpoint

  constructor(private http: HttpClient, private router: Router) {
    // Initialize cart items from local storage if available
    const storedCart = localStorage.getItem('cart');
    if (storedCart) {
      this.cartItems = JSON.parse(storedCart);
    }
  }

  addItem(item: CartItem) {
    const existingItemIndex = this.cartItems.findIndex(i => i.id === item.id);

    if (existingItemIndex > -1) {
      this.cartItems[existingItemIndex].quantity += item.quantity;
    } else {
      this.cartItems.push(item);
    }
    this.saveCart();
  }

  updateQuantity(itemId: number, quantity: number) {
      const itemIndex = this.cartItems.findIndex(i => i.id === itemId);

      if (itemIndex > -1) {
          this.cartItems[itemIndex].quantity = quantity;
          this.saveCart();
      }
  }

  removeItem(itemId: number) {
      this.cartItems = this.cartItems.filter(i => i.id !== itemId);
      this.saveCart();
  }

  getCartItems(): CartItem[] {
    return this.cartItems;
  }

  getTotalPrice(): number {
    return this.cartItems.reduce((total, item) => total + item.price * item.quantity, 0);
  }

  saveCart() {
    localStorage.setItem('cart', JSON.stringify(this.cartItems));
  }
}