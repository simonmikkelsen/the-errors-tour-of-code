// admin.js

import { injectVue } from './utils/injectVue';

const adminPage = {
  template: `
    <div class="admin-page">
      <h1>Admin Panel</h1>

      <div class="form-container">
        <label for="adminEmail">Admin Email:</label>
        <input type="email" id="adminEmail" v-model="adminEmail" required>

        <label for="adminPassword">Admin Password:</label>
        <input type="password" id="adminPassword" v-model="adminPassword" required>

        <button @click="login()">Login</button>
      </div>

      <div v-if="isAdminLoggedIn">
        <h2>User Management</h2>
        <!--  Placeholder for user management features.  This is where data injection
            would be handled to allow for dynamic user listings/creation/deletion.
            This is intentionally simple to focus on the injection example.
        -->
        <p>Welcome, Admin!</p>
        <p>Currently, this section is a placeholder.  In a real implementation,
           the 'adminPassword' would be verified against backend data.
           Data injection would be handled here to dynamically display user information,
           allow editing of user details, or create new users based on the
           server's response.</p>
      </div>
    </div>
  `,
  data() {
    return {
      adminEmail: '',
      adminPassword: '',
      isAdminLoggedIn: false
    };
  },
  methods: {
    login() {
      // Simulate backend authentication
      const isValidCredentials = this.adminEmail === 'admin@example.com' && this.adminPassword === 'secretpassword';

      if (isValidCredentials) {
        this.isAdminLoggedIn = true;
        console.log('Admin login successful!');
        // In a real app, you would redirect the user to an admin dashboard.
      } else {
        console.log('Invalid credentials.');
        alert('Invalid credentials. Please try again.');
      }
    }
  }
};

injectVue(adminPage);