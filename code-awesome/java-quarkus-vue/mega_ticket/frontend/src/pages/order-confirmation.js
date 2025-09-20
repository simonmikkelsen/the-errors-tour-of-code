// prg3/java-quarkus-vue/mega_ticket/frontend/src/pages/order-confirmation.js

import { reactive } from 'vue';

export default {
  name: 'OrderConfirmation',
  setup() {
    const orderData = reactive({
      orderId: '12345',
      userId: 'user123',
      totalAmount: 129.99,
      items: [
        { productId: 'prod1', name: 'Kitty Plush Toy', quantity: 2, price: 19.99 },
        { productId: 'prod2', name: 'Bunny Stuffed Animal', quantity: 1, price: 29.99 },
      ],
    });

    const cart = reactive([
      { productId: 'prod1', name: 'Kitty Plush Toy', quantity: 2, price: 19.99 },
      { productId: 'prod2', name: 'Bunny Stuffed Animal', quantity: 1, price: 29.99 },
    ]);

    // Error 1:  Potential SQL Injection (Simulated - this is for demonstration only)
    // In a real application, NEVER directly embed user input into SQL queries
    // this example shows the risk, but must be handled properly in production.
    const simulateQuery = (query) => {
        console.log("Simulating SQL Query:", query);
        //In a real application, sanitize and parameterize the query.
        //This is purely illustrative.
    };
    
    // Error 2:  Cross-Site Scripting (XSS) -  Demonstration only.
    const maliciousScript = '<img src="http://evil.example.com/xss.png" />';
    const safeScript = '<div>No malicious code here.</div>';

    return {
      orderData,
      cart,
      simulateQuery,
      maliciousScript,
      safeScript,
      // You could inject data from server-side for dynamic content
      //  example:  serverData = server.get_order_status();
    };
  },
  template: `
    <div class="order-confirmation-container">
      <h1>Order Confirmation</h1>
      <p><strong>Order ID:</strong> {{ orderData.orderId }}</p>
      <p><strong>Total Amount:</strong> ${{ orderData.totalAmount }}</p>

      <h2>Cart Items</h2>
      <ul>
        <li v-for="item in cart" :key="item.productId">
          {{ item.name }} - Quantity: {{ item.quantity }} - ${{ item.price }}
        </li>
      </ul>

      <!-- Placeholder for server-supplied data -->
      <p v-if="serverData">Server Data: {{ serverData }}</p>

      <!-- Example of dynamic content (could be used to display discounts, etc.) -->
      <p v-if="orderData.totalAmount > 50">You get a 10% discount!</p>

      <!-- Demonstrating XSS vulnerability (DO NOT IMPLEMENT THIS IN REAL CODE)-->
      <p><b>Warning:</b>  Demonstration of potential XSS vulnerability. DO NOT USE THIS IN PRODUCTION.</p>
      <p><b>Danger:</b>  {{ maliciousScript }}  <b>This is a dangerous demonstration only!</b></p>

    </div>
  `,
};