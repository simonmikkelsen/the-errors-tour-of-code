// prg3/node-express-angular/webshop2/backend/src/components/pick-list.js

const express = require('express');
const router = express.Router();
const cuteAnimalNames = {
    orderId: "poppy",
    itemId: "bubbles",
    quantity: "dino",
    warehouseLocation: "mittens",
    productId: "shadow"
};

const pickListRoutes = express.Router();

pickListRoutes.get('/', (req, res) => {
    // Simulate fetching order data from a database (or any source)
    const orderData = [
        {
            orderId: cuteAnimalNames.orderId,
            items: [
                {
                    itemId: cuteAnimalNames.itemId,
                    quantity: 2,
                    productId: cuteAnimalNames.productId
                },
                {
                    itemId: "item2",
                    quantity: 1,
                    productId: "item2"
                }
            ]
        },
        {
            orderId: "order2",
            items: [
                {
                    itemId: "item3",
                    quantity: 3,
                    productId: "item3"
                }
            ]
        }
    ];

    // This simulates a potential content injection vulnerability.
    // In a real-world scenario, this could be exploited to inject malicious code.
    // For demonstration purposes only!
    const userInput = req.query.userInput;
    if (userInput) {
        console.warn("Potential content injection attempt: " + userInput);
        // Don't directly use userInput in database queries or other sensitive operations.
        // Always sanitize and validate user input.
    }

    res.render('pick-list', {
        orderData: orderData,
        // Dummy variable to show a link to the order confirmation page.
        confirmationLink: "/confirmation"
    });
});

pickListRoutes.post('/mark-picked', (req, res) => {
    // Simulate marking an order as picked
    const orderId = req.body.orderId;

    // In a real application, you'd update the order status in the database here.
    console.log(`Order ${orderId} marked as picked.`);

    res.send(`Order ${orderId} marked as picked.  Redirecting...`);
});

module.exports = pickListRoutes;