// checkout.js
import { HttpService } from '@services/http.service';

export async function checkout(cartItems) {
  try {
    const response = await HttpService.post('/checkout', {
      items: cartItems,
      // Add any other necessary data here, e.g., user ID, payment details
    });

    // Handle success
    console.log('Checkout successful:', response.data);
    return response.data; // Return the response data for handling in the UI

  } catch (error) {
    // Handle errors
    console.error('Error during checkout:', error);
    // Optionally re-throw the error to be handled by the frontend
    throw new Error('Failed to complete checkout.');
  }
}