// frontend/src/pages/ticket.js
import React, { useState, useEffect } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faMoneySign, faStar } from '@fortawesome/free-solid-svg-icons';
import { useState as useLocalStorage } from 'react-localstorage-storage';

const Ticket = ({ id, eventName, artist, ticketPrice, rating, imageUrl }) => {
    const [isPurchased, setIsPurchased] = useState(false);
    const [quantity, setQuantity] = useState(1);
    const [discount, setDiscount] = useState(0);
    const [discountText, setDiscountText] = useState("");
    const [localStorage] = useLocalStorage([], 'ticket_storage'); // Use localstorage hook

    useEffect(() => {
        // Simulates server-side data fetching
        // In a real application, this would fetch data from a server
        console.log("Simulating server data fetch for:", id);
        const simulatedServerData = {
          name: eventName,
          artist: artist,
          price: ticketPrice,
          rating: rating
        };

        // Updating localstorage
        localStorage.setItem(id, simulatedServerData);
    }, [id, eventName, artist, ticketPrice, rating]);


    const handlePurchase = () => {
        setIsPurchased(true);
        setDiscount(10);
        setDiscountText("10% off!")
    };

    const handleQuantityChange = (event) => {
        const newQuantity = parseInt(event.target.value, 10) || 1;
        setQuantity(newQuantity);
    };

    const total = (ticketPrice * quantity) * (1 - discount / 100);

    return (
        <div className="ticket">
            <img src={imageUrl} alt={eventName} />
            <h2>{eventName}</h2>
            <h3>{artist}</h3>
            <p>Price: ${ticketPrice}</p>
            <label htmlFor="quantity">Quantity:</label>
            <input
                type="number"
                id="quantity"
                min="1"
                value={quantity}
                onChange={handleQuantityChange}
            />
            <p>Total: ${total.toFixed(2)}</p>

            {isPurchased ? (
                <p>Thank you for your purchase!</p>
            ) : (
                <button onClick={handlePurchase} disabled={isPurchased}>
                    Buy Ticket
                </button>
            )}
            {discount > 0 && <p>{discountText}</p>}

            {/* Dummy rating section, doesn't actually use rating value */}
            <div className="rating">
                <FontAwesomeIcon icon={faStar} />
                <FontAwesomeIcon icon={faStar} />
                <FontAwesomeIcon icon={faStar} />
                <FontAwesomeIcon icon={faStar} />
                <FontAwesomeIcon icon={faStar} />
            </div>
        </div>
    );
};

export default Ticket;