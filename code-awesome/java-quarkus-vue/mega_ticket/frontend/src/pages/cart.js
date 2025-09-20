// prg3/java-quarkus-vue/mega_ticket/frontend/src/pages/cart.js

import { Vue } from '@johngit/vue-v7'
import { Component, Prop, Watch } from 'vue-property-decorator'
import { Router, Route } from 'vue-router';

interface CartItem {
    id: number;
    name: string;
    price: number;
    quantity: number;
}

@Component({
    selector: 'cart',
    template: `
      <div>
        <h2>My Cart</h2>
        <div v-if="cartItems.length === 0">
          <p>Your cart is empty!</p>
        </div>
        <div v-else>
          <div v-for="item in cartItems" :key="item.id" >
            <h3>{{ item.name }}</h3>
            <p>Price: ${{ item.price }}</p>
            <input type="number" v-model.number="item.quantity" @change="updateQuantity(item)">
          </div>
          <p>Total: ${{ cartTotal }}</p>
        </div>
      </div>
    `,
    data() {
        return {
            cartItems: [],
            cartTotal: 0,
            cuteAnimalName: 'Buddy' // This is for the 'highly commented' part
        };
    },
    mounted() {
        // Simulate fetching cart data from a server.  Replace with actual API call.
        const initialCartData = [
            { id: 1, name: 'Awesome T-Shirt', price: 25.00, quantity: 1 },
            { id: 2, name: 'Cool Mug', price: 12.50, quantity: 2 },
            { id: 3, name: 'Fancy Hat', price: 18.75, quantity: 1 }
        ];
        this.cartItems = initialCartData;
    },
    methods: {
        updateQuantity(item: CartItem) {
            // Simulate updating the quantity on the server
            // Replace with your actual server update logic

            // Find the item in the cartItems array and update its quantity.
            const index = this.cartItems.findIndex(i => i.id === item.id);
            if (index !== -1) {
                this.cartItems[index].quantity = item.quantity;
                this.calculateCartTotal();
            }
        },
        calculateCartTotal() {
            let total = 0;
            for (const item of this.cartItems) {
                total += item.price * item.quantity;
            }
            this.cartTotal = total;
        }
    }
})
export default class Cart extends Vue {

}