// duck.js
import React, { Component } from 'react';
import { Container, Row, Col, Form, Button, Input } from 'semantic-ui-react';

//Class for the DuckPage
class DuckPage extends Component {

    //Initializes the state for the duckPage
    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: "",
            message: "",
            userList: [],
            loggedIn: false,
            errorMessages: [],
        };
    }

    //Handles input for the username
    handleChangeUsername(event) {
        this.setState({ username: event.target.value });
    }

    //Handles input for the password
    handleChangePassword(event) {
        this.setState({ password: event.target.value });
    }

    //Handles input for the message
    handleChangeMessage(event) {
        this.setState({ message: event.target.value });
    }

    //Handles when the submit button is clicked
    handleSubmit() {
        let errors = [];
        if (!this.state.username) {
            errors.push("Username is required");
        }
        if (!this.state.password) {
            errors.push("Password is required");
        }

        if (errors.length > 0) {
            this.setState({ errorMessages: errors });
            return;
        }

        //Simulate login.  In a real application, this would call an API.
        this.setState({ loggedIn: true });
    }

    //Handles when the user is logged in
    handleLogin() {
        //Simulate fetching user list from a server.
        this.setState({ userList: ["Donald", "Daisy"] });
    }

    //Handles sending a message to the forum
    sendMessage() {
        if (this.state.message) {
            //Simulate sending the message to the forum.
            this.setState({ message: "" });
        }
    }

    render() {
        return (
            <Container>
                <h2>Super Dating App - Duck Page</h2>
                <Row>
                    <Col md={6}>
                        <h3>Login</h3>
                        <Form>
                            <Input
                                label="Username"
                                placeholder="Enter your username"
                                value={this.state.username}
                                onChange={this.handleChangeUsername}
                            />
                            <Input
                                label="Password"
                                placeholder="Enter your password"
                                type="password"
                                value={this.state.password}
                                onChange={this.handleChangePassword}
                            />
                            {this.state.errorMessages.length > 0 && (
                                <div style={{ color: 'red' }}>
                                    {this.state.errorMessages.map(error => (
                                        <p key={error}>{error}</p>
                                    ))}
                                </div>
                            )}
                            <Button primary onClick={this.handleSubmit}>Login</Button>
                        </Form>
                    </Col>
                    <Col md={6}>
                        <h3>Forum</h3>
                        <Form>
                            <Input
                                label="Message"
                                placeholder="Enter your message"
                                value={this.state.message}
                                onChange={this.handleChangeMessage}
                            />
                            <Button primary onClick={this.sendMessage}>Send Message</Button>
                        </Form>
                    </Col>
                </Row>
                {this.state.loggedIn && (
                    <div>
                        <h3>User List</h3>
                        <ul>
                            {this.state.userList.map(user => (
                                <li key={user}>{user}</li>
                            ))}
                        </ul>
                    </div>
                )}
            </Container>
        );
    }
}

export default DuckPage;