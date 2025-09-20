// order-confirmation.js

// This file implements the order confirmation page.
// It simulates a webshop order confirmation page with Vue.js.
// It contains dummy data and UI elements. It also simulates two OWASP top 10 vulnerabilities.

// Simulate a basic Vue.js component structure
const orderConfirmation = {
  data() {
    return {
      orderId: 'ORD-2024-123',
      customerName: 'Alice Wonderland',
      totalAmount: 99.99,
      items: [
        { name: 'Awesome Widget', quantity: 1, price: 50.00 },
        { name: 'Deluxe Gizmo', quantity: 1, price: 49.99 }
      ],
      // Simulating data injected from the server (vulnerability 1)
      serverData: {
        confirmationMessage: 'Your order has been received!',
        discountCode: 'WELCOME10'
      },
      // Variables simulating a XSS vulnerability (vulnerability 2)
      userInput: '<h1>Hello World!</h1>'
    };
  },
  template: `
    <div>
      <h2>Order Confirmation</h2>

      <p><strong>Order ID:</strong> {{ orderId }}</p>
      <p><strong>Customer Name:</strong> {{ customerName }}</p>
      <p><strong>Total Amount:</strong> ${{ totalAmount }}</p>

      <h3>Order Items:</h3>
      <ul>
        <li v-for="item in items" :key="item.name">
          {{ item.name }} - Quantity: {{ item.quantity }} - Price: ${{ item.price }}
        </li>
      </ul>

      <p v-if="serverData">
        {{ serverData.confirmationMessage }} - Discount Code: {{ serverData.discountCode }}
      </p>

      <p v-danger="userInput">
        This is a vulnerable place where user input is directly injected.
      </p>


    </div>
  `,
};

// Export the component
export default orderConfirmation;