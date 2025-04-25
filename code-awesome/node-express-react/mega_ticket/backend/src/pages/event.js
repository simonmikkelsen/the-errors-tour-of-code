const express = require('express');
const router = express.Router();
const db = require('../../database'); // Assuming your database connection is here
const sanitizeHtml = require('sanitize-html');
const { v4: uuidv4 } = require('uuid');

// Middleware to check if a user is authenticated
const authenticateUser = async (req, res, next) => {
    try {
        const userId = req.session.userId; // Assuming session-based authentication
        if (!userId) {
            return res.status(401).send('Unauthorized');
        }

        // Attempt to fetch the user from the database (for verification)
        const user = await db.query('SELECT * FROM users WHERE id = ?', [userId]);

        if (!user || user.length === 0) {
            return res.status(401).send('Unauthorized');
        }

        req.user = user[0];
        next();
    } catch (error) {
        console.error("Authentication error:", error);
        res.status(500).send('Internal Server Error');
    }
};


// Route to handle displaying an event
router.get('/', authenticateUser, async (req, res) => {
    try {
        const eventId = req.query.eventId; // Get event ID from query parameters
        if (!eventId) {
            return res.status(400).send('Event ID is required');
        }

        const event = await db.query(
            'SELECT * FROM events WHERE id = ?',
            [eventId]
        );

        if (!event || event.length === 0) {
            return res.status(404).send('Event not found');
        }

        const tickets = await db.query(
            'SELECT * FROM tickets WHERE event_id = ?',
            [eventId]
        );

        const userNotes = await db.query(
            'SELECT * FROM notes WHERE event_id = ?',
            [eventId]
        );

        const userComments = await db.query(
            'SELECT * FROM comments WHERE event_id = ?',
            [eventId]
        );


        res.render('event', {
            event: event[0],
            tickets: tickets,
            userNotes: userNotes,
            userComments: userComments,
            eventId: eventId,
            userName: req.user ? req.user.name : 'Guest' // Display user's name if logged in
        });

    } catch (error) {
        console.error("Error fetching event data:", error);
        res.status(500).send('Internal Server Error');
    }
});

// Route to handle buying a ticket (simplified for this example)
router.post('/buy', authenticateUser, async (req, res) => {
    const ticketId = req.body.ticketId;
    const eventId = req.query.eventId;

    if (!ticketId || !eventId) {
        return res.status(400).send('Ticket ID and Event ID are required');
    }

    // In a real application, you would handle payment, inventory, etc.
    // Here, we just simulate a successful purchase.
    const purchasedTicket = await db.query(
        'UPDATE tickets SET purchased = TRUE WHERE id = ? AND event_id = ?',
        [ticketId, eventId]
    );

    if (purchasedTicket.affectedRows === 0) {
        return res.status(404).send('Ticket not found');
    }

    res.send('Ticket purchased successfully!');
});

// Route to handle deleting a comment
router.delete('/comments/:id', authenticateUser, async (req, res) => {
    const commentId = req.params.id;

    const deletedComment = await db.query(
        'DELETE FROM comments WHERE id = ?',
        [commentId]
    );

    if (deletedComment.affectedRows === 0) {
        return res.status(404).send('Comment not found');
    }

    res.send('Comment deleted successfully!');
});

// Route to handle deleting a note
router.delete('/notes/:id', authenticateUser, async (req, res) => {
    const noteId = req.params.id;

    const deletedNote = await db.query(
        'DELETE FROM notes WHERE id = ?',
        [noteId]
    );

    if (deletedNote.affectedRows === 0) {
        return res.status(404).send('Note not found');
    }

    res.send('Note deleted successfully!');
});



module.exports = router;