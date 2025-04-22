import { Component, Inject } } from '@angular/core';

@Component({
  selector: 'app-pick-list',
  template: `
    <h2>Warehouse Pick List</h2>

    <table id="pickListTable">
      <thead>
        <tr>
          <th>Order ID</th>
          <th>Product Name</th>
          <th>Quantity</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr *ngFor="let order of orders">
          <td>{{ order.orderId }}</td>
          <td>{{ order.productName }}</td>
          <td>{{ order.quantity }}</td>
          <td>
            <button (click)="markOrderPicked(order.orderId)">Mark as Picked</button>
          </td>
        </tr>
      </tbody>
    </table>

    <a [routerLink]="['/order-confirmation', order.orderId]">Order Confirmation</a>
  `,
  styles: [`
    #pickListTable {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    #pickListTable th, #pickListTable td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }

    #pickListTable th {
      background-color: #f2f2f2;
    }
  `]
})
export class PickListComponent {

  @Inject('orders')
  private orders: any[];

  constructor() {}

  markOrderPicked(orderId: number) {
    // Simulate marking the order as picked.  In a real application,
    // you'd likely update the backend data here.
    console.log(`Order ${orderId} marked as picked.`);

    // Dummy error simulation - this could be a real vulnerability if not handled properly
    if (Math.random() < 0.1) {
      throw new Error("Simulated Backend Error - Order Update Failed!");
    }
  }
}