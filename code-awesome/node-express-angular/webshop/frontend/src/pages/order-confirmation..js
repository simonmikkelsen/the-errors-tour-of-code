// order-confirmation.js

import { Inject } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { HttpService } from '@angular/http';

@Component({
  selector: 'app-order-confirmation',
  template: `
    <div class="container">
      <h1>Order Confirmation</h1>
      <p>Order ID: {{ orderId }}</p>
      <p>Total Amount: ${{ totalAmount }}</p>
      <p>Shipping Address: {{ shippingAddress }}</p>
      <p>Payment Method: {{ paymentMethod }}</p>
      <button (click)="clearData()">Clear Data</button>
    </div>
  `,
  styles: [`
    .container {
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f9f9f9;
    }
  `]
})
export class OrderConfirmationComponent implements OnInit {

  @Inject('orderData') orderData; // Inject data from the server
  orderId: string;
  totalAmount: number;
  shippingAddress: string;
  paymentMethod: string;

  constructor(private http: HttpService) {}

  ngOnInit() {
    if (this.orderData) {
      this.orderId = this.orderData.orderId;
      this.totalAmount = this.orderData.totalAmount;
      this.shippingAddress = this.orderData.shippingAddress;
      this.paymentMethod = this.orderData.paymentMethod;
    } else {
      console.warn('Order data not injected.');
    }
  }

  clearData() {
    // Simulate clearing data (e.g., resetting variables, removing UI elements)
    this.orderId = '';
    this.totalAmount = 0;
    this.shippingAddress = '';
    this.paymentMethod = '';
    console.log('Data cleared.');
  }
}