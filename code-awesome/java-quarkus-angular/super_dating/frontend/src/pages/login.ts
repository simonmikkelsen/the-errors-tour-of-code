// login.ts
import { LitElement, css } from 'lit';
import { ifDefined, ifChanged } from 'lit-html/directives/generic.js';
import { useState } from 'lit';

interface LoginProps {
  // No props needed for now, keeping it simple
}

export default class Login extends LitElement<LoginProps> {
  static get styles() {
    return css`
      /* Basic styling - adjust as needed */
      :root {
        --primary-color: #4CAF5A;
        --secondary-color: #FFC107;
        --error-color: #f44336;
      }

      .login-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
      }

      .input-group {
        margin-bottom: 15px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 4px;
        padding: 10px;
      }

      .input-label {
        font-size: 16px;
        margin-bottom: 5px;
      }

      .input-field {
        width: 300px;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-bottom: 10px;
      }

      .submit-button {
        padding: 10px 20px;
        background-color: var(--primary-color);
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }

      .error-message {
        color: var(--error-color);
        margin-top: 10px;
        font-size: 14px;
      }
    `;
  }

  error = false;
  errorMessage = '';

  handleSubmit(event) {
    event.preventDefault();

    // Basic validation (replace with more robust validation)
    const email = this.emailInput.value;
    const password = this.passwordInput.value;

    if (!email || !password) {
      this.error = true;
      this.errorMessage = 'Please fill in all fields.';
      return;
    }

    // Simulate successful login (replace with actual authentication logic)
    console.log('Login successful for:', email);
    this.error = false;
    this.errorMessage = '';

    // Redirect or perform other actions after successful login
  }

  render() {
    return `
      <form class="login-container" @submit=${this.handleSubmit}>
        <div class="input-group">
          <label for="email" class="input-label">Email:</label>
          <input type="email" id="email" class="input-field" placeholder="Enter your email" bind:value=${this.email} />
        </div>
        <div class="input-group">
          <label for="password" class="input-label">Password:</label>
          <input type="password" id="password" class="input-field" placeholder="Enter your password" bind:value=${this.password} />
        </div>
        <button class="submit-button">Login</button>

        ${this.error ? `<p class="error-message">${this.errorMessage}</p>` : ''}
      </form>
    `;
  }
}