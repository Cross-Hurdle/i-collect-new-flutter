import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/ADDHastageModle.dart';
import 'package:icollekt/Model/AllGroupResponse_Modle.dart';
import 'package:icollekt/Model/Already%20UserExist_response.dart';
import 'package:icollekt/Model/Collection_modle.dart';
import 'package:icollekt/Model/Collection_modle_response.dart';
import 'package:icollekt/Model/CommentCreateModle.dart';
import 'package:icollekt/Model/CommentUnlikeModle.dart';
import 'package:icollekt/Model/CommentViewModle.dart';
import 'package:icollekt/Model/CommentlikeModle.dart';
import 'package:icollekt/Model/ConfirmPassword.dart';
import 'package:icollekt/Model/ContactModle.dart';
import 'package:icollekt/Model/CreateGreoupPic_modle.dart';
import 'package:icollekt/Model/DoBResponse.dart';
import 'package:icollekt/Model/EmailAlreadyExist.dart';
import 'package:icollekt/Model/FAQ_Modle.dart';
import 'package:icollekt/Model/GetHastag_response.dart';
import 'package:icollekt/Model/GoupPostModle.dart';
import 'package:icollekt/Model/GroupBannerRoveModle.dart';
import 'package:icollekt/Model/GroupImageListModle.dart';
import 'package:icollekt/Model/GroupMemberModle.dart';
import 'package:icollekt/Model/GroupNamealreadyExist.dart';
import 'package:icollekt/Model/GroupPhotoModle.dart';
import 'package:icollekt/Model/Groupdpremove_Modle.dart';
import 'package:icollekt/Model/HastagViewResponse.dart';
import 'package:icollekt/Model/Help_modle.dart';
import 'package:icollekt/Model/ProductCommentLikeModle.dart';
import 'package:icollekt/Screens/Home/HomePage/Data/Model/HomePage_Modle.dart';
import 'package:icollekt/Model/InboxChatResponseModle.dart';
import 'package:icollekt/Model/InviteResponseModle.dart';
import 'package:icollekt/Model/JoinRequest_Modle.dart';
import 'package:icollekt/Model/Logout.dart';
import 'package:icollekt/Model/MessageEditModle.dart';
import 'package:icollekt/Model/MonthModle.dart';
import 'package:icollekt/Model/MyGroupModle.dart';
import 'package:icollekt/Model/OneToOnePersonalChat.dart';
import 'package:icollekt/Model/OnetoonConnectionIdResponse.dart';
import 'package:icollekt/Model/PersonalSendMessageModle.dart';
import 'package:icollekt/Model/PostDeletedModle.dart';
import 'package:icollekt/Model/PostLikeModle.dart';
import 'package:icollekt/Model/PostUnlikeModle.dart';
import 'package:icollekt/Model/Product%20FindoneModle.dart';
import 'package:icollekt/Model/ProductlikeModle.dart';
import 'package:icollekt/Model/Profile_Modle.dart';
import 'package:icollekt/Model/Profileupload_modle.dart';
import 'package:icollekt/Model/Report_modle.dart';
import 'package:icollekt/Model/Signup_modle.dart';
import 'package:icollekt/Model/Social_login_reponse.dart';
import 'package:icollekt/Model/SubjectEditModle.dart';
import 'package:icollekt/Model/UpdateHastag_response.dart';
import 'package:icollekt/Model/ViewGroupModle.dart';
import 'package:icollekt/Model/emailId_model.dart';
import 'package:icollekt/Model/fcmTokenresponse.dart';
import 'package:icollekt/Model/forgotpasswordResponse.dart';
import 'package:icollekt/Model/gethastagproductcard.dart';
import 'package:icollekt/Model/hastagAlreadyExit.dart';
import 'package:icollekt/Model/inviteContactModle.dart';
import 'package:icollekt/Model/producatunlikeModle.dart';
import 'package:icollekt/Model/resendotpmodle.dart';
import 'package:http/http.dart' as http;
import 'package:icollekt/Model/weekmodle.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/yearmodle.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/AlltimeModle.dart';

import '../Model/AllUserProfile.dart';
import '../Model/ProductComment.dart';
import '../Model/ProductCommentUnLikeModle.dart';
import '../Screens/Profile/ProfilePost/Data/Model/ProfilePostModle.dart';






var baseurl='i-collekt.jksoftec.com:3001';



