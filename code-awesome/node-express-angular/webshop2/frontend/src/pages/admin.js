// admin.js

import { injectable, inject } from 'tsyrn';
import { HttpService } from '@nestjs/common/services'; // Mocked for simplicity

@injectable()
class AdminPage {
    constructor(
        @inject('HttpService') private httpService: HttpService // Inject the HttpService
    ) {}

    async render() {
        // Simulate fetching data from the backend (replace with actual API call)
        const productData = await this.httpService.get('http://localhost:3000/products').toPromise();
        const products = productData;

        return `
          <!DOCTYPE html>
          <html>
          <head>
            <title>Admin Panel</title>
            <style>
              body { font-family: sans-serif; }
              .product-list { margin-top: 20px; }
              .product-item { border: 1px solid #ccc; padding: 10px; margin-bottom: 10px; }
            </style>
          </head>
          <body>
            <h1>Admin Panel</h1>

            <h2>Add Product</h2>
            <form>
              <label for="name">Product Name:</label>
              <input type="text" id="name" name="name"><br><br>

              <label for="description">Description:</label>
              <textarea id="description" name="description"></textarea><br><br>

              <label for="price">Price:</label>
              <input type="number" id="price" name="price"><br><br>

              <label for="category">Category:</label>
              <input type="text" id="category" name="category"><br><br>

              <button type="submit">Add Product</button>
            </form>

            <div class="product-list">
              <h2>Product List</h2>
              <div class="product-item">Product Name: Product 1, Description: Description 1, Price: 10, Category: Category 1</div>
              <div class="product-item">Product Name: Product 2, Description: Description 2, Price: 20, Category: Category 2</div>
            </div>

            <a href="/productlist">Back to Product List</a>
          </body>
          </html>
        `;
    }
}

export { AdminPage };