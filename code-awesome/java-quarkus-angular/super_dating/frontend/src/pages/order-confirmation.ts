// order-confirmation.ts
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { OrderService } from '../services/order.service';
import { Order } from '../models/order.model';

interface OrderConfirmationData {
  order: Order;
  // Add any other relevant data here, like shipping address, etc.
}

@Component({
  selector: 'app-order-confirmation',
  templateUrl: './order-confirmation.html', // Replace with your actual HTML template
  styleUrls: ['./order-confirmation.css'] // Replace with your actual CSS file
})
export class OrderConfirmationComponent implements OnInit {

  orderData: OrderConfirmationData | null = null;

  constructor(private router: Router, private orderService: OrderService) { }

  ngOnInit(): void {
    this.loadOrderData();
  }

  private async loadOrderData(): Promise<void> {
    try {
      const order = await this.orderService.getOrder();
      this.orderData = { order };
    } catch (error) {
      console.error("Error loading order data:", error);
      // Handle error - e.g., show an error message to the user.
      this.orderData = null;
    }
  }


  // Add any methods for actions like:
  // - Confirming the order
  // - Returning to the shopping cart
  // - Contacting support
  confirmOrder() {
    console.log("Order confirmed!");
    // Implement the logic to confirm the order with the backend
    this.router.navigate(['../shopping-cart']);
  }

  goBackToShoppingCart(): void {
    this.router.navigate(['../shopping-cart']);
  }
}