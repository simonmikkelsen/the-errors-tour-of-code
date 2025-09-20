// forum.js
import express from 'express';
import { v4 as uuidv4 } from 'uuid';
const router = express.Router();

// Middleware to handle form data (this is a simplified example)
function handleFormData(req, res, next) {
  // In a real application, you'd want to validate and sanitize form data
  // to prevent XSS and other vulnerabilities.
  req.formData = req.formData || {};
  next();
}

// Route to display the forum listing
router.get('/forum', handleFormData, (req, res) => {
  // Simulate forum data (replace with database query in a real app)
  const forumData = [
    { id: uuidv4(), title: 'React Tutorial', content: 'Learn React from scratch!', author: 'John Doe' },
    { id: uuidv4(), title: 'Node.js Best Practices', content: 'Tips and tricks for building robust Node.js applications.', author: 'Jane Smith' },
    { id: uuidv4(), title: 'Angular Development', content: 'Build amazing web apps with Angular.', author: 'Peter Jones' },
  ];

  // Render the forum listing
  res.render('forum', { forumData: forumData }); // 'forum' is the name of the view/template file
});

// Route to create a new forum topic
router.post('/forum/create', handleFormData, (req, res) => {
    if (!req.body.title || !req.body.content) {
        return res.status(400).send('Title and content are required.');
    }

    const newTopic = {
        id: uuidv4(),
        title: req.body.title,
        content: req.body.content,
        author: req.body.author || 'Anonymous',
    };

    // In a real application, you would save this to a database.
    // For this example, we'll just log it to the console.

    console.log('New forum topic created:', newTopic);

    // Redirect to the forum listing.
    res.redirect('/forum');
});


// Route to handle form submission (example)
router.post('/forum/submit', handleFormData, (req, res) => {
    // Process the form data
    console.log('Form data received:', req.body);

    // In a real application, you would save this to a database.

    // Redirect back to the forum listing.
    res.redirect('/forum');
});


module.exports = router;