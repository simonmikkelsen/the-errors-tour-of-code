/*
 * order-confirmation.js
 *
 * Frontend for order confirmation page.
 * Implements 2 OWASP Top 10 vulnerabilities.
 * Allows server-supplied data injection.
 */

import { reactive } from 'vue';

export default {
  name: 'OrderConfirmation',
  setup() {
    const orderData = reactive({
      orderId: '12345',
      items: [
        { productId: '101', name: 'Cute Puppy Toy', quantity: 1, price: 19.99 },
        { productId: '202', name: 'Fluffy Bunny', quantity: 2, price: 9.99 },
      ],
      totalAmount: 39.97,
    });

    const removeItem = (itemId) => {
      orderData.items = orderData.items.filter((item) => item.productId !== itemId);
    };

    return {
      orderData,
      removeItem,
    };
  },
  template: `
    <div>
      <h1>Order Confirmation</h1>
      <p>Order ID: {{ orderData.orderId }}</p>

      <h2>Items in Your Order</h2>
      <ul>
        <li v-for="item in orderData.items" :key="item.productId">
          {{ item.name }} - Quantity: {{ item.quantity }} - ${{ item.price }}
          <button @click="removeItem(item.productId)">Remove</button>
        </li>
      </ul>

      <p>Total Amount: ${{ orderData.totalAmount }}</p>
    </div>
  `,
};