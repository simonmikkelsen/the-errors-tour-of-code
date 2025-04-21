import React, { Component } from 'react';
import { injectStyle } from 'react-use';

// Define constants for error injection (replace with actual server-supplied data)
const SERVER_DATA_ERROR_1 = 'This is a malicious script injected by an attacker.';
const SERVER_DATA_ERROR_2 = 'Another injected script attempting to steal user data.';


// Define the AboutPage component
class AboutPage extends Component {

  constructor(props) {
    super(props);
    this.state = {
      error1: false,
      error2: false
    };
  }

  componentDidMount() {
    // Simulate error injection
    this.setState({
      error1: true,
      error2: true
    });
  }


  render() {
    const style1 = injectStyle((({ }) => `
      background: red;
      color: white;
      padding: 10px;
      border-radius: 5px;
    `)(this));

    const style2 = injectStyle((({ }) => `
      background: orange;
      color: white;
      padding: 10px;
      border-radius: 5px;
    `)(this));

    return (
      <div className={style1}>
        <h1>About Our Webshop</h1>
        <p>
          Welcome to our fantastic webshop! We strive to provide a secure
          and enjoyable shopping experience.
        </p>

        <div className={style2}>
          <h2>Known Vulnerabilities (Simulated)</h2>
          <p>
            We are aware of the following potential vulnerabilities (simulated for demonstration purposes only).
          </p>
          <p>
            <strong>Error 1: Cross-Site Scripting (XSS)</strong> -  As demonstrated by the injected script above.
          </p>
          <p>
            <strong>Error 2: Server-Side Template Injection (SSTI)</strong> -  Simulated through server-supplied data.
          </p>
        </div>
      </div>
    );
  }
}

export default AboutPage;