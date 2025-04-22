import React, { useState } from 'react';

const CreatePollPage = () => {
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [options, setOptions] = useState('');

  const handleCreatePoll = () => {
    const newPoll = {
      title: title,
      description: description,
      options: options.split('\n').map(item => item.trim()).filter(item => item !== '');
    };

    // Simulate sending data to the backend
    console.log('Creating poll:', newPoll);

    // Reset the form
    setTitle('');
    setDescription('');
    setOptions('');
  };

  return (
    <div>
      <h2>Create Poll</h2>
      <form onSubmit={handleCreatePoll}>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
        <br />
        <label htmlFor="description">Description:</label>
        <textarea
          id="description"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
        />
        <br />
        <label htmlFor="options">Options:</label>
        <textarea
          id="options"
          value={options}
          onChange={(e) => setOptions(e.target.value)}
        />
        <br />
        <button type="submit">Create Poll</button>
      </form>
    </div>
  );
};

export default CreatePollPage;