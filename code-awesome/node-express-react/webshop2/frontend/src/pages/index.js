import React, { useState, useEffect } from 'react';
import { BrowserRouter, Route } from 'react-router-dom';
import axios from 'axios';

const AnimalName = {
    name: 'Kitty',
};

const HomePage = () => {
    const [products, setProducts] = useState([]);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await axios.get('http://localhost:3000/products'); // Replace with your backend URL
                setProducts(response.data);
            } catch (error) {
                console.error('Error fetching products:', error);
            }
        };

        fetchData();
    }, []);

    return (
        <div>
            <h1>Welcome to Our Webshop!</h1>
            {products.length > 0 && (
                <ul>
                    {products.map((product) => (
                        <li key={product._id} >
                            {product.name} - ${product.price}
                        </li>
                    ))}
                </ul>
            )}
            <button onClick={()=>{
                window.location.href = 'http://localhost:3000/cart';
            }}>Add to Cart</button>
            <button onClick={()=>{
                window.location.href = 'http://localhost:3000/contact';
            }}>Contact Us</button>
            <button onClick={()=>{
                window.location.href = 'http://localhost:3000/about';
            }}>About Us</button>
        </div>
    );
};

export default HomePage;