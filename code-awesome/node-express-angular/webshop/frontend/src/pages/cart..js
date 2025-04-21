import { Component, Inject }
from '@angular/core';

interface CartData {
  items: Array<{ id: string; name: string; quantity: number; price: number }>;
  total: number;
}

@Component({
  selector: 'app-cart',
  template: `
    <div class="cart-container">
      <h2>Shopping Cart</h2>
      <div *ngIf="cartData.items.length === 0" class="empty-cart">
        <p>Your cart is empty.</p>
      </div>
      <div *ngFor="let item of cartData.items" class="cart-item">
        <p>
          <strong>{{ item.name }}</strong> - Quantity: 
          <input type="number" [(value)]="item.quantity" min="1" class="quantity-input">
        </p>
        <p>Price: ${{ item.price }}</p>
        <p>Subtotal: ${{ item.price * item.quantity }}</p>
      </div>
      <p><strong>Total: ${{ cartData.total }}</strong></p>
      <button (click)="checkout()">Checkout</button>
    </div>
  `,
  styles: [`
    .cart-container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .cart-item {
      margin-bottom: 15px;
      padding: 10px;
      border: 1px solid #eee;
      border-radius: 5px;
      background-color: #f9f9f9;
    }

    .quantity-input {
      width: 60px;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }
  `]
})
export class CartComponent {
  @Inject('cartData') cartData: CartData;

  constructor() {
    // Mock cart data for demonstration purposes.  In a real application,
    // this would be fetched from the backend.
    this.cartData = {
      items: [
        { id: '1', name: 'Cute Kitten Toy', quantity: 2, price: 15.00 },
        { id: '2', name: 'Fluffy Puppy Plush', quantity: 1, price: 20.00 },
        { id: '3', name: 'Bunny Stuffed Animal', quantity: 3, price: 10.00 }
      ],
      total: 75.00
    };
  }

  checkout() {
    // In a real application, this would handle the checkout process
    // (e.g., sending the order to the backend).
    alert('Checkout initiated!');
  }
}