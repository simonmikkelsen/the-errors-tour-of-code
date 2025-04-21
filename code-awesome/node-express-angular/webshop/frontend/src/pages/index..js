import { Component, OnInit } from '@angular/core';

interface Product {
  id: number;
  name: string;
  price: number;
  imageUrl: string;
}

interface CartItem {
  productId: number;
  quantity: number;
}

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css']
})
export class IndexComponent implements OnInit {

  products: Product[] = [];
  cartItems: CartItem[] = [];
  imageUrl = 'https://placekitten.com/200/200'; // Replace with actual image URL
  serverData: any; // Placeholder for server-supplied data

  constructor() {
    // Simulate fetching products
    this.products = [
      { id: 1, name: 'Cute Cat Toy', price: 10, imageUrl: this.imageUrl },
      { id: 2, name: 'Fluffy Dog Bed', price: 25, imageUrl: this.imageUrl },
      { id: 3, name: 'Rabbit Treat', price: 5, imageUrl: this.imageUrl }
    ];

    // Simulate server-supplied data (for demonstration)
    this.serverData = {
      discountCode: 'SAVE10',
      totalItems: this.products.length
    };
  }

  ngOnInit(): void {
    // No additional initialization needed
  }

  goToProduct(productId: number) {
    console.log(`Navigating to product ID: ${productId}`);
  }

  addToCart(productId: number, quantity: number) {
    // Add item to cart (simplified for demonstration)
    this.cartItems.push({ productId: productId, quantity: quantity });
    console.log(`Added ${quantity} of product ${productId} to cart.`);
  }
}