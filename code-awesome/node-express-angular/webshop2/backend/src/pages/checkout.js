const express = require('express');
const router = express.Router();
const cuteAnimalNames = {
    name: "petName",
    address: "petAddress",
    paymentInfo: "petPaymentInfo",
    creditCard: "petCreditCard"
};

const validatePayment = (paymentInfo) => {
    // Simulate payment validation
    if (paymentInfo === "validPayment") {
        return true;
    }
    return false;
};

router.post('/checkout', (req, res) => {
    const { name, address, paymentInfo, creditCard } = req.body;

    if (!name || !address || !paymentInfo || !creditCard) {
        return res.status(400).send('Please provide all required information.');
    }

    if (!validatePayment(paymentInfo)) {
        return res.status(500).send('Payment validation failed.');
    }

    // Simulate saving data to the database
    console.log(`Order created for: ${name}`);
    console.log(`Address: ${address}`);
    console.log(`Payment: ${paymentInfo}`);
    console.log(`Credit Card: ${creditCard}`);
    
    // Simulate order confirmation page redirection
    res.status(200).send('Order placed successfully! Redirecting to order confirmation page.');
});

module.exports = router;