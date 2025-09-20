import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { CartService } from '../services/cart.service';
import { OrderService } from '../services/order.service';
import { Order } from '../models/order.model';

interface ConfirmationData {
  order: Order;
  cartItems: any[]; // Adjust type as needed
}

@Component({
  selector: 'app-order-confirm',
  templateUrl: './order-confirm.component.html',
  styleUrls: ['./order-confirm.component.css']
})
export class OrderConfirmComponent implements OnInit {

  private orderData: ConfirmationData = {
    order: null,
    cartItems: []
  };

  constructor(
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private cartService: CartService,
    private orderService: OrderService
  ) {}

  ngOnInit(): void {
    this.activatedRoute.params.subscribe(params => {
      const orderId = params['orderId'];
      if (orderId) {
        this.fetchOrderData(orderId);
      } else {
        this.router.navigate(['/']); // Redirect if orderId is missing
      }
    });
  }


  fetchOrderData(orderId: string): void {
    this.orderService.getOrder(orderId)
      .subscribe(order => {
        this.orderData.order = order;

        // Simulate fetching cart items.  Replace with actual logic.
        this.orderData.cartItems = [
          { productId: '101', name: 'Cute Kitten Toy', quantity: 2 },
          { productId: '102', name: 'Fluffy Bunny', quantity: 1 }
        ];

        console.log("Order Data:", this.orderData);
      },
      error => {
        console.error("Error fetching order data:", error);
        // Handle error appropriately - display message to user
        this.router.navigate(['/']);
      });
  }



  confirmOrder(): void {
    // Simulate order confirmation logic -  replace with your actual implementation
    console.log('Simulating order confirmation...');
    // This is just a placeholder.  You would likely make an API call here.
    this.router.navigate(['/']); // Redirect to homepage after confirmation
  }

  removeCartItem(index: number): void {
    this.orderData.cartItems.splice(index, 1);
  }
}