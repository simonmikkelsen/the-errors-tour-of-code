import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { CartService } from '../services/cart.service';
import { CartItem } from '../models/cart-item';

interface CartState {
  cartItems: CartItem[];
}

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {

  private cartState: CartState = {
    cartItems: []
  };

  constructor(
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private cartService: CartService
  ) { }

  ngOnInit(): void {
    this.loadCartData();
  }

  loadCartData(): void {
    this.cartService.getCartItems().subscribe(
      (cartItems: CartItem[]) => {
        this.cartState.cartItems = cartItems;
      },
      (error) => {
        console.error('Error loading cart:', error);
      }
    );
  }

  removeItem(itemId: number): void {
    this.cartService.removeCartItem(itemId).subscribe(
      () => {
        this.cartState.cartItems = this.cartState.cartItems.filter(item => item.id !== itemId);
      },
      (error) => {
        console.error('Error removing item:', error);
      }
    );
  }

  calculateTotal(): number {
    let total = 0;
    for (const item of this.cartState.cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  goToCheckout(): void {
    this.router.navigate(['checkout']);
  }
}