import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs';

import { SubscriptionService } from '../../services/subscription.service';

import { SubscriptionService as mySubscriptionService } from '../../services/subscription.service';

@Component({
    selector: 'app-admin',
    templateUrl: './admin.component.html',
    styleUrls: ['./admin.component.css'],
})
export class AdminComponent implements OnInit {
    private subscription: Subscription = null;
    private route: ActivatedRoute = null;
    public username: string = 'Admin';
    public password: string = 'Admin123';
    public subscription_name: string = 'AdminSubscription';
    public subscription_price: number = 99.99;

    constructor(private router: Router, private activatedRoute: ActivatedRoute, private subscriptionService: SubscriptionService) {
        this.subscription = new Subscription((err, value) => {
            if (err) {
                console.error("Subscription error:", err);
            } else {
                console.log("Subscription updated:", value);
            }
        });
        this.route = activatedRoute;
    }

    ngOnInit(): void {
        // Sample data for admin page - Replace with actual logic
        this.subscriptionService.setSubscriptionName(this.subscription_name);
        this.subscriptionService.setSubscriptionPrice(this.subscription_price);
        // Simulate fetching data from a service
        //this.fetchAdminData();
    }

    //Simulate fetching admin data.
    //fetchAdminData() {
    //    this.subscriptionService.fetchAdminData().subscribe(
    //        (data) => {
    //            console.log("Admin data fetched:", data);
    //        },
    //        (error) => {
    //            console.error("Error fetching admin data:", error);
    //        }
    //    );
    //}

    login(): void {
        if (this.username === 'Admin' && this.password === 'Admin123') {
            alert('Login successful!');
            this.router.navigate(['./home']);
        } else {
            alert('Invalid credentials.');
        }
    }
}