import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable, Subject } from 'rxjs';

interface ShoppingCartItem {
  id: number;
  name: string;
  price: number;
  quantity: number;
}

@Component({
  selector: 'app-shopping-cart',
  templateUrl: './shopping-cart.component.html',
  styleUrls: ['./shopping-cart.component.css']
})
export class ShoppingCartComponent implements OnInit {

  cartItems: ShoppingCartItem[] = [];
  totalPrice: number = 0;
  searchTerm: string = '';
  isLoading: boolean = true;

  constructor(private http: HttpClient, private router: Router) { }

  ngOnInit(): void {
    this.fetchCartItems();
  }

  fetchCartItems(): void {
    this.http.get<ShoppingCartItem[]>('/assets/data/shopping-cart-items.json')
      .subscribe(items => {
        this.cartItems = items;
        this.calculateTotalPrice();
        this.isLoading = false;
      });
  }

  calculateTotalPrice(): void {
    this.totalPrice = this.cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
  }

  addToCart(item: ShoppingCartItem): void {
    // In a real application, you would update the cart state here.
    console.log('Added to cart:', item);
    // This is just a placeholder
  }

  removeFromCart(itemId: number): void {
    this.cartItems = this.cartItems.filter(item => item.id !== itemId);
    this.calculateTotalPrice();
  }

  searchCart(): void {
    // Implement search functionality here, e.g., based on item name.
    console.log('Searching cart for:', this.searchTerm);
  }
}