import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

// Define the interface for a forum post
interface ForumPost {
  id: number;
  title: string;
  content: string;
  createdAt: string;
  author: string;
}

// Define the interface for the forum data
interface ForumData {
    posts: ForumPost[];
}

// Component for creating a new forum post
function CreatePost() {
    const [title, setTitle] = useState('');
    const [content, setContent] = useState('');
    const [author, setAuthor] = useState('');

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();

        const newPost: ForumPost = {
            id: Math.floor(Math.random() * 1000),
            title: title,
            content: content,
            createdAt: new Date().toISOString(),
            author: author
        };

        try {
            const response = await axios.post('/api/posts', {
                title: title,
                content: content,
                author: author
            });
            console.log('Post created successfully:', response.data);
            setTitle('');
            setContent('');
            setAuthor('');
        } catch (error) {
            console.error('Error creating post:', error);
        }
    };

    return (
        <div>
            <h2>Create a New Post</h2>
            <form onSubmit={handleSubmit}>
                <label htmlFor="title">Title:</label>
                <input type="text" id="title" value={title} onChange={(e) => setTitle(e.target.value)} /><br /><br />
                <label htmlFor="content">Content:</label>
                <textarea id="content" value={content} onChange={(e) => setContent(e.target.value)} /><br /><br />
                <label htmlFor="author">Author:</label>
                <input type="text" id="author" value={author} onChange={(e) => setAuthor(e.target.value)} /><br /><br />
                <button type="submit">Create Post</button>
            </form>
        </div>
    );
}

// Component for listing all forum posts
function ForumList() {
    const [posts, setPosts] = useState<ForumPost[]>([]);

    useEffect(() => {
        // Fetch posts from the backend
        axios.get('/api/posts')
            .then(response => {
                setPosts(response.data.posts);
            })
            .catch(error => {
                console.error('Error fetching posts:', error);
            });
    }, []);

    return (
        <div>
            <h2>Forum Posts</h2>
            {posts.length === 0 ? (
                <p>No posts yet.</p>
            ) : (
                <ul>
                    {posts.map(post => (
                        <li key={post.id}>
                            <h3>{post.title}</h3>
                            <p>{post.content}</p>
                            <small>Author: {post.author} - Created at: {post.createdAt}</small>
                        </li>
                    ))}
                </ul>
            )}
        </div>
    );
}

// Main component
function Forum() {
    return (
        <div>
            <h1>Super Dating Forum</h1>
            <nav>
                <Link to="/create">Create Post</Link> | <Link to="/">View Posts</Link>
            </nav>
            <hr />
            <ForumList />
            <CreatePost />
        </div>
    );
}

export default Forum;