const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require('socket.io');
const io = new Server(server);

// define a map to store the connected clients
const connectedClients = new Map();

// handle incoming socket connections
io.on('connection', (socket) => {
    // get the user ID from the query parameters
    const userId = socket.handshake.query.userId;

    // store the socket connection in the map
    connectedClients.set(userId, socket);

    // handle incoming socket messages
    socket.on('message', (data) => {
        // handle incoming messages from client
    });

    // handle socket disconnections
    socket.on('disconnect', () => {
        connectedClients.delete(userId);
    });
});

app.put('/orders/:id', (req, res) => {
    const orderId = req.params.id;
    const orderStatus = req.body.status;

    // update order status in database or other storage system

    if (orderStatus === 'approved') {
        // get the user ID from the database
        const userId = 'USER_ID';

        // construct the notification message
        const notification = {
            type: 'order_approved',
            orderId: orderId,
        };
        const message = JSON.stringify({ userId: userId, notification: notification });

        // send the notification message to the corresponding client
        const clientSocket = connectedClients.get(userId);
        if (clientSocket) {
            clientSocket.send(message);
            res.send('Notification sent!');
        } else {
            res.send('User is not connected!');
        }
    } else {
        res.send('Order updated!');
    }
});

server.listen(8080, () => {
    console.log('Server listening on port 8080');
});



// const express = require('express');
// const app = express();

// // create a socket.io server without attaching it to a server yet
// const { Server } = require('socket.io');
// const io = new Server();

// // define routes and middleware for the express app
// app.get('/', (req, res) => {
//     res.send('Hello, world!');
// });

// // later on, attach the socket.io server to the express app's server
// const server = app.listen(3000, () => {
//     console.log('Server listening on port 3000');
// });

// io.attach(server);

// // handle socket.io events
// io.on('connection', (socket) => {
//     console.log('A user connected');
// });
