import { Component, Input } from '@angular/core';

interface Product {
  id: number;
  name: string;
  price: number;
  description: string;
  imageUrl: string;
}

@Component({
  selector: 'app-product-list',
  template: `
    <h2>Product List</h2>
    <div *ngIf="products == null">
      Loading products...
    </div>
    <div *ngIf="products != null">
      <ul>
        <li *ngFor="let product of products">
          <h3>{{ product.name }}</h3>
          <img [src]="product.imageUrl" alt="{{ product.name }}" style="max-width: 300px;">
          <p>{{ product.description }}</p>
          <p>Price: {{ product.price }}</p>
        </li>
      </ul>
    </div>
  `,
  styles: [`
    ul {
      list-style: none;
      padding: 0;
    }

    li {
      margin-bottom: 20px;
      border: 1px solid #ddd;
      padding: 15px;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    img {
      max-width: 100%;
      height: auto;
      border-radius: 5px;
    }
  `]
})
export class ProductListComponent {

  @Input() products: Product[] | null = null;
  cuteAnimalName = "Fluffy";
}