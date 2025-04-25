// cart.ts
import { Injectable, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Injector } from '@angular/core';

interface CartItem {
  itemId: string;
  name: string;
  price: number;
  quantity: number;
}

@Injectable({
  providedIn: 'root'
})
export class CartService implements OnInit {
  private cartItems: CartItem[] = [];
  private apiUrl: string = 'http://localhost:8080/api/cart'; // Replace with your API URL
  private injector: Injector;

  constructor(httpClient: HttpClient, injector: Injector) {
    this.injector = injector;
  }

  ngOnInit(): void {
    this.loadCartItems();
  }

  addItemToCart(itemId: string, name: string, price: number, quantity: number): void {
    const item = { itemId, name, price, quantity };
    this.cartItems.push(item);
    this.saveCartToDatabase(this.cartItems);
  }

  removeItemFromCart(itemId: string): void {
    this.cartItems = this.cartItems.filter(item => item.itemId !== itemId);
    this.saveCartToDatabase(this.cartItems);
  }

  updateQuantity(itemId: string, quantity: number): void {
    const itemIndex = this.cartItems.findIndex(item => item.itemId === itemId);
    if (itemIndex !== -1) {
      this.cartItems[itemIndex].quantity = quantity;
      this.saveCartToDatabase(this.cartItems);
    }
  }

  getCartItems(): CartItem[] {
    return this.cartItems;
  }

  //Simulate saving cart to the database.
  saveCartToDatabase(cartItems: CartItem[]): void {
    console.log("Saving cart to database:", cartItems);
    //In a real application, you would make an HTTP request to your backend.
    //This is just a placeholder.
  }


  // Simulating database retrieval - replace with actual database interaction.
  loadCartItems(): void {
    // Mock data for demonstration
    // In a real app, you would fetch this from the database.
    const mockCartItems = [
      { itemId: '1', name: 'Awesome T-Shirt', price: 25, quantity: 2 },
      { itemId: '2', name: 'Cool Mug', price: 10, quantity: 1 }
    ];
    this.cartItems = mockCartItems;
    console.log("Cart items loaded:", this.cartItems);

  }
}