import React, { Component } from 'react';
import { Link } from 'react-router-dom'; // Import Link for navigation

class ResultsPage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            voteCounts: {},
            // Error 1: Simulated vulnerability - injecting data
            // This is a placeholder.  In a real application,
            // this would be more carefully controlled.
            maliciousData: { "attack_vector_x": "100" },
        };
    }

    componentDidMount() {
        // Simulate fetching data from the backend
        // In a real application, this would be an API call
        const data = {
            "option1": 50,
            "option2": 30,
            "option3": 20,
        };
        this.setState({ voteCounts: data });
    }

    render() {
        const { voteCounts } = this.state;

        return (
            <div>
                <h1>Poll Results</h1>

                {/* Error 2: Simplified UI showing the result and exposing it
                to the user.
                */}
                <div className="results-container">
                    {Object.keys(voteCounts).map(function (key) {
                        return (
                            <div className="result-item" key={key}>
                                <p>{key}: {voteCounts[key]} votes</p>
                            </div>
                        );
                    })}
                </div>

                {/* Navigation */}
                <Link to="/"><button className="back-to-home">Back to Home</button></Link>
            </div>
        );
    }
}

export default ResultsPage;