class GroupAndChatRepository{
 late AllGroupDataResponseModle allGroupDataResponseModle;
 late MyGroupDataResponse myGroupDataResponse;
 late ViewGroupDataResponse viewGroupDataResponse;
 late GroupMemberResponse groupMemberResponse;
 late AllContactDataResponse allContactDataResponse;
 late  PersonalSendMessage  personalSendMessage;
 late OneToOnePersonalChatDataResponse oneToOnePersonalChatDataResponse;
 late OnetoonConnectionResponse onetoonConnectionResponse;
 late InboxPersonalChatDataResponse inboxPersonalChatDataResponse;
 late GroupPhotoDataResponse groupPhotoDataResponse;
 late GroupPostedDataResponse groupPostedDataResponse;
 late GroupImageDataResponse groupImageDataResponse;
 late GroupPosteddeletedDataResponse groupPosteddeletedDataResponse;
 late InviteDataResponse inviteDataResponse;
 late JoinRequestDataResponse joinRequestDataResponse;
 late LikeDataResponse likeDataResponse;
 late  UnLikeDataResponse unLikeDataResponsel;
 late GroupBannerRemoveDataResponseModle groupBannerRemoveDataResponseModle;
 late GroupdpRemoveDataResponseModle groupdpRemoveDataResponseModle;
 late EditMessageDataResponseModle editMessageDataResponseModle;
 late EditNameDataResponseModle  editNameDataResponseModle;
 late InviteContactDataResponseModle inviteContactDataResponseModle;
 late HastagViewResponse hastagViewResponse;
 late CommentCreateModle commentCreateModle;
 late CommentViewModle commentViewModle;
 late ProductCommentModle productCommentModle;
 late TopMonthresponse topMonthresponse;
 late TopWeekresponse topWeekresponse;
 late TopYearresponse topYearresponse;
 late TopAllTimeresponse topAllTimeresponse;
 late ProductFindoneResponse productFindoneResponse;
 late AllUserresponse allUserresponse;
 //Edit Profile name
   Future getEditprofileNameResponse({
     required String name} ) async {
    var postBody = jsonEncode({
    "name":name
});

    final response = await Dio().put("http://$baseurl/api/profile/username/${preferences.getInt('Userid')}",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data:  postBody);
  print(response.data);
     return  response.data;

  }
//Comment Update
Future <CommentCreateModle> getcreatecommentResponse(
  {required int postid,required int groupid,required String comment} ) async {
    var postBody = jsonEncode({
   "user_id":preferences.getInt('Userid'),
    "group_id":groupid,
    "post_id":postid,
    "comment":comment
    });

  
      final response = await Dio().post("http://$baseurl/api/comment/post/comment",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
 commentCreateModle=CommentCreateModle.fromJson(response.data);
     return   commentCreateModle;

  }
  //Group Comment
  Future <CommentViewModle> getcommentResponse(
  {required int postid} ) async {
      final response = await Dio().get("http://i-collekt.jksoftec.com:3001/api/comment/comment/view/$postid",
        );
 commentViewModle=CommentViewModle.fromJson(response.data);
  print(commentViewModle);
     return commentViewModle;

  }
    //Product Comment
  Future <ProductCommentModle> getProductcommentResponse(
  {required  postid} ) async {
      final response = await Dio().get("http://i-collekt.jksoftec.com:3001/api/product_comment/comment/view/$postid",
        );
 productCommentModle=ProductCommentModle.fromJson(response.data);
  print(productCommentModle);
     return productCommentModle;

  }
  //Product Comment Update
Future getcreateProductcommentResponse(
  {required  postid,required  comment} ) async {
    var postBody = jsonEncode({
   "user_id":preferences.getInt('Userid'),
    "product_id":postid,
    "comment":comment
    });

  
      final response = await Dio().post("http://$baseurl/api/product_comment/product/comment",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
 //commentCreateModle=CommentCreateModle.fromJson(response.data);
     return   response.data;

  }
  //FInd one Product
  Future <ProductFindoneResponse> getfindoneproductResponse(
  {required int productid} ) async {
  //  print(productid);
      final response = await Dio().get("http://i-collekt.jksoftec.com:3001/api/product/productbyId/$productid",
        );
 productFindoneResponse=ProductFindoneResponse.fromJson(response.data);
 
     return productFindoneResponse;

  }
 // AllTime
//   Future <TopAllTimeresponse> getAllTimeResponse(
//    ) async {
//       final response = await Dio().get("http://i-collekt.jksoftec.com:3001/api/product/all/time",
//         );
// topAllTimeresponse=TopAllTimeresponse.fromJson(response.data);
  
//      return topAllTimeresponse;

//   }
  //Thisyear
//   Future <TopYearresponse> getThisyearResponse(
//    ) async {
//       final response = await Dio().get("http://i-collekt.jksoftec.com:3001/api/product/find/Byyear",
//         );
//  topYearresponse=TopYearresponse.fromJson(response.data);
//   //print(commentViewModle);
//      return topYearresponse;

//   }
  //Month
  Future <TopMonthresponse> getMonthResponse(
   ) async {
      final response = await Dio().get("http://i-collekt.jksoftec.com:3001/api/product/find/Bymonths",
        );
 topMonthresponse=TopMonthresponse.fromJson(response.data);
  print( response.data);
     return topMonthresponse;

  }
  //Week
  Future <TopWeekresponse> getWeekResponse(
  ) async {
      final response = await Dio().get("http://i-collekt.jksoftec.com:3001/api/product/topweek/products",
        );
 topWeekresponse=TopWeekresponse.fromJson(response.data);
 // print(commentViewModle);
     return topWeekresponse;

  }
 //Edit Group Name
 Future <EditMessageDataResponseModle> getgroupnameEditResponse({required int id,required String message} ) async {
    var postBody = jsonEncode({
    "id": id,
    "message":message
    });

  
      final response = await Dio().post("http://$baseurl/api/group_image/group_message/Update/",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
 editMessageDataResponseModle= EditMessageDataResponseModle.fromJson(response.data);
     return   editMessageDataResponseModle;

  }
  //hastagViewdata
   Future <HastagViewResponse> gethastagEditResponse() async {
    var postBody = jsonEncode({
   
    });

  
      final response = await Dio().post("http://$baseurl/api/hashtags/hashtags/${preferences.getInt('Userid')}",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
 hastagViewResponse= HastagViewResponse.fromJson(response.data);
     return   hastagViewResponse;

  }
 //Edit Group Message
Future <EditNameDataResponseModle> getgroupSubjectEditResponse({required int id,required String message} ) async {
    var postBody = jsonEncode({
    "id": id,
    "subject":message
    });

  
      final response = await Dio().post("http://$baseurl/api/group_image/group_subject/Update/",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
editNameDataResponseModle=EditNameDataResponseModle.fromJson(response.data);
     return editNameDataResponseModle;

  }
 //Deleted Banner
   Future <GroupBannerRemoveDataResponseModle> getProfilebannerImageDeleteResponse({required int id} ) async {
    var postBody = jsonEncode({
    "id": id
    });

  
      final response = await Dio().post("http://$baseurl/api/group_image/group_img_banner/delete",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
groupBannerRemoveDataResponseModle=GroupBannerRemoveDataResponseModle.fromJson(response.data);
     return  groupBannerRemoveDataResponseModle;

  }
  //Deleted Dp
  Future <GroupdpRemoveDataResponseModle> getProfileDpImageDeleteResponse({required int id} ) async {
    var postBody = jsonEncode({
    "id": id
    });

  
      final response = await Dio().post("http://$baseurl/api/group_image/group_img/delete",
    options: Options(
    headers: {
       "Content-Type": "application/json", 
    },
  ),
    
        data: postBody);
groupdpRemoveDataResponseModle=GroupdpRemoveDataResponseModle.fromJson(response.data);
     return  groupdpRemoveDataResponseModle;

  }
    Future<AllGroupDataResponseModle> getAllGroupDataresponse()async{ 

  var postBody = jsonEncode({
    "userid":preferences.getInt('Userid')
    });

      final response = await Dio().post("http://$baseurl/api/group_image/data/datas",
      options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
        data: postBody);
 print( '555d33${response.data}');

  allGroupDataResponseModle=AllGroupDataResponseModle.fromJson(response.data);
   print( '555d${allGroupDataResponseModle.finalData.length}');
  return allGroupDataResponseModle;
   }
   //Group Images
      Future<GroupPhotoDataResponse> getAllGroupImagesData()async{ 

   final response = await Dio().get('http://$baseurl/api/conversation/group_photos/${preferences.getInt('Userid')}');
 // print(response);
 groupPhotoDataResponse =GroupPhotoDataResponse.fromJson(response.data);
  return groupPhotoDataResponse;

   }
   //All USer Profile
    Future<AllUserresponse> getAllUserData()async{ 

   final response = await Dio().get('http://$baseurl/api/profile');
  //print(response);
 allUserresponse =AllUserresponse.fromJson(response.data);
//  Map<String, dynamic> toJson() => {
//         "user": List<dynamic>.from(user.map((x) => x.toJson())),
//     };
  return allUserresponse;

   }
   //Group all posted
      Future<GroupPostedDataResponse> getAllGroupPostedData({required int id})async{ 

   final response = await Dio().get('http://$baseurl/api/conversation/conservation_view/view/$id');
  //print(response);
 groupPostedDataResponse =GroupPostedDataResponse.fromJson(response.data);
  return groupPostedDataResponse;

   }
   //GroupPhoto
       Future<GroupImageDataResponse> getAllGroupimageData({required int id})async{ 

   final response = await Dio().get('http://$baseurl/api/conversation/images/$id');
  //print(response);
 groupImageDataResponse =GroupImageDataResponse.fromJson(response.data);
  return groupImageDataResponse;

   }
  
   //Deleted post
       Future<GroupPosteddeletedDataResponse>  getAllDeletepostData({required int id,} ) async {
    var postBody = jsonEncode({
    "id":id
    });

      final response = await Dio().post("http://$baseurl/api/conversation/delete/",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   groupPosteddeletedDataResponse= GroupPosteddeletedDataResponse.fromJson(response.data);
     return  groupPosteddeletedDataResponse;

  }
  //Like
   
       Future<GroupPosteddeletedDataResponse>  getAllLikepostData({required int id,} ) async {
    var postBody = jsonEncode({

   "id":id
    });

      final response = await Dio().post("http://$baseurl/api/conversation/delete",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   groupPosteddeletedDataResponse= GroupPosteddeletedDataResponse.fromJson(response.data);
     return  groupPosteddeletedDataResponse;

  }
   //Invite Group
       Future<InviteDataResponse>  getAllinviteGroupData({ required List touser, required int groupid} ) async {
    var postBody = jsonEncode({
   "user_id":'${preferences.getInt('Userid')}',
	"toUser_id": touser,
	"group_id" : "${"$groupid"}"
  //  "id":id
    });

      final response = await Dio().post("http://$baseurl/api/group_image/group_invite/send",
      
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
    inviteDataResponse= InviteDataResponse.fromJson(response.data);
     return   inviteDataResponse;

  }
  //Join Request
   Future<JoinRequestDataResponse>  getAlljoinRequestGroupData({ required int adminid, required int groupid} ) async {
    var postBody = jsonEncode({
   "user_id":preferences.getInt('Userid'),
	"adminid":adminid,
	"group_id" : groupid
    });
//     print(preferences.getInt('Userid'));
// print(adminid);
// print(groupid);
      final response = await Dio().post("http://$baseurl/api/group_image/joinrequest",
      
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
        data: postBody);
       print(response.data);
    joinRequestDataResponse= JoinRequestDataResponse.fromJson(response.data);
      print( joinRequestDataResponse);
     return    joinRequestDataResponse;

  }
   //Conatact
     Future<AllContactDataResponse> getContactData()async{ 

   //final response = await Dio().post('http://$baseurl/api/group_image/find_contact/find');
   var postBody = jsonEncode({
      "user_id":preferences.getInt('Userid'),
    });
   final response = await Dio().post('http://$baseurl/api/group_image/find_contact/find',
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
  print(response);
  allContactDataResponse =AllContactDataResponse.fromJson(response.data);
    print(response);
  return allContactDataResponse;
   }
     //Invite Conatact
     Future<InviteContactDataResponseModle> getinviteContactData({required int id})async{ 

   //final response = await Dio().post('http://$baseurl/api/group_image/find_contact/find');
  
   final response = await Dio().get('http://$baseurl/api/group_image/invite_contact/$id',);
  print(response);
  inviteContactDataResponseModle =InviteContactDataResponseModle.fromJson(response.data);
    print(response);
  return inviteContactDataResponseModle;
   }
//PostLike Api
  Future<LikeDataResponse> getPostlikeData({ required int postid,required int groupid})async{ 
// print('object');
   //final response = await Dio().post('http://$baseurl/api/group_image/find_contact/find');
  // print('heloooooooooooooooooooooooooooooooooooooooooooo${groupid}');
   var postBody = jsonEncode({
      "user_id":preferences.getInt('Userid'),
      "post_id":postid,
      "group_id":groupid
    });
   final response = await Dio().post('http://$baseurl/api/conversation/post/like',
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
  //print(response);
  likeDataResponse =LikeDataResponse.fromJson(response.data);
  //  print(response);
  return likeDataResponse;
   }
//Unlike Api
  Future< UnLikeDataResponse> getPostUnlikeData({ required int postid})async{ 
  // print('object');
   //final response = await Dio().post('http://$baseurl/api/group_image/find_contact/find');
   var postBody = jsonEncode({
      "user_id":preferences.getInt('Userid'),
      "post_id":postid,
    });
   final response = await Dio().post('http://$baseurl/api/conversation/post/unlike',
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
  print(response);
  unLikeDataResponsel = UnLikeDataResponse.fromJson(response.data);
    // print(response);
  return unLikeDataResponsel;
   }

   Future<MyGroupDataResponse> getMyGroupData()async{ 

   final response = await Dio().get('http://$baseurl/api/group_image/user_id/${preferences.getInt('Userid')}');
  //print(response.data);
  myGroupDataResponse = MyGroupDataResponse.fromJson(response.data);
  return myGroupDataResponse;

   }
   //Inbox personal chat
   Future<InboxPersonalChatDataResponse> getMyInboxData()async{ 

   final response = await Dio().get('http://$baseurl/api/messages/message_view/view/${preferences.getInt('Userid')}');
  //print(response);
 inboxPersonalChatDataResponse =InboxPersonalChatDataResponse.fromJson(response.data);
  return inboxPersonalChatDataResponse;

   }
      Future<ViewGroupDataResponse> getViewGroupData({required int id})async{ 

   final response = await Dio().get('http://$baseurl/api/group_image/$id');
  // print(response);
  viewGroupDataResponse = ViewGroupDataResponse.fromJson(response.data);
  return viewGroupDataResponse;

   }
   //Group Members
      Future<GroupMemberResponse> getViewGroupMemberData({required int id})async{ 

   final response = await Dio().get('http://$baseurl/api/group_image/group/contact_list/$id');

   print(response);
  groupMemberResponse = GroupMemberResponse.fromJson(response.data);
  return groupMemberResponse;

   }
   //PersonalChat
      Future<PersonalSendMessage>  getChatResponse({required String chat,required int id,required int connectionId} ) async {
    var postBody = jsonEncode({
       "fromUserId":preferences.getInt('Userid'),
   "toUserId":id,
   "chat":chat,
   "connectionId":connectionId
    // http://i-collekt.jksoftec.com:3001/api/messages/Chat_view/54
    });

      final response = await Dio().post("http://$baseurl/api/messages/chat",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
  personalSendMessage= PersonalSendMessage.fromJson(response.data);
     return  personalSendMessage;

  }
  //find all my chat
//    Stream getAllmychatData({required int id}){ 

//    final response = Dio().get('http://$baseurl/api/messages/Chat_view/$id').asStream();
//  // print(response);
 
//   return response;

//    }
  Future <OneToOnePersonalChatDataResponse>getAllmychatData({required int id})async{ 
 var postBody = jsonEncode({
      "id":preferences.getInt('Userid'),
    });
   final response = await Dio().post('http://$baseurl/api/messages/Chat_view/$id',
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
   print(response);
oneToOnePersonalChatDataResponse= OneToOnePersonalChatDataResponse.fromJson(response.data);
  return oneToOnePersonalChatDataResponse;

   }
   //Personal chat Delete
     Future getAllDeletechatData({required int id})async{ 
 var postBody = jsonEncode({
      "id":preferences.getInt('Userid'),
    });
   final response = await Dio().post('http://$baseurl/api/messages/delete/$id',
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
   print(response);
//oneToOnePersonalChatDataResponse= OneToOnePersonalChatDataResponse.fromJson(response.data);
  return response.data;

   }
  //one to one connection
 Future <OnetoonConnectionResponse>getonetooneConnectionResponse({required int id} ) async {
    var postBody = jsonEncode({
      "user_one":preferences.getInt('Userid'),
   "user_two":id,
    });

      final response = await Dio().post("http://$baseurl/api/messages/connect/users",
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
onetoonConnectionResponse= OnetoonConnectionResponse.fromJson(response.data);
     return onetoonConnectionResponse;

  }
}

class CollectionRepository{ 

late  CollectionResponse collectionResponse;

   Future<CollectionResponse> getCollectionData()async{ 


   final response = await http.get(Uri.parse('http://$baseurl/api/collection/'));
  
   
  return collectionResponseFromJson(response.body);

   }
//GetHastag
late  Hastaggetresponse hastaggetresponse;

   Future<Hastaggetresponse> getHastagData()async{ 


   final response = await http.get(Uri.parse('http://$baseurl/api/hashtags/'));
  
   
  return hastaggetresponseFromJson(response.body);

   }
//Get Hastag productcard
  Future<HastagProductCard> gethastagproductcard(var id)async{
// print('helooooooooo$id');
final response = await http.get(Uri.parse("http://$baseurl/api/product/$id"));

return hastagProductCardFromJson(response.body);

}


//update collection

Future<CollectionDataResponse> updateCollection(int userId, List collectionData)async{
 
   var postbody = jsonEncode({
     "id":'$userId',
     "user_collection": "${"$collectionData"}"

   }); 
   print("222${"$collectionData"}"); 
  final response = await http.post(Uri.parse('http://$baseurl/api/user/user_collection'), 
  headers: {"Content-Type": "application/json"}, body: postbody
  );
 return collectionDataResponseFromJson(response.body);

}



//UpdateHastag

Future<UpdateHastagresponse> updateHastag(int userId, List collectionData)async{
  List collectdata=[];
//   for(int i = 0; i < collectionData.length; i++){
//   if(collectionData[i]>0&&9<=collectionData[i]){
//  print('hello'+"\"${"${'0'+collectionData.join(',')}"}\"");
//   }else{
//  print('hello123'+"\"${"${'0'+collectionData.join(',')}"}\"");
//   }
//   }

  print('hiiiiiiiiiiiiii${collectdata.toString()}');
   var postbody = jsonEncode({
     "id":'$userId',
     //'$userId',
     "hashtags":collectionData.join(',')
     //" '$collectionData'"
   

   }); 
 //  print('hii$userId');
//     //List<String>servicesList=["one", "Two", "Thee"]; 
 // print(collectionData.remove([],));
      print(collectionData.join(','));
  final response = await http.post(Uri.parse('http://$baseurl/api/user/update-hashtag'), 
 headers: {"Content-Type": "application/json"}, 
  body: postbody
  );
  print(response.body);
 return updateHastagresponseFromJson(response.body);

}
//Add Hastag
Future<AddHastageDataResponseModle> addupdateHastag(String hastag)async{


   var postbody = jsonEncode({
     "id":preferences.getInt('Userid'),
    "name":hastag
   }); 

  final response = await http.post(Uri.parse('http://$baseurl/api/hashtags/new'), 
 headers: {"Content-Type": "application/json"}, 
  body: postbody
  );
  print(response.body);
 return addHastageDataResponseModleFromJson(response.body);

}

}

class AuthRepository {
 
 late UserAlreadyExistModel userexist;
 late EmailAlreadyExistResponse emailAlreadyExistResponse;
  late SignupModel signupModel;
  late ForgotpasswordResponse forgotpasswordModel ;
  late OtpResponse  otpresponse ;
  late SignInModel  signresponse;
 late  ResendOtpResponse resendotpresponse;
         late Emailverifyresponse  emailverifyresponse;
       late Logoutresponse  logoutModel;
                late HomePageresponse homeModel;
                late ConfirmpasswordResponse confirmpassword;
                late DobResponse dobModel;
                late ProfileUploadresponse profileuploadModel;
                late GroupDPresponse groupModel;
                late Reportresponse reportresponse;
                late Helpresponse helpresponse;
                late ProfilePhotoresponse profilePhotoresponse;
                late HomePageresponse homeproduct;
                late ProfilePostModle profilePostModle;
                late GroupNameAlreadyExistDataResponse groupNameAlreadyExistDataResponse;
                late HastageExistDataResponseModle hastageExistDataResponseModle;
                late FcmTokenResponse fcmTokenResponse;
                late CommentUnLikeModle commentUnLikeModle;
                late CommentLikeModle commentLikeModle;
                late ProductCommentUnLikeModle productCommentUnLikeModle;
                late ProductCommentLikeModle productCommentLikeModle;
                late ProductUnlikeModle productUnlikeModle;
                late ProductlikeModle productlikeModle;
//  late SocialLoginresponse socialModel;

   Future getsignupResponse({required String sendby,required String name,
    required var phone, required String email, required String password,} ) async {
    var postBody = jsonEncode({
     "sendBy":"email",
	"name": "$name",
    "phone":"$phone",
    "email":"$email",
    "password": "$password"
    });
 print("na$name");
  print("ph$phone");
   print("ee$email");
    print("pp$password");
      final response = await Dio().post("http://$baseurl/api/user/signup",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);

     return  response.data;

  }
  //Logout
  Future<Logoutresponse> getlogoutResponse() async {
    var postBody ;

    final response = await Dio().post("http://$baseurl/api/user/logout",
      //"${AppConfig.BASE_URL}/user/signup",
    options: Options(
    headers: {
       "Content-Type": "application/json",
          // "X-Requested-With": "XMLHttpRequest"// set content-length
    },
  ), 
        data: postBody);
     logoutModel = Logoutresponse.fromJson(response.data);
 
    return logoutModel; 
  }
  //DOB
    Future getDOBResponse({
     required String dob, required var id} ) async {
    var postBody = jsonEncode({
       "id":id,
    "date_of_birth":"${dob.toString()}",
    });
    
print('hii$dob');
print('hii$id');
print(preferences.getInt('Userid'));
    final response = await Dio().put("http://$baseurl/api/user/dob",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data:  postBody);
  print(response.data);
    //dobModel = DobResponse.fromJson(response.data);
     //print(dobModel.result);
     return  response.data;

  }

  
//   Future<DobResponse> getDOBResponse({
//      required String dob, required int id} ) async {
//     var postBody = jsonEncode({
//        "id":99,
//        //"$id",
//     "date_of_birth":"$dob",
//     });
// print('hii$dob');
// print('hii$id');
//     final response = await Dio().put("http://$baseurl/api/user/dob",
//     options: Options(
//     headers: {
//        "Content-Type": "application/json",
        
//     },
//   ),
    
//         data:  postBody);
   
//     dobModel = DobResponse.fromJson(response.data);
//      return  dobModel;

//   }
  //Create group
  Future<GroupDPresponse> getgroupResponse({
     required var filepath, required var filename, required String subject,required String msg } ) async {
        var formData;
        print(filepath.path);
        print(filename);
   formData = FormData.fromMap({
  'group_image':await MultipartFile.fromFile(filepath.path, filename: filename),
  //  await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
  'subject':subject.toString(),
  'message':msg.toString(),
});  
  final response = await Dio().post("http://$baseurl/api/group_image/group_image-create/",
 data: formData);
print(response);
  // if(response.statusCode==200){
  //   print('Updated');
  // }else{

  // } 
   
    groupModel = GroupDPresponse.fromJson(response.data);
    print(groupModel);
     return  groupModel;

  }
  //Profile Upload
 Future<ProfileUploadresponse> getProfileUploadResponse({
     required  filename, required int id} ) async {

var formData = FormData.fromMap({
  'profile': [
    await MultipartFile.fromFile(filename, filename: filename),
  //  await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
  ]
});
    final response = await Dio().post("http:///$baseurl/api/profile/profile-update/$id",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: formData);
   
    profileuploadModel =ProfileUploadresponse.fromJson(response.data);
     return  profileuploadModel;

  }
 //FCM Token
 Future<FcmTokenResponse > getfcmtoken({
     required  userid,required fcmtoken})async{

  var postBody = jsonEncode({
      "device_token":fcmtoken,
    "id":userid
    });
//print(email);

    final response = await Dio().post("http://$baseurl/api/user/device_token/tocken",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   
   fcmTokenResponse = FcmTokenResponse.fromJson(response.data);
     return  fcmTokenResponse;

}
Future<HomePageresponse > getProduct({
     required  userid,})async{

  var postBody = jsonEncode({
      "Userid":userid,
    });
//print(email);

    final response = await Dio().post("http://$baseurl/api/product/products",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   
    homeproduct = HomePageresponse.fromJson(response.data);
     return  homeproduct;

}
Future getBanner({
     required  userid,})async{

  var postBody = jsonEncode({
      "Userid":userid,
    });
//print(email);

    final response = await Dio().post("http://$baseurl/api/banner/",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   
    homeproduct = HomePageresponse.fromJson(response.data);
     return  homeproduct;

}

Future getMakeoffer({
  required makeprice,
  required buyerid,
     required  productid,})async{

  var postBody = jsonEncode({
     "make_price":"$makeprice",
	"product_id":productid,
	"buyer_id":buyerid
    });
print('hii $makeprice');
print(productid);
print(buyerid);
    final response = await Dio().post("http://$baseurl/api/make-price/bargain",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   
   // homeproduct = HomePageresponse.fromJson(response.data);
   print(response.data);
     return  response.data;

}
Future<ProfilePostModle> getProfilecollection(var id)async{

  
// print(id);

    final response = await Dio().get("http://$baseurl/api/product/user/users/$id",);
   
    profilePostModle = ProfilePostModle.fromJson(response.data);
   // print(response.data);
     return  profilePostModle ;


}
//Hastag Already Exist
Future<HastageExistDataResponseModle > getexisthastag({
     required  hastag,})async{

  var postBody = jsonEncode({
    "name": hastag
});
//print(email);

    final response = await Dio().post("http://$baseurl/api/hashtags/hashtag/exist",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   
   hastageExistDataResponseModle = HastageExistDataResponseModle.fromJson(response.data);
     return  hastageExistDataResponseModle;

}
 //Forgot password

   Future<ForgotpasswordResponse> getforgotpasswordresponse({
     required String email,} ) async {
    var postBody = jsonEncode({
       "sendBy":"email",
    //"phone":"$phone",
    "email":"$email",
    });
print(email);

    final response = await Dio().post("http://$baseurl/api/user/forgot-password",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   
    forgotpasswordModel = ForgotpasswordResponse.fromJson(response.data);
     return  forgotpasswordModel;

  }
  //AlredyExist
   Future<UserAlreadyExistModel> getalredyexitresponse({
     required String username,} ) async {
    var postBody = jsonEncode({

    "name":"$username",
    });
print(username);

    final response = await Dio().post("http://$baseurl/api/user/username-check",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   
    userexist = UserAlreadyExistModel.fromJson(response.data);
    print(userexist);
     return  userexist;

  }
   //EmailAlredyExist
   Future<EmailAlreadyExistResponse> getEmailalredyexitresponse({
     required String email,} ) async {
    var postBody = jsonEncode({

    "email":"$email",
    });
print(email);

    final response = await Dio().post("http://$baseurl/api/user/verification-signup",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   
  emailAlreadyExistResponse = EmailAlreadyExistResponse.fromJson(response.data);
    print(emailAlreadyExistResponse);
     return  emailAlreadyExistResponse;

  }
  //Group Name Already Exist
     Future<GroupNameAlreadyExistDataResponse> getGroupnamealredyexitresponse({
     required String username,} ) async {
    var postBody = jsonEncode({

    "subject":"$username",
    });
print(username);

    final response = await Dio().post("http://$baseurl/api/group_image/group_name_Exist/Exist",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
   
   groupNameAlreadyExistDataResponse= GroupNameAlreadyExistDataResponse.fromJson(response.data);
    // print(userexist);
     return  groupNameAlreadyExistDataResponse;

  }
  //fb sigin

  Future<SocialLoginresponse> getsocialResponse( {required String name,
    required String email, required String providerid,} ) async {
    var postBody = jsonEncode({
    
	"name": "$name",
  "email":"$email",
 "provider_id":"$providerid",
    
   
    });

    final response = await Dio().post("http://$baseurl/api/user/social-login",
      //"${AppConfig.BASE_URL}/user/signup",
    options: Options(
    headers: {
       "Content-Type": "application/json",
          // "X-Requested-With": "XMLHttpRequest"// set content-length
    },
  ),
 
        data: postBody);
   print(postBody);
    // socialModel = SocialLoginresponse.fromJson(response.data);

    return SocialLoginresponse.fromJson(response.data); //signupModelFromJson(response.data);
  }

//email verify
Future<Emailverifyresponse> getEmailverifyResponse({
     required String email} ) async {
    var postBody = jsonEncode({
    "email":"$email",
    });

    final response = await Dio().post("http://$baseurl/api/user/verification-signup",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
  
   emailverifyresponse = Emailverifyresponse.fromJson(response.data);
     return  emailverifyresponse;

  }
//SignIn

   Future getLoginResponse({
     required String email, required String password,} ) async {
    var postBody = jsonEncode({
    "email":"$email",
    "password": "$password"
    });

    final response = await Dio().post("http://$baseurl/api/user/signin",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
    
        data: postBody);
  
    //signresponse = SignInModel.fromJson(response.data);
     return  response.data;

  }
  
  Future<OtpResponse> getotp({
    required int id,
     required String code, } ) async {
    //SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
    //var userid = preferences.getInt("$user_id");
    var postBody = jsonEncode({
    "verification_code":"$code",
    });

    final response = await Dio().post("http://$baseurl/api/user/verification-code/$id",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
 data: postBody);
 otpresponse = OtpResponse.fromJson(response.data);

    return otpresponse;
  }
  //Confirm password
    Future<ConfirmpasswordResponse> getconfirmpassword({
    required int id,
     required String password, } ) async {
    var postBody = jsonEncode({
    "password":"$password",
    });

    final response = await Dio().post("http://$baseurl/api/user/confirm-password/$id",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
 data: postBody);
 confirmpassword =ConfirmpasswordResponse.fromJson(response.data);

    return confirmpassword;
  }
  //resend
   Future<ResendOtpResponse> resendotp({
    required var id,
 
     required String sendby,

     required String email,
      } ) async {

    var postBody = jsonEncode({
    "sendBy":"email",
	    "email":"$email",
    });
   print(email);
    final response = await Dio().post("http://$baseurl/api/user/resend-code/$id",
    options: Options(
    headers: {
       "Content-Type": "application/json",
        
    },
  ),
 data: postBody);
 resendotpresponse = ResendOtpResponse.fromJson(response.data);

    return resendotpresponse;
  }
  //FAQ API CALL
  Future<FaQresponse> getfaq()async{

final response = await http.get(Uri.parse("http://$baseurl/api/faq/"));

return faQresponseFromJson(response.body);

}
//Report
 Future<Reportresponse> getreport({
    required var id,
 
     required String reason,

     required String description,
      } ) async {

    var postBody = jsonEncode({
     "user_id":id,
        "reason_for_report":"$reason",
        "description":"$description"
    });
  print(id);
  print(reason);
  print(description);
    final response = await Dio().post("http://$baseurl/api/reports/send_report/",
   
 data: postBody);

 reportresponse = Reportresponse.fromJson(response.data);

    return reportresponse;
  }
  //help
  Future<Helpresponse> gethelp({
    required int id,
 
     required String reason,

     required String description,
      } ) async {

    var postBody = jsonEncode({
      "description" :"message",
     "user_id":id,
        "help_questions":"$reason",
        "messages":"$description"
    });
  // print(id);
  // print(reason);
  // print(description);
    final response = await Dio().post("http://$baseurl/api/help/send_help/",
   
 data: postBody);
print(response.data);
 helpresponse = Helpresponse.fromJson(response.data);

    return helpresponse;
  }
  //Profile Pic
     Future<ProfilePhotoresponse> getprofile({
    required var id,

      } )async{ 


   final response = await http.get(Uri.parse('http://$baseurl/api/profile/$id'));
  
   
  return profilePhotoresponseFromJson(response.body);

   }
 //  CommentLike Api
  Future<CommentLikeModle> getCommentlikeData({ required int commentid,required int postid, required int groupid})async{  
// print('object');
   //final response = await Dio().post('http://$baseurl/api/group_image/find_contact/find');
   var postBody = jsonEncode({
      "user_id":preferences.getInt('Userid'),
    "group_id": groupid,
    "post_id": postid,
    "comment_id": commentid
    });
   final response = await Dio().post('http://$baseurl/api/comment/likecomment',
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
  print(response);
  commentLikeModle =CommentLikeModle.fromJson(response.data);
  //  print(response);
  return commentLikeModle;
   }
//Unlike Api
  Future<CommentUnLikeModle> getCommentUnlikeData({ required int commentid,required int postid,})async{ 
  // print('object');
   //final response = await Dio().post('http://$baseurl/api/group_image/find_contact/find');
   var postBody = jsonEncode({
      "user_id":preferences.getInt('Userid'),
    "post_id":postid,
    "comment_id": commentid
    });
   final response = await Dio().post('http://$baseurl/api/comment/unlikecomment',
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
  print(response);
   commentUnLikeModle = CommentUnLikeModle.fromJson(response.data);
    // print(response);
  return commentUnLikeModle;
   }


    //  ProductCommentLike Api
  Future<ProductCommentLikeModle> getProductCommentlikeData({ required  commentid,required  postid,})async{  
// print('object');
   //final response = await Dio().post('http://$baseurl/api/group_image/find_contact/find');
   var postBody = jsonEncode({
      "user_id":preferences.getInt('Userid'),
    "product_id":commentid,
    "comment_id":postid
    });
   final response = await Dio().post('http://$baseurl/api/product_comment/likecomment',
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
  print(response);
  productCommentLikeModle =ProductCommentLikeModle.fromJson(response.data);
  //  print(response);
  return productCommentLikeModle;
   }
// ProductUnlike Api
  Future<ProductCommentUnLikeModle> getProductCommentUnlikeData({ required int commentid,required int postid,})async{ 
  // print('object');
   //final response = await Dio().post('http://$baseurl/api/group_image/find_contact/find');
   var postBody = jsonEncode({
      "user_id":preferences.getInt('Userid'),
    "product_id":commentid,
    "comment_id":postid
    });
   final response = await Dio().post('http://$baseurl/api/product_comment/unlikecomment',
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
  print(response);
   productCommentUnLikeModle = ProductCommentUnLikeModle.fromJson(response.data);
    // print(response);
  return productCommentUnLikeModle;
   }


   //  CommentLike Api
  Future<ProductlikeModle> getproductlikeData({ required  productid,})async{  
// print('object');
   //final response = await Dio().post('http://$baseurl/api/group_image/find_contact/find');
   var postBody = jsonEncode({
       "user_id":preferences.getInt('Userid'),
    "product_id":productid,
    });
   final response = await Dio().post('http://$baseurl/api/product/likeproduct',
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
  //print(response);
 productlikeModle =ProductlikeModle.fromJson(response.data);
  //  print(response);
  return productlikeModle;
   }
//Unlike Api
  Future<ProductUnlikeModle> getproductUnlikeData({required  productid,})async{ 
  // print('object');
   //final response = await Dio().post('http://$baseurl/api/group_image/find_contact/find');
   var postBody = jsonEncode({
      "user_id":preferences.getInt('Userid'),
    "product_id":productid,
    
    });
   final response = await Dio().post('http://$baseurl/api/product/unlikeproduct',
    options: Options(
    headers: {
       "Content-Type": "application/json",  
    },
  ),
    
        data: postBody);
  //print(response);
  productUnlikeModle = ProductUnlikeModle.fromJson(response.data);
    // print(response);
  return productUnlikeModle;
   }
  // Future<SignInModel> getLoginResponse({
  //    required String email, required String password,} ) async {
  //   var postBody = jsonEncode({
  //   "email":"$email",
  //   "password": "$password"
  //   });

  //   final response = await Dio().post("http://$baseurl/api/user/signin",
  //   options: Options(
  //   headers: {
  //      "Content-Type": "application/json",
        
  //   },
  // ),
    
  //       data: postBody);

  //   signresponse = SignInModel.fromJson(response.data);

  //   return signresponse;
  //  // return signInModelFromJson(response.data);
  // }
}