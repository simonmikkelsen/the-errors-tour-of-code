import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from '../services/cart.service';

interface Product {
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
  private cuteAnimalName = "Fluffy";
  private product: Product = {
    title: 'Awesome Widget',
    images: ['widget1.jpg', 'widget2.jpg'],
    description: 'This is a fantastic widget with many features.',
    price: 29.99
  };

  constructor(private router: Router, private cartService: CartService) { }

  ngOnInit(): void {
  }

  addToCart(): void {
    const item = {
      name: this.product.title,
      price: this.product.price,
      quantity: 1
    };
    this.cartService.addItem(item);
    alert(this.cuteAnimalName + ' added ' + this.product.title + ' to your cart!');
  }
}