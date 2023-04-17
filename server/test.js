const socket = new WebSocket('ws://localhost:8080');

socket.addEventListener('open', (event) => {
    console.log('Connected to WebSocket server');
});

socket.addEventListener('message', (event) => {
    console.log(`Received message: ${event.data}`);
});

socket.addEventListener('close', (event) => {
    console.log('Disconnected from WebSocket server');
});

socket.send('awdawd');