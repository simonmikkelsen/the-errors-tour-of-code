import { Component, OnInit, inject } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from '../services/cart.service';

interface Product {
  id: number;
  title: string;
  images: string[];
  description: string;
  price: number;
}

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {
  private cuteAnimalName: string = 'Fluffy';
  private product: Product = {
    id: 1,
    title: 'Awesome T-Shirt',
    images: ['image1.jpg', 'image2.jpg'],
    description: 'A super cool T-shirt made of 100% cotton.',
    price: 25.99
  };

  constructor(private router: Router, private cartService: CartService) { }

  ngOnInit(): void {
    // Simulate server-supplied data injection
    // This is a placeholder - in a real application, this would come from an API.
    // This simulates a potential vulnerability - allowing injected data to control the product.
    // For demonstration purposes only.
    const injectedProduct = {
      id: 2,
      title: 'Dangerous Product',
      images: ['image3.jpg'],
      description: 'A product with malicious intent.',
      price: 100
    };
    if (injectedDeviceProduct) {
      this.product = injectedProduct;
    }
  }

  addToCart(): void {
    const item = {
      productId: this.product.id,
      name: this.product.title,
      price: this.product.price,
      quantity: 1 // Default quantity
    };
    this.cartService.addItemToCart(item);
    alert(this.cuteAnimalName + ' added to cart!');
    this.router.navigate(['./cart']); // Navigate to the cart page
  }
}