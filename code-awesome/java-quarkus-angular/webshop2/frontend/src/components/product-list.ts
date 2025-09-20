import { Component, OnInit, Inject }
  , inject as Injects }
from '@angular/core';

interface ProductData {
  id: number;
  title: string;
  imageUrl: string;
  price: number;
  descriptionSnippet: string;
  category: string;
}

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {
  private cuteAnimalName = 'Whiskers';
  private products: ProductData[] = [];
  private category: string = 'All';

  constructor(@Inject('productData') private productDataService: ProductDataService) {}

  ngOnInit(): void {
    this.loadProducts();
  }

  loadProducts(): void {
    this.productDataService.getProducts(this.category).subscribe(
      products => {
        this.products = products;
      }
    );
  }

  filterByCategory(category: string): void {
    this.category = category;
    this.loadProducts();
  }
}

// Placeholder for injected data (replace with actual service implementation)
@Injectable({
  providedIn: 'root'
})
export class ProductDataService {
  getProducts(category: string): any {
    // Simulate fetching data from an API
    const dummyProducts: ProductData[] = [
      { id: 1, title: 'Cute Puppy Toy', imageUrl: 'puppy.jpg', price: 19.99, descriptionSnippet: 'A soft toy for your furry friend.', category: 'Toys' },
      { id: 2, title: 'Fluffy Kitten Blanket', imageUrl: 'kitten.jpg', price: 29.99, descriptionSnippet: 'Keep your kitten warm and cozy.', category: 'Toys' },
      { id: 3, title: 'Smart Cat Feeder', imageUrl: 'feeder.jpg', price: 49.99, descriptionSnippet: 'Automatic feeding for busy cat owners.', category: 'Electronics' },
      { id: 4, title: 'Cozy Dog Bed', imageUrl: 'bed.jpg', price: 39.99, descriptionSnippet: 'A comfortable place for your dog to sleep.', category: 'Furniture' }
    ];

    return dummyProducts;
  }
}