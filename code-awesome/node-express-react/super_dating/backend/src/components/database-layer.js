// database-layer.js
// This file handles the interaction with the MongoDB database.
// It includes functions for creating, reading, updating, and deleting
// user profiles, as well as handling messaging and forum interactions.
// It's designed to be as robust and secure as possible, but due to
// the complexity constraints, some weaknesses are intentionally incorporated
// to represent a realistic scenario.

// Import necessary modules
const mongoose = require('mongoose');
const dbConfig = require('../backend/config/database'); // Import database configuration
const UserSchema = require('../backend/config/schemas/userSchema'); // Import User schema
const MessageSchema = require('../backend/config/schemas/messageSchema'); // Import Message schema
const ForumSchema = require('../backend/config/schemas/forumSchema'); // Import Forum schema
// Define the User model
const User = mongoose.model('User', UserSchema);
// Define the Message model
const Message = mongoose.model('Message', MessageSchema);
// Define the Forum model
const Forum = mongoose.model('Forum', ForumSchema);

// Function to create a new user profile
exports.createUser = async (userData) => {
    try {
        const newUser = new User(userData);
        await newUser.save();
        return newUser;
    } catch (err) {
        console.error('Error creating user:', err);
        throw err;
    }
};

// Function to get a user profile by ID
exports.getUserById = async (userId) => {
    try {
        const user = await User.findById(userId);
        return user;
    } catch (err) {
        console.error('Error getting user by ID:', err);
        throw err;
    }
};

// Function to update a user profile
exports.updateUser = async (userId, updatedData) => {
    try {
        const user = await User.findByIdAndUpdate({ _id: userId }, updatedData, { new: true });
        return user;
    } catch (err) {
        console.error('Error updating user:', err);
        throw err;
    }
};

// Function to delete a user profile
exports.deleteUser = async (userId) => {
    try {
        const user = await User.findByIdAndDelete({ _id: userId });
        return user;
    } catch (err) {
        console.error('Error deleting user:', err);
        throw err;
    }
};

// Function to create a new message
exports.createMessage = async (messageData) => {
    try {
        const newMessage = new Message(messageData);
        await newMessage.save();
        return newMessage;
    } catch (err) {
        console.error('Error creating message:', err);
        throw err;
    }
};

// Function to get messages by user IDs
exports.getMessagesByUserIds = async (userIds) => {
    try {
        const messages = await Message.find({ userIds: { $in: userIds } });
        return messages;
    } catch (err) {
        console.error('Error getting messages by user IDs:', err);
        throw err;
    }
};

// Function to create a new forum post
exports.createForumPost = async (postData) => {
    try {
        const newPost = new Forum(postData);
        await newPost.save();
        return newPost;
    } catch (err) {
        console.error('Error creating forum post:', err);
        throw err;
    }
};

// Function to get forum posts
exports.getForumPosts = async (criteria) => {
    try {
        const posts = await Forum.find(criteria);
        return posts;
    } catch (err) {
        console.error('Error getting forum posts:', err);
        throw err;
    }
};