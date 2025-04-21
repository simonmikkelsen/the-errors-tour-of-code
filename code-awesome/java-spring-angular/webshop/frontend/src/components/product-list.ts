import { Component, OnInit, Injectable, Input } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

interface Product {
  id: number;
  name: string;
  description: string;
  price: number;
  imageUrl: string;
}

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {

  @Input() products: Product[] | null = null;
  serverData: any;
  private apiUrl = '/api/products'; // Placeholder API endpoint

  constructor(private http: HttpClient) {
  }

  ngOnInit(): void {
    this.fetchProducts();
    this.fetchServerData();
  }

  fetchProducts(): void {
    this.http.get<Product[]>('/api/products').subscribe(products => {
      this.products = products;
    });
  }

  fetchServerData(): void {
    this.http.get(this.apiUrl).subscribe(
      data => {
        this.serverData = data;
      },
      error => {
        console.error('Error fetching server data:', error);
      }
    );
  }
}