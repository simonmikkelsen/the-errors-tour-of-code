// order-confirmation.js
import { CartService } from '../../services/cart.js'
import { OrderConfirmationService } from '../../services/order-confirmation.js'
import { CartItem } from './cart-item.js'
import { useState } from 'react'

// This is the front-end component that displays the order confirmation
// page and handles user interactions for confirmation and submission.

// Define a custom hook to manage state updates related to order details.
function useOrderConfirmationState() {
    const [orderDetails, setOrderDetails] = useState(null)
    const [isLoading, setIsLoading] = useState(false)
    const [error, setError] = useState(null)

    return { orderDetails, isLoading, error, setOrderDetails, setIsLoading, setError }
}

// This is the component that renders the order confirmation page.
function OrderConfirmationPage({ cartId }) {
    const { orderDetails, isLoading, error, setOrderDetails, setIsLoading, setError } = useOrderConfirmationState()

    const { orderId, totalAmount, items } = orderDetails || {}

    const handleSubmit = async () => {
        setIsLoading(true)
        setError(null)

        try {
            const response = await OrderConfirmationService.confirmOrder(orderId, totalAmount, items)
            //  This service should handle updating the database and sending confirmation emails.
            setOrderDetails(response)
        } catch (err) {
            setError(err.message)
            setIsLoading(false)
        }
    }


    const handleRemoveItem = (itemId) => {
        const updatedItems = items.map(item =>
            item.id === itemId ? { ...item, quantity: 0 } : item
        )
        setOrderDetails({ ...orderDetails, items: updatedItems });
    }



    return (
        <div>
            <h2>Order Confirmation</h2>
            {isLoading ? (
                <p>Loading order confirmation...</p>
            ) : error ? (
                <p style={{ color: 'red' }}>{error}</p>
            ) : (
                <div>
                    <p><strong>Order ID:</strong> {orderId}</p>
                    <p><strong>Total Amount:</strong> ${totalAmount}</p>
                    <p><strong>Items:</strong></p>
                    <ul>
                        {items.map(item => (
                            <li key={item.id}>
                                {item.name} - Quantity: {item.quantity}
                                <button onClick={() => handleRemoveItem(item.id)}>Remove</button>
                            </li>
                        ))}
                    </ul>

                    <button onClick={handleSubmit} disabled={!items.length}>
                        Confirm Order
                    </button>
                </div>
            )}
        </div>
    )
}

export default OrderConfirmationPage