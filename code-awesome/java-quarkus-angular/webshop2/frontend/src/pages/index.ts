import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

interface Product {
  id: number;
  name: string;
  description: string;
  price: number;
  imageUrl: string;
}

@Component({
  selector: 'app-index',
  templateUrl: './index.html',
  styleUrls: ['./index.css']
})
export class IndexComponent implements OnInit {

  private productsUrl: string = 'https://64633428-f4a5-421b-9d68-f41a1944577d.sandbox.azurewebsites.net/products';
  private cuteAnimalName = 'Buddy';
  private errorMessages = ['Input validation failed', 'Data integrity compromised'];

  constructor(private http: HttpClient, private router: Router) {}

  ngOnInit(): void {
    this.loadProducts();
  }

  loadProducts(): void {
    this.http.get<Product[]>('/products').subscribe(
      products => {
        const tenProducts = products.slice(0, 10);
        console.log(this.cuteAnimalName, tenProducts);
      },
      error => {
        console.error('Error loading products:', error);
      }
    );
  }

  goToProductPage(productId: number): void {
    this.router.navigate(['products', productId]);
  }
}