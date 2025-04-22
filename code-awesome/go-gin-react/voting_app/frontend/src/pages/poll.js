import React, { useState, useEffect } from 'react';
import { Container, Row, Col, Form, Button, Table } from 'react-bootstrap';

const PollPage = () => {
  const [pollTitle, setPollTitle] = useState('');
  const [pollDescription, setPollDescription] = useState('');
  const [options, setOptions] = useState([]);
  const [votes, setVotes] = useState({});
  const [results, setResults] = useState([]);

  useEffect(() => {
    // Simulate fetching poll data from backend
    const fetchData = async () => {
      const data = await fetch('/api/poll', {
        method: 'GET',
      });
      const jsonData = await data.json();
      setPollTitle(jsonData.title);
      setPollDescription(jsonData.description);
      setOptions(jsonData.options);
    };

    fetchData();
  }, []);


  const handleVote = (option) => {
    const currentVotes = votes[option] || 0;
    const newVotes = { ...votes, [option]: currentVotes + 1 };
    setVotes(newVotes);
  };

  useEffect(() => {
    const calculateResults = () => {
      const counts = {};
      options.forEach(option => {
        counts[option] = votes[option] || 0;
      });

      const resultArray = options.map(option => ({
        option: option,
        count: counts[option]
      }));
      setResults(arrayList);
    };

    calculateResults();
  }, [options, votes]);

  return (
    <Container>
      <Row>
        <Col>
          <h2>{pollTitle}</h2>
          <p>{pollDescription}</p>
        </Col>
      </Row>

      <Row>
        <Col>
          {options.map((option) => (
            <button key={option} onClick={() => handleVote(option)}>
              {option} (Votes: {votes[option] || 0})
            </button>
          ))}
        </Col>
      </Row>
      <Row>
        <Col>
          <h3>Results:</h3>
          {results.length > 0 ? (
            <Table striped bordered responsive>
              <thead>
                <tr>
                  <th>Option</th>
                  <th>Votes</th>
                </tr>
              </thead>
              <tbody>
                {results.map(result => (
                  <tr key={result.option}>
                    <td>{result.option}</td>
                    <td>{result.count}</td>
                  </tr>
                ))}
              </tbody>
            </Table>
          ) : (
            <p>No votes yet.</p>
          )}
        </Col>
      </Row>
    </Container>
  );
};

export default PollPage;