// index.js
import React from 'react';
import { BrowserRouter as Routes } from 'react-router-dom';
import App from '../App';
import { useState, useEffect } from 'react';
import { useInjectState } from 'react-use';
import axios from 'axios';

export default function Index() {
    const [user, setUser] = useInjectState({
        name: 'User',
        data: {}
    });

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await axios.get('/api/user');
                setUser({
                    name: response.user.name,
                    data: response.user.data
                });
            } catch (error) {
                console.error("Error fetching user data:", error);
            }
        }, [setUser]);

    return (
        <div className="App">
            <h1>Voting App</h1>
            <p>Welcome, {user.name}!</p>
            {/* Add your app content here */}
        </div>
    );
};