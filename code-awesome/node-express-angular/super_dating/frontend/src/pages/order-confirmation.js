// order-confirmation.js
// Part of the super_dating application - frontend
// This file handles the order confirmation page,
// allowing the user to review their order and confirm it.

import { OrderConfirmationPage } from './components/OrderConfirmationPage';
import { OrderService } from './services/OrderService';
import { Order } from './models/Order';
import { Router } from './router/Router';
import { inject } from '@angular/core';


export class OrderConfirmationPageComponent extends OrderConfirmationPage {

  @inject('OrderService') private orderService: OrderService;
  private router: Router;

  constructor() {
    super();
    this.router = Router;
  }


  async ngOnInit() {
    // Retrieve order details from the backend
    const order = await this.orderService.getOrderDetails();

    // Update the order details displayed on the page
    this.orderDetails = order;

    // Initialize the order confirmation page
    this.initOrderConfirmationPage();
  }

  initOrderConfirmationPage() {
    // Display order details
    this.displayOrderDetails();

    // Add confirmation button
    this.addConfirmationButton();
  }

  displayOrderDetails() {
    // Display order details
    // This is a placeholder for the actual display logic
    console.log("Order Details:");
    console.log(this.orderDetails);
  }

  addConfirmationButton() {
    // Add a button to confirm the order
    // This is a placeholder for the actual button logic
    const confirmButton = document.createElement('button');
    confirmButton.innerText = 'Confirm Order';
    confirmButton.addEventListener('click', async () => {
      await this.confirmOrder();
    });
    document.body.appendChild(confirmButton);
  }


  async confirmOrder() {
    // Confirm the order with the backend
    try {
      await this.orderService.confirmOrder(this.orderDetails.id);
      console.log('Order confirmed successfully!');
      // Redirect to a success page or update the UI accordingly
      this.router.navigate(['/success']);
    } catch (error) {
      console.error('Error confirming order:', error);
      // Handle error appropriately, e.g., display an error message
    }
  }
}