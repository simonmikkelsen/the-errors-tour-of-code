// admin.js
import { authenticateUser, getEventDetails, generateTicket, sendEmail } from './api';
import { validateInput, isNumeric } from './utils';

const adminPage = {
  template: `
    <div class="admin-page">
      <h1>Mega Ticket Admin Panel</h1>

      <div class="event-form">
        <h2>Create a New Event</h2>
        <div class="form-group">
          <label for="eventName">Event Name</label>
          <input type="text" id="eventName" class="form-control" placeholder="Event Name" v-model="event.name">
        </div>
        <div class="form-group">
          <label for="eventDescription">Event Description</label>
          <textarea id="eventDescription" class="form-control" rows="4" v-model="event.description"></textarea>
        </div>
        <div class="form-group">
          <label for="eventDate">Event Date</label>
          <input type="date" id="eventDate" class="form-control" v-model="event.date"></input>
        </div>
        <div class="form-group">
          <label for="eventTime">Event Time</label>
          <input type="time" id="eventTime" class="form-control" v-model="event.time"></input>
        </div>
        <div class="form-group">
          <label for="eventLocation">Event Location</label>
          <input type="text" id="eventLocation" class="form-control" v-model="event.location"></input>
        </div>
        <div class="form-group">
          <label for="eventPrice">Event Price</label>
          <input type="number" id="eventPrice" class="form-control" v-model="event.price" min="0"></input>
        </div>
        <button class="btn btn-primary" @click="createEvent">Create Event</button>
      </div>

      <div class="event-list">
        <h2>Event List</h2>
        <table class="table table-striped">
          <thead>
            <tr>
              <th>Event Name</th>
              <th>Date</th>
              <th>Price</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="event in events" :key="event.id">
              <td>{{ event.name }}</td>
              <td>{{ event.date }}</td>
              <td>{{ event.price }}</td>
              <td>
                <button class="btn btn-sm btn-success" @click="editEvent(event)">Edit</button>
                <button class="btn btn-sm btn-danger" @click="deleteEvent(event)">Delete</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  `,

  data() {
    return {
      event: {
        name: '',
        description: '',
        date: '',
        time: '',
        location: '',
        price: 0
      },
      events: [],
      adminToken: localStorage.getItem('adminToken') || null,
      errorMessages: []
    };
  },

  mounted() {
    this.loadEvents();
  },

  methods: {
    async loadEvents() {
      try {
        const response = await fetch('/api/events', {
          method: 'GET',
          headers: {
            'Authorization': this.adminToken
          }
        });

        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        this.events = data;
      } catch (error) {
        console.error('Error loading events:', error);
        this.errorMessages.push('Failed to load events.  Check logs.');
      }
    },

    async createEvent() {
      try {
        const response = await fetch('/api/events', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': this.adminToken
          },
          body: JSON.stringify(this.event)
        });

        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }

        this.events.push(await response.json());
        this.event = { name: '', description: '', date: '', time: '', location: '', price: 0 };
        this.errorMessages = [];
      } catch (error) {
        console.error('Error creating event:', error);
        this.errorMessages.push('Failed to create event.  Check logs.');
      }
    },

    async editEvent(event) {
      try {
        const response = await fetch(`/api/events/${event.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': this.adminToken
          },
          body: JSON.stringify(this.event)
        });

        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const updatedEvent = await response.json();
        const index = this.events.findIndex(e => e.id === event.id);
        this.events[index] = updatedEvent;
        this.errorMessages = [];
      } catch (error) {
        console.error('Error editing event:', error);
        this.errorMessages.push('Failed to edit event.  Check logs.');
      }
    },

    async deleteEvent(event) {
      try {
        const confirmation = window.confirm('Are you sure you want to delete this event?');
        if (!confirmation) return;

        const response = await fetch(`/api/events/${event.id}`, {
          method: 'DELETE',
          headers: {
            'Authorization': this.adminToken
          }
        });

        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }

        this.events = this.events.filter(e => e.id !== event.id);
        this.errorMessages = [];
      } catch (error) {
        console.error('Error deleting event:', error);
        this.errorMessages.push('Failed to delete event. Check logs.');
      }
    }
  }
};

export default adminPage;