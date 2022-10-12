
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http_auth/http_auth.dart';

class PaypalServices {

  String domain = "https://api-m.paypal.com"; // for sandbox mode
//  String domain = "https://api.paypal.com"; // for production mode

  // change clientId and secret with your own, provided by paypal
  // String clientId = 'AUU8IiB0De8c41cDCr5YPhHzc0eydU77wxpjoJSbRPJM6wzwkZ6Fg7UYlMmr5Gm_kgFUlsqomP3pT_P6';
  // String secret = 'ENo0qIVD6N1NpDG-YZjZ4EvZhtL-MNqmjakJASvsHpA1hTFH0EHQXZiXpfUJ59INuRKn9hMcHpQ3VzeI';

  // for getting the access token from Paypal
  // Future<String?> getAccessToken() async {
  //   try {
  //     var client = BasicAuthClient(clientId, secret);
  //     var response = await client.post(Uri.parse(  '$domain/v1/oauth2/token?grant_type=client_credentials'));
  //     if (response.statusCode == 200) {
  //       final body = convert.jsonDecode(response.body);
  //       return body["access_token"];
  //     }
  //     return '0';
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  // var sandboxurl = "https://api-m.sandbox.paypal.com/v1/oauth2/token";
   var liveurl = "https://api-m.paypal.com/v1/oauth2/token";
//       String sandboxclientID = "AUU8IiB0De8c41cDCr5YPhHzc0eydU77wxpjoJSbRPJM6wzwkZ6Fg7UYlMmr5Gm_kgFUlsqomP3pT_P6";
// String sandboxpassword = 'ENo0qIVD6N1NpDG-YZjZ4EvZhtL-MNqmjakJASvsHpA1hTFH0EHQXZiXpfUJ59INuRKn9hMcHpQ3VzeI';
//Live
String clientId = 'AdiVlHox__P3uMdPArxS02FhxBnjhxsvB4YIAEOQfCQVaEBn6GoN4I8Kn1mccaQjh5uSpNyLU5WkzBoV';
  String secret = 'EEeQjTNBQV2PPPD5Q_oz4E4Gg6pRXf2Gy8ld3B-O3jGyjstfVZiogYv2Ib4VHPJBfY-jZdo6JIRkbUVP';
Future<String?> getAccessToken() async {

 print('object1111111111111111111111');
var bytes = utf8.encode("$clientId:$secret");
var credentials = base64.encode(bytes);
Map token = {
'grant_type': 'client_credentials'
};

 var headers = {
 "Accept": "application/json",
 'Accept-Language': 'en_US',
 "Authorization": "Basic $credentials"
  };
print(liveurl);
 var requestBody = token;
 http.Response response = await http.post(Uri.parse(liveurl), body: requestBody, headers: headers);
  print(response.statusCode);
//  var responseJson = json.decode(response.body);
//   print(response.body);
   final body = convert.jsonDecode(response.body);
  //       return body["access_token"];
  print( body["access_token"]);
 return body["access_token"];
}
  // for creating the payment request with Paypal
  Future<Map<String, String>?> createPaypalPayment(
      transactions, accessToken) async {
    try {
   //   var bodydata=convert.jsonEncode(transactions);
      var response = await http.post(Uri.parse("$domain/v1/payments/payment"),
          body:convert.jsonEncode(transactions),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = convert.jsonDecode(response.body);
       print(body);
       print(accessToken);
      print(response.statusCode);
      if (response.statusCode == 201) {
        if (body["links"] != null && body["links"].length > 0) {
          List links = body["links"];

          String executeUrl = "";
          String approvalUrl = "";
          final item = links.firstWhere((o) => o["rel"] == "approval_url",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"];
          }
          final item1 = links.firstWhere((o) => o["rel"] == "execute",
              orElse: () => null);
          if (item1 != null) {
            executeUrl = item1["href"];
          }
          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
        }
        return null;
      } else {
        throw Exception(body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  // for executing the payment transaction
  Future<String?> executePayment(url, payerId, accessToken) async {
    try {
      var response = await http.post(Uri.parse(url),
          body: convert.jsonEncode({"payer_id": payerId}),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(body);
        return body["id"];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}