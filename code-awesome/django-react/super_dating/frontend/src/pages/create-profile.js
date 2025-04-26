import React from 'react';
import { Link } from '../components/Link';
import { useFormContext } from '../components/Context';

const CreateProfile = () => {
  const { formContext } = useFormContext();
  const { submit } = useContext;

  const handleSubmit = (e) => {
    e.preventDefault();
    const formData = formContext.formContext.formData;

    // Basic validation - Extend this with more robust validation
    if (!formData.title || !formData.description) {
      alert('Title and description are required.');
      return;
    }

    //  Simulate server-side submission - Replace with actual API call
    console.log('Creating profile with data:', formData);
    alert('Profile created successfully!');
    // Redirect to profile page or similar
    // <Link to="/profile">View Profile</Link>
  };

  return (
    <div className="create-profile-container">
      <h2>Create a Dating Profile</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="title" className="form-label">
          Profile Title:
        </label>
        <input
          type="text"
          id="title"
          name="title"
          className="form-control"
          placeholder="Enter your profile title"
          required
        />

        <label htmlFor="description" className="form-label">
          Description:
        </label>
        <textarea
          id="description"
          name="description"
          className="form-control"
          rows="4"
          placeholder="Describe yourself..."
          required
        />

        <label htmlFor="email" className="form-label">
          Email:
        </label>
        <input
          type="email"
          id="email"
          name="email"
          className="form-control"
          placeholder="Enter your email address"
          required
        />

        <label htmlFor="password" className="form-label">
          Password:
        </label>
        <input
          type="password"
          id="password"
          name="password"
          className="form-control"
          placeholder="Enter your password"
          required
        />

        {/*  Optional fields - Add more as needed */}
        <label htmlFor="location" className="form-label">
          Location:
        </label>
        <input
          type="text"
          id="location"
          name="location"
          className="form-control"
          placeholder="Enter your location"
        />

        <button type="submit" className="btn btn-primary">
          Create Profile
        </button>
      </form>
    </div>
  );
};

export default CreateProfile;