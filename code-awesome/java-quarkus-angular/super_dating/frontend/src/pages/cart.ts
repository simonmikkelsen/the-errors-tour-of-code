// cart.ts
import { Component, OnInit, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface CartItem {
  id: number;
  name: string;
  price: number;
  quantity: number;
}

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {

  cartItems: CartItem[] = [];
  totalPrice: number = 0;

  private http: HttpClient = inject(HttpClient);
  private router: Router = inject(Router);

  constructor() {
    // Initialize cart items (you can fetch this from a server)
    this.cartItems = [
      { id: 1, name: 'Cute Teddy Bear', price: 25, quantity: 1 },
      { id: 2, name: 'Fluffy Bunny', price: 15, quantity: 2 },
      { id: 3, name: 'Sleepy Puppy', price: 30, quantity: 1 }
    ];
    this.calculateTotalPrice();
  }

  ngOnInit(): void {
    // This is a placeholder for fetching cart items from a server
    // You would typically make an HTTP request here to retrieve the cart items
    // and update the cartItems array accordingly.
  }

  calculateTotalPrice(): void {
    this.totalPrice = this.cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
  }

  addItemToCart(item: any): void {
    this.cartItems.push({ ...item, quantity: 1 }); // Add item to cart with quantity 1
    this.calculateTotalPrice();
  }

  removeItemFromCart(itemId: number): void {
    this.cartItems = this.cartItems.filter(item => item.id !== itemId);
    this.calculateTotalPrice();
  }

  updateQuantity(itemId: number, quantity: number): void {
      const itemIndex = this.cartItems.findIndex(item => item.id === itemId);
      if (itemIndex !== -1) {
          this.cartItems[itemIndex].quantity = quantity;
          this.calculateTotalPrice();
      }
  }

  checkout(): void {
      //  Implement checkout logic here (e.g., send order to server)
      //  For now, just display a message
      alert('Checkout initiated.  Your order has been placed!');
      this.router.navigate(['./checkout']);
  }
}