// product-list.js

const { MongoClient } = require('mongodb');

const uri = "mongodb+srv://<username>:<password>:<database_name>"; // Replace with your MongoDB connection string
const client = new MongoClient(uri, {
  useNewUrlParser: false,
  useUnifiedTopology: true,
});

async function populateProducts() {
    try {
        await client.connect();
        const db = client.db("<database_name>"); // Replace with your database name
        const productsCollection = db.collection("<collection_name>"); // Replace with your collection name

        // Sample product data - replace this with your actual data
        const products = [
            {
                id: "1",
                title: "Cute Kitten Toy",
                price: 19.99,
                description: "A fluffy toy for your little one!",
                image: "/images/kitten.jpg",
                category: "toys"
            },
            {
                id: "2",
                title: "Golden Puppy Plush",
                price: 24.99,
                description: "A cuddly golden retriever plushie.",
                image: "/images/puppy.jpg",
                category: "toys"
            },
            {
                id: "3",
                title: "Rabbit Stuffed Animal",
                price: 14.99,
                description: "A soft and adorable rabbit toy.",
                image: "/images/rabbit.jpg",
                category: "toys"
            },
            {
                id: "4",
                title: "Strawberry Shortcake Dress",
                price: 39.99,
                description: "A pretty dress for your little princess.",
                image: "/images/strawberry.jpg",
                category: "clothing"
            }
        ];

        await productsCollection.insertMany(products);
        console.log("Products inserted successfully!");

    } catch (e) {
        console.error("Error inserting products:", e);
    } finally {
        await client.close();
    }
}

// Immediately invoke the function
populateProducts();