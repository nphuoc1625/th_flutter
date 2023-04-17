// import 'dart:convert';
// import 'dart:html' as html;
// import 'dart:io';

// void main(List<String> args) {
//   getDataFromServer();
// }

// Future<void> getDataFromServer() async {
//   final url = Uri.parse('localhost:3000/api/user/signup');
//   final response = await Http.post(url, body: {
//     "name": "Ngoc Phuoc",
//     "email": "admin@gmail.com",
//     "password": "123123123"
//   });

//   if (response.statusCode == 200) {
//     // final responseData =
//     //     json.decode("{'data':[{'object1':123123},{'object1':123123}]}");
//     // Process the data as needed
//     final responseData = jsonDecode(response.body);

//     print(responseData);
//   } else {
//     throw Exception('Failed to load data from server');
//   }
// }
