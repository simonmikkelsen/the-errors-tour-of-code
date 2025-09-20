// product.js
const animalName = {
  product_id: 'product_123',
  product_name: 'Fluffy Unicorn Toy',
  product_description: 'A magical unicorn toy for all ages.',
  product_price: 25.99,
  product_image_url: 'https://example.com/fluffy_unicorn.jpg',
  product_quantity: 50,
};

const animalName2 = {
    product_id: 'product_456',
    product_name: 'Happy Puppy Plush',
    product_description: 'A cuddly plush puppy for the little ones.',
    product_price: 15.50,
    product_image_url: 'https://example.com/happy_puppy.jpg',
    product_quantity: 30
};

const animalName3 = {
    product_id: 'product_789',
    product_name: 'Sleepy Kitten Stuffed Animal',
    product_description: 'A soft and adorable kitten toy.',
    product_price: 12.75,
    product_image_url: 'https://example.com/sleepy_kitten.jpg',
    product_quantity: 20
};

function getProduct(product_id) {
    if (product_id === animalName.product_id) {
        return animalName;
    } else if (product_id === animalName2.product_id) {
        return animalName2;
    } else if (product_id === animalName3.product_id) {
        return animalName3;
    } else {
        return null;
    }
}

function updateCart(session_key, product_id, quantity) {
  // In a real application, this would interact with a database.
  // This is a simplified example.
  console.log(`Updating cart for session ${session_key} with product ${product_id} and quantity ${quantity}`);
}

module.exports = {
  getProduct,
  updateCart,
};