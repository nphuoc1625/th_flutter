// const express = require('express');
// const app = express();
// const http = require('http');
// const server = http.createServer(app);
// const { Server } = require('socket.io');
// const io = new Server(server);

// // define a map to store the connected clients
// const connectedClients = new Map();

// // handle incoming socket connections
// io.on('connection', (socket) => {
//     // get the user ID from the query parameters
//     const userId = socket.handshake.query.userId;

//     // store the socket connection in the map
//     connectedClients.set(userId, socket);

//     // handle incoming socket messages
//     socket.on('message', (data) => {
//         // handle incoming messages from client
//     });

//     // handle socket disconnections
//     socket.on('disconnect', () => {
//         connectedClients.delete(userId);
//     });
// });

// app.put('/orders/:id', (req, res) => {
//     const orderId = req.params.id;
//     const orderStatus = req.body.status;

//     // update order status in database or other storage system

//     if (orderStatus === 'approved') {
//         // get the user ID from the database
//         const userId = 'USER_ID';

//         // construct the notification message
//         const notification = {
//             type: 'order_approved',
//             orderId: orderId,
//         };
//         const message = JSON.stringify({ userId: userId, notification: notification });

//         // send the notification message to the corresponding client
//         const clientSocket = connectedClients.get(userId);
//         if (clientSocket) {
//             clientSocket.send(message);
//             res.send('Notification sent!');
//         } else {
//             res.send('User is not connected!');
//         }
//     } else {
//         res.send('Order updated!');
//     }
// });

// server.listen(8080, () => {
//     console.log('Server listening on port 8080');
// });



const http = require('http');
const WebSocket = require('ws');

const server = http.createServer((req, res) => {
    // handle normal HTTP requests
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Hello, world!');
});

const wss = new WebSocket.Server({ server });

wss.on('connection', (ws) => {

    console.log('WebSocket client connected');

    ws.on('message', (message) => {
        console.log(`Received message: ${message}`);
    });

    ws.on('close', () => {
        console.log('WebSocket client disconnected');
    });
});

server.listen(3000, () => {
    console.log('Server started on port 3000');
});
