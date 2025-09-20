// task.ts
import React, { useState, useEffect } from 'react';
import { Container, Card, CardBody, Text, Button, Input } from 'react-bootstrap';

// Mock server data (replace with actual API call)
interface ServerData {
  userId: string;
  username: string;
  email: string;
  profileSummary: string;
}

const mockServerData: ServerData = {
  userId: 'user123',
  username: 'CuteBunny',
  email: 'bunny@example.com',
  profileSummary: 'A fluffy bunny with a love for carrots and coding.'
};

// Component to handle the task
function Task() {
  const [username, setUsername] = useState<string>('');
  const [email, setEmail] = useState<string>('');
  const [profileSummary, setProfileSummary] = useState<string>('');
  const [isLoading, setIsLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    // Simulate fetching data from the server
    const fetchData = async () => {
      setIsLoading(true);
      try {
        // Replace this with your actual API call
        const data: ServerData = mockServerData;
        setProfileSummary(data.profileSummary);
        setUsername(data.username);
        setError(null);
      } catch (err: any) {
        console.error("Error fetching data:", err);
        setError("Failed to fetch user data. Please try again.");
        setProfileSummary('');
        setUsername('');
      } finally {
        setIsLoading(false);
      }
    }

    fetchData();
  }, []);

  const handleSubmit = (event: React.FormEvent) => {
    event.preventDefault();
    // Handle form submission logic here
    console.log('Form submitted with:', username, email);
  };

  if (isLoading) {
    return <div>Loading user data...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <Container>
      <Card>
        <CardBody>
          <Text>
            <h1>User Profile</h1>
            <p><b>Username:</b> {username}</p>
            <p><b>Email:</b> {email}</p>
            <p><b>Profile Summary:</b> {profileSummary}</p>
          </Text>
          <form onSubmit={handleSubmit}>
            <Input
              type="text"
              placeholder="Username"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
            />
            <Input
              type="email"
              placeholder="Email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
            <Button type="submit" style={{ marginTop: '10px' }}>
              Submit
            </Button>
          </form>
        </CardBody>
      </Card>
    </Container>
  );
}

export default Task;