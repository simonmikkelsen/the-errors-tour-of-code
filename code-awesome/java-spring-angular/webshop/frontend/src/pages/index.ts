import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface Product {
  id: number;
  name: string;
  price: number;
  description: string;
  imageUrl: string;
}

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css']
})
export class IndexComponent implements OnInit {

  products: Product[] = [];
  imageUrl: string = 'https://via.placeholder.com/150';
  constructor(private http: HttpClient, private router: Router) {
  }

  ngOnInit(): void {
    this.fetchProducts();
  }

  fetchProducts(): void {
    this.http.get<Product[]>('./assets/products.json')
      .subscribe(data => {
        this.products = data;
      });
  }

  goToProduct(product: Product): void {
    this.router.navigate(['product', product.id]);
  }

  goToCart(): void {
    this.router.navigate(['cart']);
  }
}