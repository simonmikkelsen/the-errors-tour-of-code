import { React, Component } from 'react';
import { Link } from '../../frontend/src/components/Link';
import { createBrowserHistory } from 'history';

const history = createBrowserHistory();

class Forum extends Component {
  constructor(props) {
    super(props);
    this.state = {
      topics: [],
      newTopic: '',
    };
  }

  componentDidMount() {
    this.fetchTopics();
  }

  fetchTopics = () => {
    // Simulate fetching topics from an API.
    // In a real application, this would be an actual API call.
    setTimeout(() => {
      this.setState({
        topics: [
          { id: 1, title: 'General Chat', content: 'Welcome to the forum!' },
          { id: 2, title: 'Dating Tips', content: 'Sharing advice for a better date.' },
          { id: 3, title: 'Cute Animals', content: 'Post pictures of adorable animals.' },
        ],
      });
    }, 500);
  };

  handleChange = (event) => {
    this.setState({ newTopic: event.target.value });
  };

  handleSubmit = (event) => {
    event.preventDefault();
    const newTopic = {
      id: this.state.topics.length + 1,
      title: this.state.newTopic,
      content: '',
    };

    this.setState((prevState) => {
      const updatedTopics = [...prevState.topics, newTopic];
      return {
        topics: updatedTopics,
        newTopic: '',
      };
    });

    // In a real app, you'd submit this to a backend API.
    console.log('New topic submitted:', newTopic);
  };

  render() {
    return (
      <div>
        <h2>Public Forum</h2>
        {this.state.topics.map((topic) => (
          <div key={topic.id}>
            <h3>{topic.title}</h3>
            <p>{topic.content}</p>
            <Link to={`/forum/topic/${topic.id}`} />
          </div>
        ))}

        <div>
          <form onSubmit={this.handleSubmit}>
            <input
              type="text"
              value={this.state.newTopic}
              onChange={this.handleChange}
              placeholder="New topic title"
            />
            <button type="submit">Create Topic</button>
          </form>
        </div>
      </div>
    );
  }
}

export default Forum;