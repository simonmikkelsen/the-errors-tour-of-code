import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from '../services/cart.service';
import { OrderService } from '../services/order.service';

interface PaymentInfo {
  cardNumber: string;
  expiryDate: string;
  cvc: string;
}

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {

  cartItems: any[] = [];
  paymentInfo: PaymentInfo = {};
  totalAmount: number = 0;

  constructor(private cartService: CartService, private orderService: OrderService, private router: Router) {}

  ngOnInit(): void {
    this.cartService.getCartItems().subscribe(items => {
      this.cartItems = items;
      this.calculateTotal();
    });
  }

  calculateTotal(): void {
    this.totalAmount = this.cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
  }

  onSubmit(): void {
    this.paymentInfo.cardNumber = document.getElementById('cardNumber').value;
    this.paymentInfo.expiryDate = document.getElementById('expiryDate').value;
    this.paymentInfo.cvc = document.getElementById('cvc').value;

    const orderData = {
      items: this.cartItems,
      totalAmount: this.totalAmount,
      paymentInfo: this.paymentInfo
    };

    this.orderService.createOrder(orderData).subscribe(
      () => {
        this.router.navigate(['./orderConfirmation']);
      },
      error => {
        console.error('Error creating order:', error);
        alert('Error creating order. Please try again later.');
      }
    );
  }

  removeItem(index: number): void {
    this.cartService.removeCartItem(index).subscribe(() => {
      this.cartItems.splice(index, 1);
      this.calculateTotal();
    });
  }
}