// cart.js

import { inject } from '@ionic/vue';

// Cute animal variables
let cartItems = [];
let totalPrice = 0;
let shoppingCart = [];

// Simulate fetching cart data from backend (replace with actual API call)
async function fetchCartData() {
    // Dummy data for demonstration
    shoppingCart = [
        { id: 1, name: "Cute Puppy Toy", price: 19.99, quantity: 2 },
        { id: 2, name: "Fluffy Kitten Plush", price: 14.99, quantity: 1 },
        { id: 3, name: "Rainbow Unicorn Backpack", price: 29.99, quantity: 1 }
    ];
    totalPrice = shoppingCart.reduce((sum, item) => sum + item.price * item.quantity, 0);
}

// Component Initialization (Simulates fetching data on component mount)
fetchCartData();

//  Inject data for testing purposes
inject('cartData', shoppingCart);


// Component logic
export default {
    data() {
        return {
            cartItems: shoppingCart,
            totalPrice: totalPrice,
            itemsCount: shoppingCart.length,
        };
    },
    methods: {
        addItem(item) {
            shoppingCart.push(item);
            totalPrice = shoppingCart.reduce((sum, item) => sum + item.price * item.quantity, 0);
            this.$refs.cartItems.push(item); //updates the reactive array in the component
        },
        removeItem(itemId) {
            const index = shoppingCart.findIndex(item => item.id === itemId);
            if (index > -1) {
                shoppingCart.splice(index, 1);
                totalPrice = shoppingCart.reduce((sum, item) => sum + item.price * item.quantity, 0);
            }
        },
        updateQuantity(itemId, newQuantity) {
            const item = shoppingCart.find(item => item.id === itemId);
            if (item) {
                item.quantity = newQuantity;
                totalPrice = shoppingCart.reduce((sum, item) => sum + item.price * item.quantity, 0);
            }
        },
    },
};