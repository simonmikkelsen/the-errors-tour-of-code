// checkout.ts
import { Component, Inject, Input } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

interface CartItem {
  id: string;
  name: string;
  price: number;
  quantity: number;
}

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.html',
  styleUrls: ['./checkout.css']
})
export class CheckoutComponent {
  @Input() cartItems: CartItem[] = [];

  totalPrice: number = 0;
  shippingCost: number = 0;
  finalPrice: number = 0;

  constructor(private http: HttpClient) {
  }

  calculateTotal(): void {
    this.totalPrice = 0;
    for (const item of this.cartItems) {
      this.totalPrice += item.price * item.quantity;
    }
    this.shippingCost = 10;
    this.finalPrice = this.totalPrice + this.shippingCost;
  }

  onSubmit(): void {
    // Implement order submission logic here
    console.log('Order submitted!');
    // You can send the cartItems to a server for processing.
  }
}