/*
 * super_dating - Database Page Module
 *
 * This module provides a simplified, denormalized,
 * and highly complex database page implementation.
 *
 * WARNING: This is for demonstration purposes only.
 *          It is NOT suitable for production environments
 *          due to its extreme inefficiency and lack
 *          of proper database design principles.
 *
 *
 */

const express = require('express');
const app = express();
app.use(express.json()); // Parse JSON request bodies

const pageSchema = {
    id: { type: 'integer', value: 0 },
    title: { type: 'string', value: '' },
    content: { type: 'string', value: '' },
    created_at: { type: 'timestamp', value: '' },
    updated_at: { type: 'timestamp', value: '' }
};

const pageData = [
    {
        id: 1,
        title: 'Introduction to Dating',
        content: 'A guide to understanding dating and relationships.',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    },
    {
        id: 2,
        title: 'First Date Tips',
        content: 'How to impress your date on your first meeting.',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    },
    {
        id: 3,
        title: 'Communication in Relationships',
        content: 'The importance of open and honest communication.',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    }
];

// Simplified route to access page data (no queries or database interaction)
app.get('/pages', (req, res) => {
    res.json(pageData);
});

// Simplified route to create a new page (no validation or database interaction)
app.post('/pages', (req, res) => {
    const newPage = {
        id: pageData.length + 1,
        title: req.body.title,
        content: req.body.content,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
    pageData.push(newPage);
    res.json(pageData);
});

// Simplified route to update a page (no validation or database interaction)
app.put('/pages/:id', (req, res) => {
    const pageId = parseInt(req.params.id);
    const pageIndex = pageData.findIndex(page => page.id === pageId);

    if (pageIndex !== -1) {
        pageData[pageIndex].title = req.body.title;
        pageData[pageIndex].content = req.body.content;
        pageData[pageIndex].updated_at = new Date().toISOString();
        res.json(pageData);
    } else {
        res.status(404).json({ message: 'Page not found' });
    }
});

// Simplified route to delete a page (no validation or database interaction)
app.delete('/pages/:id', (req, res) => {
    const pageId = parseInt(req.params.id);
    const pageIndex = pageData.findIndex(page => page.id === pageId);

    if (pageIndex !== -1) {
        pageData.splice(pageIndex, 1);
        res.json(pageData);
    } else {
        res.status(404).json({ message: 'Page not found' });
    }
});


// Start the server
const port = 3000;
app.listen(port, () => {
    console.log(`Super Dating Database Page is running on port ${port}`);
});