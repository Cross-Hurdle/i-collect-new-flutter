// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'PaypalPayment.dart';
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'dart:async';
// class MakePayment extends StatefulWidget {
  
//   @override
//   _MakePaymentState createState() => _MakePaymentState();
// }

// class _MakePaymentState extends State<MakePayment> {

//   TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
// //    Future<String?> getAccessToken() async {
// //     try {
// //       String username = "AUU8IiB0De8c41cDCr5YPhHzc0eydU77wxpjoJSbRPJM6wzwkZ6Fg7UYlMmr5Gm_kgFUlsqomP3pT_P6";
// // String password = 'ENo0qIVD6N1NpDG-YZjZ4EvZhtL-MNqmjakJASvsHpA1hTFH0EHQXZiXpfUJ59INuRKn9hMcHpQ3VzeI';
// // var bytes = utf8.encode("$username:$password");
// // var credentials = base64.encode(bytes);
// // Map token = {
// // 'grant_type': 'client_credentials'
// // };

// //  var headers = {
// //  "Accept": "application/json",
// //  'Accept-Language': 'en_US',
// //  "Authorization": "Basic $credentials"
// //   };

// //  var url = "https://api-m.sandbox.paypal.com/v1/oauth2/token";
// //  var requestBody = token;
// //  http.Response response = await http.post(Uri(path: url), body: requestBody, headers: headers);
// //  var responseJson = json.decode(response.body);
// //  print(responseJson);
// //   print(responseJson);
// //    print(responseJson);
// //  return responseJson;
// //   //      Map<String, dynamic>    formMap = {
// //   //   "grant_type": "client_credentials",
   
// //   // } ;
// //   //     var client = BasicAuthClient(clientId, secret);
// //   //     http.Response  response = await client.post(Uri( path: '$domain/v1/oauth2/token',
     
// //   // ),
// //   //  body: convert.jsonEncode(formMap),
// //   //   headers: {
// //   //     //"Authorization":client.password,
// //   //     "Content-Type": "application/x-www-form-urlencoded"
// //   //   },
// //   //  // encoding: convert.Encoding.getByName("utf-8"),
// //   // );
// //   // print("RESPONSE ${response.statusCode} ; BODY = ${response.body}");

// //   // return (response.body) ;
// //       // if (response.statusCode == 200) {
// //       //   final body = convert.jsonDecode(response.body);
// //       //   return body["access_token"];
// //       // }
// //       // return '0';
// //     } catch (e) {
// //       print(e);
// //       rethrow;
// //     }
// //   }
// Future makePost() async {

// var url = "https://api-m.sandbox.paypal.com/v1/oauth2/token";
//       String username = "AUU8IiB0De8c41cDCr5YPhHzc0eydU77wxpjoJSbRPJM6wzwkZ6Fg7UYlMmr5Gm_kgFUlsqomP3pT_P6";
// String password = 'ENo0qIVD6N1NpDG-YZjZ4EvZhtL-MNqmjakJASvsHpA1hTFH0EHQXZiXpfUJ59INuRKn9hMcHpQ3VzeI';
// var bytes = utf8.encode("$username:$password");
// var credentials = base64.encode(bytes);
// Map token = {
// 'grant_type': 'client_credentials'
// };

//  var headers = {
//  "Accept": "application/json",
//  'Accept-Language': 'en_US',
//  "Authorization": "Basic $credentials"
//   };
// print(url);
//  var requestBody = token;
//  http.Response response = await http.post(Uri.parse(url), body: requestBody, headers: headers);
//   print(response.statusCode);
//  var responseJson = json.decode(response.body);
//   print(response.body);
//  return responseJson;
// }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: new Scaffold(
//           backgroundColor: Colors.transparent,
//           key: _scaffoldKey,
//           appBar: PreferredSize(
//             preferredSize: Size.fromHeight(45.0),
//             child: new AppBar(
//               backgroundColor: Colors.white,
//               title: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Paypal Payment Example',
//                     style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.red[900],
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Open Sans'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           body:Container(
//               width: MediaQuery.of(context).size.width,
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     RaisedButton(
//                       onPressed: (){
//                          //makePost();
// //  getAccessToken();
//                         // make PayPal payment

//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (BuildContext context) => PaypalPayment(
//                               onFinish: (number) async {

//                                 // payment done
//                                 print('order id: ');

//                               },
//                             ),
//                           ),
//                         );

                        
//                       },
//                       child: Text('Pay with Paypal', textAlign: TextAlign.center,),
//                     ),

//                   ],
//                 ),
//               )
//           ),
//         )
//     );
//   }

// }
