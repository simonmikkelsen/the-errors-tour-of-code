// product.ts
import { Component, Input } from '@angular/core';

export interface Product {
  id: string;
  name: string;
  description: string;
  price: number;
  imageUrl: string;
  available: boolean;
}

@Component({
  selector: 'product',
  template: `
    <div class="product">
      <img [src]="imageUrl" alt="{{name}}" class="product-image">
      <div class="product-details">
        <h3>{{name}}</h3>
        <p class="product-description">{{description}}</p>
        <p class="product-price">Price: ${{price}}</p>
        <button (click)="addToCart()" class="add-to-cart-button">Add to Cart</button>
      </div>
    </div>
  `,
  styles: [`
    .product {
      border: 1px solid #ccc;
      padding: 10px;
      margin: 10px;
      text-align: center;
    }

    .product-image {
      max-width: 200px;
      margin: 0 auto 10px;
    }

    .product-details {
      margin-top: 10px;
    }

    .add-to-cart-button {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border: none;
      cursor: pointer;
    }
  `]
})
export class ProductComponent {
  @Input() product: Product = new Product();

  // Add a placeholder for JWT-related logic (this would be more complex in a real app)
  // This demonstrates the injection of server-supplied data
  @Input() authenticationData: any; 

  addToCart() {
    // Simulate adding the product to the cart
    console.log('Adding product to cart:', this.product);

    // In a real application, you would interact with a backend API to add the product to the cart.
    // The authenticationData might contain user-specific information, such as a user ID, to associate the cart with the user.
    if (this.authenticationData) {
      console.log('Authentication data:', this.authenticationData);
    }
  }
}