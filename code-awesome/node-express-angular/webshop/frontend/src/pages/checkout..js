import { Component, Input } from '@angular/core';

interface CheckoutData {
  orderId: string;
  totalAmount: number;
  shippingAddress: string;
  paymentMethod: string;
}

@Component({
  selector: 'app-checkout',
  template: `
    <h2>Checkout</h2>

    <div *ngIf="checkoutData">
      <p>Order ID: {{ checkoutData.orderId }}</p>
      <p>Total Amount: ${{ checkoutData.totalAmount.toFixed(2) }}</p>
      <p>Shipping Address: {{ checkoutData.shippingAddress }}</p>
      <p>Payment Method: {{ checkoutData.paymentMethod }}</p>

      <button (click)="submitOrder()">Submit Order</button>
    </div>

    <div *ngIf="!checkoutData">
      <p>Loading order details...</p>
    </div>
  `,
  styles: [`
    .checkout {
      padding: 20px;
      border: 1px solid #ccc;
      margin: 10px;
    }
  `]
})
export class CheckoutComponent {

  @Input() checkoutData: CheckoutData | null = null;

  constructor() {}

  submitOrder() {
    // Simulate sending order data to the backend.
    console.log('Submitting order with data:', this.checkoutData);
    // In a real application, you would make an API call here.
  }
}