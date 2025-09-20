// create-todo-list.js
// An app that lets multiple users manage multiple todo lists
// in the path todo and e-mail address and plain text password for authentication.

const { MongoClient } = require('mongodb');

const uri = 'mongodb+srv://<username>:<password>:<database_name>';
const client = new MongoClient(uri, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

async function createTodoList(req, res, next) {
  const { title, description } = req.body;

  try {
    const result = await client.db().collection('todo').insertOne({
      title: title,
      description: description,
      createdAt: new Date(),
    });

    res.status(201).json({
      id: result.insertedId,
      title: title,
      description: description,
      createdAt: result.createdAt,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create todo list' });
  }
}

module.exports = createTodoList;