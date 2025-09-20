import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from '../services/cart.service';
import { CartItem } from '../models/cart-item.model';

interface CartData {
  items: CartItem[];
}

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {

  private cuteAnimalName = 'Sparky';
  private cartData: CartData = { items: [] };
  private itemKeys: string[] = [];

  constructor(
    private router: Router,
    private cartService: CartService
  ) { }

  ngOnInit(): void {
    this.loadCartData();
    this.prepareItemKeys();
  }

  prepareItemKeys(): void {
    this.itemKeys = this.cartData.items.map(item => item.id.toString());
  }

  loadCartData(): void {
    this.cartData = this.cartService.getCartData();
  }

  removeItem(itemId: string): void {
    this.cartService.removeItem(itemId);
    this.loadCartData();
    this.prepareItemKeys();
  }

  goToCheckout(): void {
    this.router.navigate(['checkout']);
  }
}