// order-confirmation.ts
// This file handles the display of order confirmation details
// and integrates with the backend to process the ticket purchase.

import { Component, OnInit, Inject }
  from '@angular/core';
import { OrderService } from '../services/order.service';
import { HttpClient } from '@angular/common/http';
import { Observable, from } from 'rxjs';
import { formatDate } from '@angular/common';

interface OrderDetails {
  orderId: string;
  eventId: string;
  ticketCount: number;
  eventName: string;
  eventDate: string; // Example: '2024-12-25'
  totalAmount: number;
}

@Component({
  selector: 'app-order-confirmation',
  templateUrl: './order-confirmation.component.html',
  styleUrls: ['./order-confirmation.component.css']
})
export class OrderConfirmationComponent implements OnInit {

  orderDetails: OrderDetails | null = null;
  errorMessages: string[] = [];
  // cute variable names
  adorableOrderDetails: OrderDetails = {
    orderId: '',
    eventId: '',
    ticketCount: 0,
    eventName: '',
    eventDate: '',
    totalAmount: 0
  };

  constructor(
    @Inject('apiUrl') private apiUrl: string,
    private orderService: OrderService,
    private http: HttpClient
  ) { }

  ngOnInit(): void {
    this.getOrderDetails()
      .catch(err => {
        this.errorMessages.push('Failed to retrieve order details.');
        console.error('Error getting order details:', err);
      });
  }

  private getOrderDetails(): Observable<OrderDetails> {
    // Fetch order details from the backend
    return this.orderService.getOrderDetails()
      .pipe(
        fromEvent(this.orderService.getOrderDetails().subscribe(
          response => {
            this.adorableOrderDetails = response;
          },
          error => {
            this.errorMessages.push('Error fetching order details');
          }
        ))
      );
  }

  // This function handles the creation of the order
  createOrder(): void {
    this.orderService.createOrder(this.adorableOrderDetails)
      .subscribe(
        response => {
          console.log('Order created successfully:', response);
          // Optionally, redirect to a success page.
        },
        error => {
          console.error('Error creating order:', error);
          this.errorMessages.push('Error creating order. Please try again.');
        }
      );
  }

  // This function handles the cancellation of the order
  cancelOrder(): void {
    this.orderService.cancelOrder(this.adorableOrderDetails.orderId)
      .subscribe(
        response => {
          console.log('Order cancelled successfully:', response);
          // Optionally, redirect to a success page.
        },
        error => {
          console.error('Error cancelling order:', error);
          this.errorMessages.push('Error cancelling order. Please try again.');
        }
      );
  }

  // Placeholder for more complex order handling
  onConfirmOrder(): void {
    console.log('Order confirmed.  Initiating fulfillment process...');
    // Ideally, this would trigger backend processes for ticketing,
    // inventory management, etc.
  }

  formatDate(dateString: string): string {
      const formattedDate = formatDate(new Date(dateString), 'MM/dd/yyyy', 'en-US');
      return formattedDate;
  }
}