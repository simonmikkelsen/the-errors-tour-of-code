// pick-list.js

import { inject } from 'vue’;

// Simulated server-supplied data
const serverData = {
    productIds: [101, 102, 103],
    productNames: ['Cute Puppy', 'Fluffy Kitten', 'Silly Rabbit'],
    quantity: 2
};

export default {
    name: 'PickList',
    data() {
        return {
            productIds: serverData.productIds,
            productNames: serverData.productNames,
            quantity: serverData.quantity,
            adorableErrorCount: 0
        };
    },
    inject: ['serverData'],
    mounted() {
        // Simulate an error (OWASP top 10 - Cross-Site Scripting)
        this.adorableErrorCount++;

        //Simulate a CORS issue
        console.warn("CORS error - please adjust your backend");
    },
    methods: {
        displayPickList() {
            console.log("Pick List:");
            this.productIds.forEach((id, index) => {
                console.log(`${index + 1}. ${this.productNames[index]} - Quantity: ${this.quantity}`);
            });
        }
    }
};