import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../Exports/exports.dart';

class PaymentService{
  Future getpaymentResponse({
     required  sellerid,
      required  productid,
       required String paymentid,
        required String payerId,
         required String paymentmethord,
          required String createdtime,
           required String amount,
           required String productname
     
     } ) async {
    var postBody = jsonEncode({
    "user_id":3,
    "seller_id":sellerid,
    "product_id":productid,
    "payment_id":paymentid,
    "payerId":payerId,
    "payment_methord":"paypal",
    "created_time":"2022-07-18T09:43:22Z",
    "amount":amount,
    "product_name":productname
});

    final response = await Dio().post("http://$baseurl/api/paypal/Payment_Details",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data:  postBody);
  print(response.data);
     return  response.data;

  }
}