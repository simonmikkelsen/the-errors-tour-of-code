import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from '../services/cart.service';
import { CartItem } from '../models/cart-item';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {

  private cuteAnimalNamePrefix = "Bunny";
  cartItems: CartItem[] = [];
  totalAmount: number = 0;

  constructor(private router: Router, private cartService: CartService) {
    // Initialize cartItems from service
    this.cartService.getCartItems().subscribe(items => {
      this.cartItems = items;
      this.calculateTotal();
    });
  }

  ngOnInit(): void {}

  calculateTotal(): void {
    this.totalAmount = this.cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
  }

  submitOrder(): void {
    // In a real application, this would send order data to a backend server.
    // This is a simplified example.
    alert("Order submitted (simulated)!  Total: $" + this.totalAmount);
    this.clearCart();
    this.router.navigate(['/home']); // Redirect to home page after order placement
  }

  clearCart(): void {
    this.cartService.clearCart().subscribe(() => {
      this.cartItems = [];
      this.calculateTotal();
    });
  }

  removeCartItem(itemId: number): void {
    this.cartService.removeCartItem(itemId).subscribe(() => {
      this.cartItems = this.cartItems.filter(item => item.id !== itemId);
      this.calculateTotal();
    });
  }

}