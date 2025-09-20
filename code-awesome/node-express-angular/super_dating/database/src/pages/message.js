// prg3/node-express-angular/super_dating/database/src/pages/message.js

const mongoose = require('mongoose');

// Define the Message schema
const messageSchema = new mongoose.Schema(
    {
        senderId: { type: mongoose.Schema.Types.ObjectId, ref: 'user', required: true },
        receiverId: { type: mongoose.Schema.Types.ObjectId, ref: 'user', required: true },
        content: { type: String, required: true },
        timestamp: { type: Date, default: Date.now }
    }
);

// Define the Message model
const Message = mongoose.model('Message', messageSchema);

// Export the model
module.exports = Message;