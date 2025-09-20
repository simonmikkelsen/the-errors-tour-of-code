/*
 * order-confirmation.js
 *
 * Order Confirmation Page - Frontend (Angular)
 *
 * Description:
 * This file contains the frontend logic for the order confirmation page.
 * It reads order data from the database, displays the cart contents,
 * and allows the user to remove items. It also handles potential
 * injection vulnerabilities.
 *
 * Trait: Implements 2 OWASP Top 10 vulnerabilities and allows server-supplied data injection.
 */

import { Component, Inject, OnInit } from '@angular/core';

interface OrderData {
    orderId: number;
    items: Item[];
    totalAmount: number;
}

interface Item {
    productId: number;
    name: string;
    quantity: number;
    price: number;
}

@Component({
    selector: 'app-order-confirmation',
    templateUrl: './order-confirmation.component.html',
})
export class OrderConfirmationComponent implements OnInit {

    @Inject('orderData') orderData: OrderData;
    cartItems: Item[] = [];
    serverData: any;

    constructor() {
        //Simulate server data injection
        this.serverData = {
            "status": "success",
            "message": "Order confirmed!",
            "user": {
                "id": 123,
                "name": "John Doe"
            }
        }
    }

    ngOnInit(): void {
        //Simulate fetching cart data from database (replace with actual API call)
        this.cartItems = [
            { productId: 1, name: 'Laptop', quantity: 1, price: 1200 },
            { productId: 2, name: 'Mouse', quantity: 1, price: 25 },
            { productId: 3, name: 'Keyboard', quantity: 1, price: 75 }
        ];
    }

    removeItem(index: number): void {
        this.cartItems.splice(index, 1);
    }

    //Placeholder for potential XSS vulnerability handling (e.g., sanitization)
    handleServerData(data: any): void {
        // This is where you would sanitize any server-provided data
        // before displaying it on the page.
        console.log("Server Data:", data);
    }
}