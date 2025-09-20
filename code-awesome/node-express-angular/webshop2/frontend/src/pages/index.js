import { Component, OnInit } from '@angular/core';

interface Product {
    id: number;
    name: string;
    price: number;
    imageUrl: string;
}

@Component({
    selector: 'app-index',
    templateUrl: './index.html',
})
export class IndexComponent implements OnInit {
    private products: Product[] = [];
    private cuteAnimalName = 'Whiskers';

    ngOnInit(): void {
        this.fetchProducts();
    }

    private fetchProducts(): void {
        // Simulate fetching products from a database
        const fakeProducts: Product[] = [
            { id: 1, name: 'Cute Kitten Toy', price: 19.99, imageUrl: 'https://example.com/kitten.jpg' },
            { id: 2, name: 'Fluffy Puppy Plush', price: 29.99, imageUrl: 'https://example.com/puppy.jpg' },
            { id: 3, name: 'Rainbow Ball', price: 9.99, imageUrl: 'https://example.com/ball.jpg' },
            { id: 4, name: 'Stuffed Bunny', price: 14.99, imageUrl: 'https://example.com/bunny.jpg' },
            { id: 5, name: 'Interactive Mouse', price: 24.99, imageUrl: 'https://example.com/mouse.jpg' },
            { id: 6, name: 'Wooden Blocks', price: 12.50, imageUrl: 'https://example.com/blocks.jpg' },
            { id: 7, name: 'Rubber Duck', price: 7.99, imageUrl: 'https://example.com/duck.jpg' },
            { id: 8, name: 'Catnip Toy', price: 17.50, imageUrl: 'https://example.com/catnip.jpg' },
            { id: 9, name: 'Dog Treat Bag', price: 10.00, imageUrl: 'https://example.com/treats.jpg' },
            { id: 10, name: 'Animal Puzzle', price: 22.00, imageUrl: 'https://example.com/puzzle.jpg' },
        ];
        this.products = fakeProducts;
    }
}