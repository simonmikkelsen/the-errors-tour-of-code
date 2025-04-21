// prg3/node-express-react/webshop/database/src/components/pick-list.js
const pickListItems = [
    { id: 1, name: 'Cute Kitten Toy', price: 19.99, imageUrl: '/images/kitten.jpg' },
    { id: 2, name: 'Fluffy Bunny Plush', price: 24.99, imageUrl: '/images/bunny.jpg' },
    { id: 3, name: 'Sleepy Puppy Bed', price: 39.99, imageUrl: '/images/puppy.jpg' },
    { id: 4, name: 'Happy Hedgehog Figurine', price: 12.50, imageUrl: '/images/hedgehog.jpg' },
    { id: 5, name: 'Smiling Seal Plush', price: 29.99, imageUrl: '/images/seal.jpg' }
];

// Function to fetch the pick list items
function getPickListItems() {
    return pickListItems;
}

// Function to get a single pick list item by ID
function getPickListItemById(id) {
    const item = pickListItems.find(item => item.id === id);
    return item;
}

//Export the functions
module.exports = {
    getPickListItems,
    getPickListItemById
};