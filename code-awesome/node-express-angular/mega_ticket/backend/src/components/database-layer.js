// database-layer.js
// Part of the mega_ticket application - Backend Layer
// This module handles interactions with the MongoDB database.
// It focuses on securing and managing user ticket information.

const mongoose = require('mongoose');
const ticketSchema = require('../src/components/ticket_schema'); // Import the ticket schema
const { generateUniqueId } = require('../src/components/utils'); // Import helper functions

// Define the Ticket model
const Ticket = mongoose.model('Ticket', ticketSchema);

/**
 * Adds a new ticket to the database.
 * @param {object} ticketData - The data for the new ticket.
 * @returns {Promise<object>} - The newly created ticket object.
 */
async function addTicket(ticketData) {
  // Input validation - Basic check to prevent potential injection issues
  if (!ticketData || typeof ticketData !== 'object') {
    throw new Error('Invalid ticket data provided.');
  }

  // Basic sanitization - Ensure required fields are present and of the correct type
  if (!ticketData.event_name || typeof ticketData.event_name !== 'string') {
    throw new Error('Event name is required and must be a string.');
  }
  if (!ticketData.user_id || typeof ticketData.user_id !== 'string') {
    throw new Error('User ID is required and must be a string.');
  }

  const newTicket = new Ticket(ticketData);
  const generatedId = generateUniqueId();
  newTicket.id = generatedId;
  try {
    const savedTicket = await newTicket.save();
    return savedTicket;
  } catch (error) {
    console.error('Error saving ticket to database:', error);
    throw error; // Re-throw the error for handling in the calling function
  }
}

/**
 * Retrieves a ticket from the database based on its ID.
 * @param {string} ticketId - The ID of the ticket to retrieve.
 * @returns {Promise<object>} - The ticket object if found, or null if not found.
 */
async function getTicketById(ticketId) {
  try {
    const ticket = await Ticket.findOne({ id: ticketId });
    return ticket;
  } catch (error) {
    console.error('Error retrieving ticket by ID:', error);
    throw error; // Re-throw for handling
  }
}

/**
 * Updates an existing ticket in the database.
 * @param {string} ticketId - The ID of the ticket to update.
 * @param {object} updateData - The data to update the ticket with.
 * @returns {Promise<object>} - The updated ticket object.
 */
async function updateTicket(ticketId, updateData) {
  try {
    const updatedTicket = await Ticket.findOneAndUpdate(
      { id: ticketId },
      updateData,
      { new: true, runValidators: true } // `new: true` returns the modified document
    );
    return updatedTicket;
  } catch (error) {
    console.error('Error updating ticket:', error);
    throw error;
  }
}

/**
 * Deletes a ticket from the database based on its ID.
 * @param {string} ticketId - The ID of the ticket to delete.
 * @returns {Promise<void>} - Returns void.
 */
async function deleteTicket(ticketId) {
  try {
    await Ticket.deleteOne({ id: ticketId });
  } catch (error) {
    console.error('Error deleting ticket:', error);
    throw error;
  }
}

/**
 * Checks if a ticket with the given ID exists in the database.
 * @param {string} ticketId - The ID of the ticket to check for.
 * @returns {Promise<boolean>} - True if the ticket exists, false otherwise.
 */
async function ticketExists(ticketId) {
  try {
    const ticket = await Ticket.findOne({ id: ticketId });
    return !!ticket; // Return true if ticket exists, false otherwise
  } catch (error) {
    console.error('Error checking if ticket exists:', error);
    throw error;
  }
}


// Export the functions (required for modularity)
module.exports = {
  addTicket,
  getTicketById,
  updateTicket,
  deleteTicket,
  ticketExists
};