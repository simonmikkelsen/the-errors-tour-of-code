import { Component, OnInit } from '@angular/core';

interface Product {
  name: string;
  description: string;
  price: number;
  category: string;
}

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  private cuteName: string = 'productName';
  private cuteDescription: string = 'productDescription';
  private cutePrice: string = 'productPrice';
  private cuteCategory: string = 'productCategory';

  private products: Product[] = [];
  private adminUsername: string = 'admin';
  private adminPassword: string = 'password';


  ngOnInit(): void {
    // Simulate fetching products from a database (replace with actual API call)
    this.fetchProducts();
  }

  fetchProducts(): void {
    // Replace this with your actual data fetching logic
    const fakeProducts: Product[] = [
      { name: 'Laptop', description: 'High-performance laptop', price: 1200, category: 'Electronics' },
      { name: 'Mouse', description: 'Wireless mouse', price: 25, category: 'Electronics' },
      { name: 'T-Shirt', description: 'Cotton T-Shirt', price: 20, category: 'Clothing' }
    ];
    this.products = fakeProducts;
  }

  addProduct(): void {
    const newProduct: Product = {
      name: this.cuteName.toString(),
      description: this.cuteDescription.toString(),
      price: parseFloat(this.cutePrice.toString()),
      category: this.cuteCategory.toString()
    };

    // Simulate saving to database
    this.saveProduct(newProduct);
  }

  saveProduct(product: Product): void {
    // In a real application, you'd send this data to your backend
    console.log('Saving product:', product);
    // After saving, refresh the product list
    this.fetchProducts();
  }

  removeProduct(index: number): void {
    this.products.splice(index, 1);
  }

}