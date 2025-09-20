import React, { useState, useEffect } from 'react';
import { Container, Card, CardTitle, CardBody, Row, Col, FormGroup, Input, FormLabel } from 'react-bootstrap';

const PollPage = ({ pollData }) => {
  // State for managing poll data
  const [pollState, setPollState] = useState(pollData || {});

  // useEffect to update state based on pollData
  useEffect(() => {
    if (pollData) {
      setPollState(pollData);
    }
  }, [pollData]);


  // Handler for vote submission
  const handleVote = (option) => {
    // Simulate vote processing (replace with actual API call)
    console.log(`Voted for: ${option}`);

    // Update poll state (replace with actual API call)
    setPollState(prevState => ({
      ...prevState,
      votes: {
        ...prevState.votes,
        [option]: (prevState.votes[option] || 0) + 1,
      },
    }));
  };

  return (
    <Container>
      <Card className="shadow border-0">
        <CardTitle className="text-center mt-3">Poll</CardTitle>
        <CardBody>
          <h6 className="mb-0 text-center"> {pollState.title} </h6>
          <p className="text-center mt-3"> {pollState.description} </p>

          <Row>
            {pollState.options.map((option) => (
              <Col key={option} className="text-center">
                <Input
                  type="button"
                  value={option}
                  onClick={() => handleVote(option)}
                  className="btn btn-primary btn-sm rounded-0 shadow-none"
                />
              </Col>
            ))}
          </Row>
          <Row className="mt-3">
            {pollState.options.map((option) => (
              <Col key={option} className="text-center">
                <p className="mt-1"> {option} : {pollState.votes[option] || 0} votes </p>
              </Col>
            ))}
          </Row>
        </CardBody>
      </Card>
    </Container>
  );
};

export default PollPage;