import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:icollekt/Helpers/SharedPreference.dart';
abstract class HomeRemoteDataSource{
  
  Stream<Response> getProduct();
  
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  
  @override
 Stream <Response>getProduct(){

  var postBody = jsonEncode({
      "Userid": preferences.getInt('Userid'),
    });
//print(email);

    final response = Dio().post("http://i-collekt.jksoftec.com:3001/api/product/products",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   
  //var  homeproduct = HomePageresponse.fromJson(response.data);
     return  response.asStream();

}
}