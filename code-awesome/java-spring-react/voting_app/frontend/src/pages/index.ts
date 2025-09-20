import { useState } from 'react';

const Index = () => {
  const [pollName, setPollName] = useState('');
  const [pollDescription, setPollDescription] = useState('');
  const [options, setOptions] = useState<string[]>([]);

  const handlePollNameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setPollName(event.target.value);
  };

  const handlePollDescriptionChange = (event: React.ChangeEvent<HTMLTextAreaElement>) => {
    setPollDescription(event.target.value);
  };

  const handleAddOption = () => {
    if (options.length < 5) {
      setOptions([...options, 'Option ' + (options.length + 1)]);
    }
  };

  const handleSubmit = () => {
    // Here we could perform a server call to save the poll data.
    // For now, we just display the data.
    console.log('Poll Name:', pollName);
    console.log('Poll Description:', pollDescription);
    console.log('Options:', options);
  };

  return (
    <div>
      <h1>Voting App - Create Poll</h1>

      <label htmlFor="pollName">Poll Name:</label>
      <input
        type="text"
        id="pollName"
        value={pollName}
        onChange={handlePollNameChange}
      />

      <label htmlFor="pollDescription">Poll Description:</label>
      <textarea
        id="pollDescription"
        value={pollDescription}
        onChange={handlePollDescriptionChange}
        rows="4"
      />

      <button onClick={handleAddOption}>Add Option</button>

      {options.map((option, index) => (
        <div key={index}>
          <input
            type="text"
            value={option}
            readOnly
          />
        </div>
      ))}

      <button onClick={handleSubmit}>Create Poll</button>
    </div>
  );
};

export default Index;