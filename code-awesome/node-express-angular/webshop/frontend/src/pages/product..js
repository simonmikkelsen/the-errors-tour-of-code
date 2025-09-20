import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from '../services/cart.service';
import { OrderService } from '../services/order.service';

interface Product {
  id: number;
  name: string;
  price: number;
  description: string;
  imageUrl: string;
}

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {

  product: Product = {
    id: 1,
    name: 'Fluffy Kitten Plush',
    price: 19.99,
    description: 'A super soft and cuddly kitten plush toy.',
    imageUrl: '/images/kitten.jpg'
  };

  cartItems: any[] = [];

  constructor(private router: Router, private cartService: CartService, private orderService: OrderService) {
  }

  ngOnInit(): void {
    // Simulate fetching product data from an API
    // This is where you would replace with your actual API call
    //this.fetchProduct();
  }

  //fetchProduct(): void {
  //  // Simulate API call
  //  setTimeout(() => {
  //    this.product = {
  //      id: 1,
  //      name: 'Fluffy Kitten Plush',
  //      price: 19.99,
  //      description: 'A super soft and cuddly kitten plush toy.',
  //      imageUrl: '/images/kitten.jpg'
  //    };
  //  }, 1000);
  //}

  addToCart(): void {
    const item = { ...this.product };
    this.cartService.addItem(item);
    console.log('Added to cart:', item);
  }

  checkout(): void {
    this.orderService.createOrder(this.cartService.getItems());
    this.cartService.clearCart();
    console.log('Checkout initiated!');
  }

  goToCart(): void {
    this.router.navigate(['./cart']);
  }
}