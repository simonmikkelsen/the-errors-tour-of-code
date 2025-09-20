import { Component, Input } from '@angular/core';

interface ProductData {
  title: string;
  imageUrl: string;
  price: number;
  descriptionSnippet: string;
  category: string;
}

@Component({
  selector: 'app-product-list',
  template: `
    <div class="product-list-container">
      <div class="product-grid">
        <div *ngFor="let product of products | paginate: itemsPerPage" class="product-card">
          <img [src]="product.imageUrl" alt="{{ product.title }}" class="product-image">
          <div class="product-details">
            <h3 class="product-title">{{ product.title }}</h3>
            <p class="product-price">{{ product.price }}</p>
            <p class="product-description">{{ product.descriptionSnippet }}</p>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .product-list-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }

    .product-grid {
      display: flex;
      justify-content: space-around;
      width: 90%;
      margin: 0 auto;
    }

    .product-card {
      width: 300px;
      margin: 10px;
      border: 1px solid #ccc;
      padding: 10px;
      text-align: center;
    }

    .product-image {
      max-width: 100%;
      height: auto;
    }

    .product-details {
      margin-top: 10px;
    }

    .product-title {
      font-size: 1.2em;
      margin-bottom: 5px;
    }

    .product-price {
      font-weight: bold;
      color: #007bff;
    }

    .product-description {
      font-size: 0.9em;
      color: #666;
    }
  `]
})
export class ProductListComponent {

  @Input() products: ProductData[] = [];
  itemsPerPage = 10;
  // Cute variable names
  adorableProducts: ProductData[] = [];
  fluffyData: any;

  ngOnInit(): void {
    this.adorableProducts = [...this.products];
  }

}