const express = require('express');
const mongoose = require('mongoose');

// Creating express app
const app = express();

// Parsing the incoming requests' json payloads
app.use(express.json());

// Connecting to MongoDB database
mongoose.connect('mongodb://localhost:2000/mydb')
    .then(() => console.log('Connected to MongoDB database...'))
    .catch(err => console.error('Could not connect to MongoDB database...', err));

// Defining routes and middleware
app.get('/', (req, res) => {
    res.send('Hello World!');
});

// Listening on a port
const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Listening on port ${port}...`));
