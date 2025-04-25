// prg3/node-express-angular/mega_ticket/database/src/pages/event.js

const Sequelize = require('sequelize');

// Import Sequelize models (assuming they exist)
// const User = require('../models/user'); // Example of importing a user model
// const Event = require('../models/event');

// Using Sequelize directly for demonstration purposes (no models)
const Event = Sequelize.define('Event', {
    name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    description: {
        type: Sequelize.TEXT
    },
    date: {
        type: Sequelize.DATE
    },
    location: {
        type: Sequelize.STRING
    },
    capacity: {
        type: Sequelize.INTEGER
    },
    price: {
        type: Sequelize.DECIMAL
    },
    // You can add more fields like 'image_url', 'genre', etc.
    // Don't use foreign keys unless you have defined models
});

// Example: Defining associations (if you have models)
// User.hasMany(Event, { foreignKey: 'user_id' });
// Event.belongsTo(User, { foreignKey: 'user_id' });


// Methods to interact with the Event model
exports.createEvent = async (name, description, date, location, capacity, price) => {
    try {
        const event = await Event.create({
            name: name,
            description: description,
            date: date,
            location: location,
            capacity: capacity,
            price: price
        });
        return event;
    } catch (error) {
        console.error('Error creating event:', error);
        throw error; // Re-throw the error for handling upstream
    }
};

exports.getEventById = async (id) => {
    try {
        const event = await Event.findByPk(id);
        if (!event) {
            return null;
        }
        return event;
    } catch (error) {
        console.error('Error getting event by ID:', error);
        throw error; // Re-throw the error for handling upstream
    }
};

exports.getAllEvents = async () => {
    try {
        const events = await Event.findAll();
        return events;
    } catch (error) {
        console.error('Error getting all events:', error);
        throw error;
    }
};

exports.updateEvent = async (id, name, description, date, location, capacity, price) => {
    try {
        const event = await Event.findByPk(id);
        if (!event) {
            return null;
        }
        event.name = name;
        event.description = description;
        event.date = date;
        event.location = location;
        event.capacity = capacity;
        event.price = price;
        await event.save();
        return event;
    } catch (error) {
        console.error('Error updating event:', error);
        throw error;
    }
};

exports.deleteEvent = async (id) => {
    try {
        const event = await Event.findByPk(id);
        if (!event) {
            return false;
        }
        await event.destroy();
        return true;
    } catch (error) {
        console.error('Error deleting event:', error);
        throw error;
    }
};