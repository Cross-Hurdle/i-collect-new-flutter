import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/AddressListModle.dart';
import 'package:icollekt/Model/NotificationStatusUpdateModle.dart';
import 'package:icollekt/Model/NotificationstatusView.dart';
import 'package:icollekt/Model/ProfileDpDelete.dart';
import 'package:icollekt/Model/ProfilebannerDelete.dart';
import 'package:icollekt/Screens/OtherProfile/Model/FollowCountModle.dart';
import 'package:icollekt/Screens/Profile/Model/FollowersModle.dart';
import 'package:icollekt/Screens/Profile/Model/FollowingModle.dart';

import '../ProfilePost/Data/Model/ProductTypeModle.dart';

var baseurl='i-collekt.jksoftec.com:3001';
var easyposturl='https://api.easypost.com/v2';
var easypostaccessToken ='EZTK1e0a955dbc7f4ee2b38e6602241e53ab6mFc5lBok3CGKlqMHXqI8A';
class ProfileRepository{
 late DeleteProfileBannerDataResponse deleteProfileBannerDataResponse;
 late DeleteProfileDpDataResponse deleteProfileDpDataResponse;
 late NotificationStatusUpdate notificationStatusUpdate;
 late NotificationStatusView notificationStatusView;
 late ProductTypeModle productTypeModle;
 late AddressList addressList;
 late FollowersModle followersModle;
 late FollowingModle followingModle;
 late FolloweCountModle followeCountModle;
 //Count
  Future <FolloweCountModle> getcountResponse( id,  fromid,  ) async {
    var postBody = jsonEncode({
       "from_id":fromid,
    "to_id":id
    });

  
      final response = await Dio().post("http://$baseurl/api/follow/count/all",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
followeCountModle=FolloweCountModle.fromJson(response.data);
     return  followeCountModle;

  }
 Future <FollowersModle> getfollowersResponse( id) async {
      final response = await Dio().get("http://$baseurl/api/follow/$id/follower",
        );
 followersModle=FollowersModle.fromJson(response.data);
 // print(followersModle);
     return followersModle;

  }
  Future <FollowingModle> getfollowingResponse(id ) async {
      final response = await Dio().get("http://$baseurl/api/follow/$id/following",
        );
 followingModle=FollowingModle.fromJson(response.data);
  //print(followingModle);
     return followingModle;

  }
  //follow
   Future getfollowResponse( var id) async {
    var postBody = jsonEncode({
      "to_id": id
    });

  
      final response = await Dio().post("http://$baseurl/api/follow/${preferences.getInt('Userid')}/follow-user",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
        data: postBody);

     return  response.data;

  }
  //unfollow
 Future  getunfollowResponse(var id ) async {
    var postBody = jsonEncode({
    "to_id": id
    });

  
      final response = await Dio().post("http://$baseurl/api/follow/${preferences.getInt('Userid')}/unfollow",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   return  response.data;

  }
 //Deleted Banner
   Future <DeleteProfileBannerDataResponse> getProfilebannerImageDeleteResponse( ) async {
    var postBody = jsonEncode({
    "id": preferences.getInt('Userid')
    });

  
      final response = await Dio().post("http://$baseurl/api/profile/banner/delete",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
deleteProfileBannerDataResponse=DeleteProfileBannerDataResponse.fromJson(response.data);
     return  deleteProfileBannerDataResponse;

  }
  //product type
     Future <ProductTypeModle> getProducttype(var productid,var type ) async {
    var postBody = jsonEncode({
     "id":productid,
    "product_type":type
    });

  
      final response = await Dio().post("http://$baseurl/api/product/update/productType",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
productTypeModle=ProductTypeModle.fromJson(response.data);
     return  productTypeModle;

  }
  //Profile Product Delete
     Future  getProductdelete(var productid, ) async {
   

  
      final response = await Dio().post("http://$baseurl/api/product/delete/$productid",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
       );

     return  response.data;

  }
  //Add Address
   Future  getaddress(
    {required String state,
    required String name,required String  address,required String phone,required  country, required String city,required String postalcode,
    required String adrid
    }
    ) async {
    var postBody = jsonEncode({
      "user_id":preferences.getInt('Userid'),
      "state":state,
       "address_id":adrid,
  "name":name,
  "address":address,
  "country":country,
  "city":city,
  "postal_code":postalcode,
  "phone":phone 
    });

  
      final response = await Dio().post("http://$baseurl/api/addresses/new",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
//productTypeModle=ProductTypeModle.fromJson(response.data);
     return  response.data;

  }
  //Easy Post Address
   Future  getEasypostaddress(
    {required String state,
    required String name,required String  address,required String phone,required  country, required String city,required String postalcode,} ) async {

    var postBody = jsonEncode(
       {
  "address": {
    "company": "EASYPOST",
  "street1": address,
  "street2": "",
  "city": city,
  "state": state,
  "zip": postalcode,
  "country": country,
  "phone":phone
  },
  "verify": true
}

    );

  
      final response = await Dio().post("$easyposturl/addresses",
    options: Options(
    headers: {
       "Content-Type": "application/json",
      'Authorization': 'Bearer ' + easypostaccessToken
    },
  ),
    
        data: postBody);
//productTypeModle=ProductTypeModle.fromJson(response.data);
     return  response.data;

  }
  //Address Delete
    //Add Address
   Future  getaddressdelete(var addressid, ) async {
    // var postBody = jsonEncode({

    // });

  
      final response = await Dio().post("http://$baseurl/api/addresses/delete/$addressid",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
       );
//productTypeModle=ProductTypeModle.fromJson(response.data);
     return  response.data;

  }
  //Address List
  Future <AddressList> getaddresslistResponse( ) async {
      final response = await Dio().get("http://i-collekt.jksoftec.com:3001/api/addresses/find/${preferences.getInt('Userid')}",
        );
 addressList=AddressList.fromJson(response.data);
  print(addressList);
     return addressList;

  }
  //Deleted Dp
  Future <DeleteProfileDpDataResponse> getProfileDpImageDeleteResponse( ) async {
    var postBody = jsonEncode({
    "id": "${preferences.getInt('Userid')}"
    });

  
      final response = await Dio().post("http://$baseurl/api/profile/profile/delete",
    options: Options(
       headers: {
        "Content-Type": "application/json",
       // "Authorization": "Bearer ${access_token.$}"
      },
  
  ),
    
        data: postBody);
deleteProfileDpDataResponse=DeleteProfileDpDataResponse.fromJson(response.data);
     return  deleteProfileDpDataResponse;

  }
  //NotificationUpdate Status
  Future <NotificationStatusUpdate> getnotificationUpdateResponse(bool delivery,bool inbox,bool group ) async {
    var postBody = jsonEncode({
    "id": preferences.getInt('Userid'),
     "delivery_notification":delivery,
    "inbox_notification": inbox,
    "group_notification": group,
    });

  
      final response = await Dio().post("http://$baseurl/api/user/notificationstatus",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
notificationStatusUpdate=NotificationStatusUpdate.fromJson(response.data);
     return  notificationStatusUpdate;

  }
   //NotificationUpdate Status
  Future <NotificationStatusView> getnotificationstusviewResponse() async {
    var postBody = jsonEncode({
    "id": preferences.getInt('Userid'),
    });

  
      final response = await Dio().post("http://$baseurl/api/user/notificationview",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
notificationStatusView=NotificationStatusView.fromJson(response.data);
     return notificationStatusView;

  }
}