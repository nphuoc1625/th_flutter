// import 'dart:io';

// void main() async {
//   print('Received message: ');
//   final socket = await WebSocket.connect('ws://localhost:3000');

//   socket.listen((message) {
//     print('Received message: $message');
//   }, onError: (error) {
//     print('Error: $error');
//   }, onDone: () {
//     print('Disconnected from WebSocket server');
//   });

//   socket.add('Hello, server!');
// }
