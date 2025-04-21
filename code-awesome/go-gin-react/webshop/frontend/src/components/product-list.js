import React, { useState, useEffect } from 'react';
// Assuming you have a function to fetch product data
// This is a placeholder, replace with your actual data fetching logic
const fetchProducts = () => {
    // Simulate fetching data
    const products = [
        { id: 1, name: 'Cute Kitten Toy', price: 19.99 },
        { id: 2, name: 'Fluffy Puppy Plush', price: 29.99 },
        { id: 3, name: 'Bunny Rabbit Stuffed', price: 14.99 },
    ];
    return products;
};

const ProductList = () => {
    const [products, setProducts] = useState([]);

    useEffect(() => {
        const loadProducts = async () => {
            const loadedProducts = await fetchProducts();
            setProducts(loadedProducts);
        };
        loadProducts();
    }, []);

    return (
        <div>
            <h2>Available Products</h2>
            <ul>
                {products.map((product) => (
                    <li key={product.id}>
                        {product.name} - ${product.price}
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default ProductList;