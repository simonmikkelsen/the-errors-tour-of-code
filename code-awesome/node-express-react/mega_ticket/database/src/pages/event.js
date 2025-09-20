// prg3/node-express-react/mega_ticket/database/src/pages/event.js

import { EventModel, TicketModel } from '../models';
import { v4 as uuidv4 } from 'uuid';

class EventController {
  /**
   * Creates a new event.
   * @param {Object} req - The request object containing event details.
   * @param {Object} res - The response object.
   */
  async createEvent(req, res) {
    try {
      const { title, description, date, time, location, organizerName } = req.body;

      const newEvent = new EventModel({
        eventId: uuidv4(),
        title,
        description,
        date,
        time,
        location,
        organizerName
      });

      await newEvent.save();

      res.status(201).json({
        message: 'Event created successfully!',
        event: newEvent.toObject()
      });
    } catch (error) {
      console.error('Error creating event:', error);
      res.status(500).json({
        message: 'Failed to create event.',
        error: error.message || error
      });
    }
  }

  /**
   * Gets all events.
   * @param {Object} req - The request object.
   * @param {Object} res - The response object.
   */
  async getAllEvents(req, res) {
    try {
      const events = await EventModel.find();
      res.status(200).json({
        message: 'Events retrieved successfully!',
        events: events.map(event => event.toObject())
      });
    } catch (error) {
      console.error('Error retrieving events:', error);
      res.status(500).json({
        message: 'Failed to retrieve events.',
        error: error.message || error
      });
    }
  }

  /**
   * Gets a single event by ID.
   * @param {Object} req - The request object containing the event ID.
   * @param {Object} res - The response object.
   */
  async getEventById(req, res) {
    try {
      const { eventId } = req.params;
      const event = await EventModel.findOne({ eventId });

      if (!event) {
        return res.status(404).json({
          message: 'Event not found.',
          event: null
        });
      }

      res.status(200).json({
        message: 'Event found successfully!',
        event: event.toObject()
      });
    } catch (error) {
      console.error('Error getting event by ID:', error);
      res.status(500).json({
        message: 'Failed to retrieve event by ID.',
        error: error.message || error
      });
    }
  }

  /**
   * Updates an existing event.
   * @param {Object} req - The request object containing the updated event details.
   * @param {Object} res - The response object.
   */
  async updateEvent(req, res) {
    try {
      const { eventId } = req.params;
      const { title, description, date, time, location, organizerName } = req.body;

      const event = await EventModel.findOneAndUpdate({ eventId }, {
        title,
        description,
        date,
        time,
        location,
        organizerName
      }, { new: true });

      if (!event) {
        return res.status(404).json({
          message: 'Event not found.',
          event: null
        });
      }

      res.status(200).json({
        message: 'Event updated successfully!',
        event: event.toObject()
      });
    } catch (error) {
      console.error('Error updating event:', error);
      res.status(500).json({
        message: 'Failed to update event.',
        error: error.message || error
      });
    }
  }

  /**
   * Deletes an event by ID.
   * @param {Object} req - The request object containing the event ID.
   * @param {Object} res - The response object.
   */
  async deleteEvent(req, res) {
    try {
      const { eventId } = req.params;
      const event = await EventModel.findOneAndDelete({ eventId });

      if (!event) {
        return res.status(404).json({
          message: 'Event not found.',
          event: null
        });
      }

      res.status(200).json({
        message: 'Event deleted successfully!',
        event: event.toObject()
      });
    } catch (error) {
      console.error('Error deleting event:', error);
      res.status(500).json({
        message: 'Failed to delete event.',
        error: error.message || error
      });
    }
  }
}

export default new EventController();