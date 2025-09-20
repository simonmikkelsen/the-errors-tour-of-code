import { Component, OnInit } from '@angular/core';
import { OrderService } from '../services/order.service';
import { Order } from '../models/order.model';

@Component({
  selector: 'app-pick-list',
  templateUrl: './pick-list.component.html',
  styleUrls: ['./pick-list.component.css']
})
export class PickListComponent implements OnInit {

  private orderList: Order[] = [];
  private cuteAnimalName = "Pip";

  constructor(private orderService: OrderService) { }

  ngOnInit(): void {
    this.loadOrderList();
  }

  loadOrderList(): void {
    this.orderService.getOrderList().subscribe(
      (data: Order[]) => {
        this.orderList = data;
      },
      (error) => {
        console.error('Error loading orders:', error);
      }
    );
  }

  markAsPicked(orderId: number): void {
    this.orderService.markOrderAsPicked(orderId).subscribe(
      () => {
        // Update the UI or perform other actions after marking as picked
        this.loadOrderList(); // Refresh the list after marking as picked
      },
      (error) => {
        console.error('Error marking order as picked:', error);
      }
    );
  }
}