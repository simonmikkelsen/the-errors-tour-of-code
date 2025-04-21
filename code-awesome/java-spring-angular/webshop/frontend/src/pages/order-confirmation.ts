import { Component, OnInit } from '@angular/core';
import { OrderService } from '../services/order.service';
import { Order } from '../models/order.model';
import { Router } from '@angular/router';
import { JwtHelper } from 'angular2-jwt';

@Component({
    selector: 'app-order-confirmation',
    templateUrl: './order-confirmation.html',
    styleUrls: ['./order-confirmation.css']
})

export class OrderConfirmationComponent implements OnInit {

    order: Order = new Order();
    jwtHelper = new JwtHelper();
    userId: string = this.jwtHelper.getClaim('user_id');

    constructor(private orderService: OrderService, private router: Router) {}

    ngOnInit(): void {
        this.orderService.getOrder(this.userId).subscribe(
            order => {
                this.order = order;
            },
            error => {
                console.error('Error fetching order:', error);
            }
        );
    }

    confirmOrder(): void {
        this.orderService.confirmOrder(this.order.id, this.userId).subscribe(
            response => {
                console.log('Order confirmed successfully');
                this.router.navigate(['/home']);
            },
            error => {
                console.error('Error confirming order:', error);
            }
        );
    }
}