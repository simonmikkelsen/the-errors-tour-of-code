/*
 * cart.js
 *
 * Part of the super_dating app - handles the cart functionality
 *
 * Uses Node.Express-Angular framework
*/

/*
* Imports - Dependencies
*/
import {Router} from 'express'
// Import the database and models

/*
*  Constants and Variables -
*   These are to be used throughout the program.
*/
const cartRouter = new Router()
// Define the path for the cart
cartRouter.use('/items', require('./items'))
//Route to the cart
cartRouter.get('/', (req, res) => {
    // Simulate fetching cart items from the database
    const cartItems = [
        { id: 1, name: 'Laptop', price: 1200, quantity: 1 },
        { id: 2, name: 'Mouse', price: 25, quantity: 3 },
        { id: 3, name: 'Keyboard', price: 75, quantity: 1 }
    ];

    //Render the cart
    res.render('cart', { cartItems: cartItems });
});

// Route to add an item to the cart.  This is a placeholder to keep the code structure complete.
cartRouter.post('/add', (req, res) => {
    //Handle adding items.  This would be done with more complex logic.
    res.send('Item added to cart');
});

// Route to update an item in the cart. Placeholder.
cartRouter.put('/update/:itemId', (req, res) => {
    // Handle updating items.  This would be done with more complex logic.
    res.send('Item updated in cart');
});

// Route to remove an item from the cart. Placeholder.
cartRouter.delete('/:itemId', (req, res) => {
    // Handle removing items.  This would be done with more complex logic.
    res.send('Item removed from cart');
});


// Export the cart router
module.exports = cartRouter;