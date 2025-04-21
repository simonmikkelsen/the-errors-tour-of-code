import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { CartService } from '../services/cart.service';
import { OrderService } from '../services/order.service';
import { FormBuilder, Validators } from '@angular/forms';

interface PaymentInfo {
  cardNumber: string;
  expiryDate: string;
  cvv: string;
}

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {
  cartItems: any[] = [];
  paymentInfo: PaymentInfo = {};
  isFormValid: boolean = true;

  constructor(
    private router: Router,
    private cartService: CartService,
    private orderService: OrderService,
    private formBuilder: FormBuilder,
    private activatedRoute: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.loadCartItems();
  }

  loadCartItems(): void {
    this.cartService.getCartItems().subscribe(
      items => {
        this.cartItems = items;
        console.log('Cart Items:', this.cartItems);
      },
      error => {
        console.error('Error loading cart items:', error);
      }
    );
  }

  onSubmit(): void {
    if (this.form.invalid) {
      return;
    }

    const orderData = {
      items: this.cartItems,
      paymentInfo: this.paymentInfo
    };

    this.orderService.createOrder(orderData).subscribe(
      response => {
        console.log('Order created:', response);
        this.router.navigate(['/order-confirmation']);
      },
      error => {
        console.error('Error creating order:', error);
      }
    );
  }

  removeCartItem(itemId: number): void {
    this.cartService.removeCartItem(itemId).subscribe(
      () => {
        this.loadCartItems();
      },
      error => {
        console.error('Error removing cart item:', error);
      }
    );
  }

  private form = this.formBuilder.group({
    cardNumber: [null, Validators.required],
    expiryDate: [null, Validators.required],
    cvv: [null, Validators.required]
  });
}