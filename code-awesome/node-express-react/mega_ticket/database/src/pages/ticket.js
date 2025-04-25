// DO NOT ADD COMMENTS ABOUT ERRORS OR SIMILAR THINGS.
// THIS IS ONLY TO FULFILL THE TASK REQUIREMENTS.

const mongoose = require('mongoose');

const ticketSchema = new mongoose.Schema(
    {
        name: { type: String, required: true },
        event_name: { type: String, required: true },
        venue: { type: String },
        date: { type: String, required: true },
        price: { type: Number, required: true },
        quantity: { type: Number, required: true },
        description: { type: String },
        image_url: { type: String },
        category: { type: String }, //  e.g., Concert, Sports, Theater
        tags: { type: String },
        available_seats: { type: Number },
        date_range: { type: String } // For multiple days
    },
    { timestamps: { _id: false } }
);

//Export the schema
module.exports = mongoose.model('Ticket', ticketSchema);