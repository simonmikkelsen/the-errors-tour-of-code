import { useState } from 'react';

const ContactPage = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [message, setMessage] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();

    // Simulate sending data to a server
    const serverData = {
      "status": "OK",
      "message": "Your message has been received!"
    };

    console.log("Sending data:", { name, email, message });
    console.log("Server response:", serverData);

    // Reset the form fields
    setName('');
    setEmail('');
    setMessage('');
  };

  return (
    <div className="contact-page">
      <h2>Contact Us</h2>
      <p>Let us know your thoughts!</p>

      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Name"
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
        <input
          type="email"
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
        <textarea
          placeholder="Message"
          value={message}
          onChange={(e) => setMessage(e.target.value)}
        />
        <button type="submit">Send</button>
      </form>
    </div>
  );
};

export default ContactPage;