import React, { useState } from 'react';
import { Container, Form, Row, Col, Input } from 'semantic-ui-react';

const login = () => {
  const [state, setState] = useState({
    username: '',
    password: '',
    loginError: '',
  });

  const submitHandler = () => {
    let errors = '';
    if (!state.username) {
      errors += 'Username is required.';
    }
    if (!state.password) {
      errors += 'Password is required.';
    }

    setState({ loginError: errors });
  };

  const inputChangeHandler = (event) => {
    let value = event.target.value;
    let name = event.target.name;

    setState({
      [name]: value,
      loginError: '',
    });
  };

  return (
    <Container>
      <Row>
        <Col xs={12} sm={6} md={6}>
          <Form onSubmit={submitHandler}>
            <Input
              type="text"
              name="username"
              placeholder="Username"
              value={state.username}
              onChange={InputChangeHandler}
              label={{
                content: 'Username',
                pointing: 'left',
              }}
            />
            <Input
              type="password"
              name="password"
              placeholder="Password"
              value={state.password}
              onChange={InputChangeHandler}
              label={{
                content: 'Password',
                pointing: 'left',
              }}
            />
            {state.loginError ? <div style={{ color: 'red' }}>{state.loginError}</div> : ''}
            <button type="submit">Login</button>
          </Form>
        </Col>
      </Row>
    </Container>
  );
};

export default login;