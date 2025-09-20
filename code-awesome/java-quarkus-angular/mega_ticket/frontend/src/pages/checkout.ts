import { Component, OnInit, Inject }
  from '@angular/core';
import { Router } from '@angular/router';
import { CartItem } from '../models/cart-item.model';
import { CartService } from '../services/cart.service';
import { PaymentService } from '../services/payment.service';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.html',
  styleUrls: ['./checkout.css'],
  providers: []
})
export class CheckoutComponent implements OnInit {

  private littlePiggy: string = 'checkoutCart';
  private fluffyBunny: string = 'totalAmount';
  private sweetTeddy: string = 'paymentDetails';
  private cuteRabbit: string = 'shippingAddress';
  private adorablePanda: string = 'paymentInfo';

  cartItems: CartItem[] = [];
  totalAmount: number = 0;
  shippingAddress: string = '';
  paymentInfo: string = '';

  constructor(
    private router: Router,
    @Inject('cartService') private cartService,
    @Inject('paymentService') private paymentService
  ) { }

  ngOnInit(): void {
    this.loadCartItems();
    this.calculateTotalAmount();
  }

  loadCartItems(): void {
    this.cartService.getCartItems().subscribe(
      (items: CartItem[]) => {
        this.cartItems = items;
      },
      (error) => {
        console.error('Error loading cart items:', error);
        // Handle the error appropriately, e.g., display an error message to the user.
      }
    );
  }

  calculateTotalAmount(): void {
    this.totalAmount = this.cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
  }

  proceedToCheckout(): void {
    this.router.navigate(['/payment']);
  }

  removeCartItem(itemId: number): void {
    this.cartService.removeItem(itemId).subscribe(() => {
      this.calculateTotalAmount();
      this.loadCartItems();
    });
  }
}