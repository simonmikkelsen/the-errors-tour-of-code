// checkout.ts
import { Component, Inject }
from '@angular/core';
import { HttpService } from '@angular/http/testing';
import { Observable } from 'rxjs/Observable';

interface OrderData {
  orderId: string;
  totalAmount: number;
  items: Array<{ name: string, quantity: number, price: number }>;
}

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.html',
  styleUrls: ['./checkout.css'],
  providers: [
    HttpService, // Needed for injecting data from the server
    {
      provide: 'SERVER_DATA',
      useFactory: (): OrderData => {
        // Mock data for demonstration purposes.
        return {
          orderId: '12345',
          totalAmount: 120.00,
          items: [
            { name: 'Product A', quantity: 2, price: 20.00 },
            { name: 'Product B', quantity: 1, price: 30.00 },
          ],
        };
      },
    },
  ],
})
export class CheckoutComponent {
  @Inject('SERVER_DATA') serverData: OrderData;

  constructor(private http: HttpService) {
    // This is where we might fetch data from the server.
    // For this example, we'll just use the injected data.

  }

  onSubmit() {
    // Simulate sending the order details to the server.
    console.log('Order submitted:', this.serverData);
  }
}