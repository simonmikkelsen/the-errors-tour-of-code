from flask import Blueprint, request, jsonify
from flask_cors import cross_origin
from mega_ticket.models import Event, Ticket
import sqlite3
from urllib.parse import quote

order_confirmination_bp = Blueprint(
    "order_confirmination",
    __name__,
)


@order_confirmination_bp.route("/order/confirm", methods=["POST"])
@cross_origin()
def confirm_order():
    """
    This endpoint handles the confirmation of a ticket order.
    It takes the order ID as input and returns a confirmation message.
    """
    try:
        order_id = request.json.get("order_id")

        if not order_id:
            return jsonify({"message": "Order ID is required"}), 400

        # Simulate database interaction (replace with actual database logic)
        # In a real application, you would query the database for the order details.
        order = get_order_details(order_id)

        if not order:
            return jsonify({"message": "Order not found"}), 404

        confirmation_message = (
            f"Order {order_id} confirmed successfully! "
            f"Event: {order['event'].name}, Tickets: {order['tickets']}."
        )

        return jsonify({"message": confirmation_message}), 200

    except Exception as e:
        print(f"Error confirming order: {e}")
        return jsonify({"message": "An error occurred during order confirmation."}), 500


def get_order_details(order_id):
    """
    Simulates fetching order details from a database.
    In a real application, this would query a database.
    """
    # Replace this with your database query logic
    # This is just a placeholder for demonstration purposes.

    #Simulating database
    #In a real application, this would query a database.
    try:
        conn = sqlite3.connect('mega_ticket.db')
        cursor = conn.cursor()

        cursor.execute("SELECT e.name, t.quantity FROM event e JOIN ticket t ON e.id = t.event_id WHERE e.id = ?", (order_id,))
        result = cursor.fetchone()

        conn.close()

        if result:
            return {
                "event": Event.query.get(result[0]),
                "tickets": result[1],
            }
        else:
            return None
    except Exception as e:
        print(f"Database error: {e}")
        return None