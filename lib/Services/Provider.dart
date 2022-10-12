import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

// final collectionProv1 =ChangeNotifierProvider((ref)=>CollectionProvider());

// class CollectionProvider extends ChangeNotifier{
// List collection=[];
// int? id;
//   bool isselected=false;
//   void mapselected( ){

//      collection.forEach((element) {
//     print(element['id']);
//     if(element['id']==id){

//   isselected=true;
//     }else{
//        isselected=false;
//     }
//   });
//   notifyListeners();
//   }
//   mapcollection(List selecteditems){
//     collection=selecteditems;
//     notifyListeners();
//   }
//   mapid(int selectedid){
//   id = selectedid;
//   notifyListeners();
//   }
// }
final collectionProv =ChangeNotifierProvider((ref)=>CollectionData());

class CollectionData extends ChangeNotifier{
var selectcontainer;
List selectedIndex =[];
List selected=[];
}
//Contact
final contactProv =ChangeNotifierProvider.autoDispose((ref)=>ContactData());

class ContactData extends ChangeNotifier{

List selectedIndex =[];
List selected=[];
}
//Contact
final commentProv =ChangeNotifierProvider.autoDispose((ref)=> CommentData());

class CommentData extends ChangeNotifier{

List selectedIndex =[];
List selected=[];
}
//InviteContact
final invitecontactProv =ChangeNotifierProvider((ref)=>InviteContactData());

class InviteContactData extends ChangeNotifier{

List selectedIndex =[];
List selected=[];
}
final hastagProv =ChangeNotifierProvider((ref)=>HastagData());

class HastagData extends ChangeNotifier{

List selectedhastagIndex =[];
 List selected=[];
}
final hastagProductProv =ChangeNotifierProvider((ref)=>HastagProductData());
class HastagProductData extends ChangeNotifier{

List selectedhastagIndex =[];
 List selected=[];
 List selectedname=[];
}
final loginProv =ChangeNotifierProvider((ref)=>Logindata());
class Logindata extends ChangeNotifier{
String? password;
 String? email;
}
final signupprov = ChangeNotifierProvider((ref)=>SignupData());

class SignupData extends ChangeNotifier{
String ? username;
String?password;
String ?phone;
 String? email;
 String?otp;
 int? id;
}

final profilepicprov = ChangeNotifierProvider((ref)=> ProfileImageData());

class ProfileImageData extends ChangeNotifier{
  String? dp;
  String ? bg;
  
}

final forgotpasswordprov = ChangeNotifierProvider((ref)=>ForgotpasswordData());

class ForgotpasswordData extends ChangeNotifier{
  String ? email;
  String? password;
  var id ;
}

final creategroupprov = ChangeNotifierProvider.autoDispose((ref)=>CreateGroupData());

class CreateGroupData extends ChangeNotifier{
File? filepathprov;
File? file;
int? groupid;
String? subject;
String? message;
File? filepathprovbg;
File? filebg;
}
final profiledpprov = ChangeNotifierProvider((ref)=>CreateProfileData());

class CreateProfileData extends ChangeNotifier{
String? filepathprov;
File? profledp;

}
final  profilebgprov = ChangeNotifierProvider((ref)=>CreatebackgroungData());

class CreatebackgroungData extends ChangeNotifier{
var filepathprov;
File? profilebg;

}
final  profiledpUpdateprov = ChangeNotifierProvider((ref)=>UpdateProfiledpData());

class UpdateProfiledpData extends ChangeNotifier{
String? filepathprov;
File? profledp;

}

final reportprov = ChangeNotifierProvider((ref)=>ReportData());

class ReportData extends ChangeNotifier{
String? frommail;
String? tomail;
}
final  helpprov = ChangeNotifierProvider((ref)=>HelpDatapro());

class HelpDatapro extends ChangeNotifier{
String? frommail;
String? tomail;

}

//Product 

final profileproductdataprov = ChangeNotifierProvider((ref)=>ProfileproductData());

class ProfileproductData extends ChangeNotifier{
 int? producttype;
  String? title;
   String?price;       
   String?image;         
   String? hastag;         
    String?description;    
    var id;  
}

final profilepicviewprov = ChangeNotifierProvider((ref)=>ProfilepicviewData());

class ProfilepicviewData extends ChangeNotifier{
String? banner;
String? dp;
}


final hastagproductcardprov = ChangeNotifierProvider((ref)=>HastagproductcardData());

class HastagproductcardData extends ChangeNotifier{
var userid;
// hastag(){
  
// }
String? hastag;
String? hastagproductcard;
}


final viewgroupprov = ChangeNotifierProvider((ref)=>ViewGroupData());

class ViewGroupData extends ChangeNotifier{
// File? filepathprov;
// File? file;
int? groupid;
int?adminid;
String? groupname;
String? groupmessage;
String? groupimage;
int? count;
int? postid;

}
final viewMygroupprov = ChangeNotifierProvider((ref)=>ViewMyGroupData());

class ViewMyGroupData extends ChangeNotifier{
// File? filepathprov;
// File? file;
int? groupid;
String? groupname;
String? groupImagedp;
String? message;
String ? postimage;
}
final imagePreviewprov = ChangeNotifierProvider((ref)=>ImagePreviewData());

class  ImagePreviewData extends ChangeNotifier{
// File? filepathprov;
// File? file;
List?  imagepreview=[];
}

final chatdataprov = ChangeNotifierProvider((ref)=>ChatData());
class ChatData extends ChangeNotifier{
 // String? groupname;
String? image;
String? name;
int? id;
int? roomid;
}

final onetoonechatdataprov = ChangeNotifierProvider((ref)=>OneToOneChatDataProv());
class OneToOneChatDataProv extends ChangeNotifier{
 // String? groupname;
// String? image;
String? chat;
int? chatid;
int? fromid;
String? toid;
}
final viewphotoprov= ChangeNotifierProvider((ref)=>ViewPhotoData());

class ViewPhotoData extends ChangeNotifier{
 String ? photodata;
}
final grouppostprov= ChangeNotifierProvider.autoDispose((ref)=>Grouppostprov());

class Grouppostprov extends ChangeNotifier{
 File? photodata;
 File? empty;

}
final creategroupnavigatorprov= ChangeNotifierProvider.autoDispose((ref)=>Creategroupnavigatorprov());

class Creategroupnavigatorprov extends ChangeNotifier{
String? creategroup;
String? addgroup;
}
final signupdataprov= ChangeNotifierProvider.autoDispose((ref)=>Signupdataprov());

class Signupdataprov extends ChangeNotifier{
String? name;
String? email;
int ?id;
bool? status;
}
final notificationswitch = ChangeNotifierProvider((ref)=>Notificationswitch());
class Notificationswitch extends ChangeNotifier{

     bool ?isSwitched ;
      bool ?isSwitched1;
       bool? isSwitched2 ;
}


final commentinfo= ChangeNotifierProvider.autoDispose((ref)=> Commentinfo());

class Commentinfo extends ChangeNotifier{
String? postname;
String? subject;
String? profile;
String? dateandtime;
int ?id;
//bool? status;
}
final uploadquestion= ChangeNotifierProvider((ref)=> Uploadquestion());

class Uploadquestion extends ChangeNotifier{
String? option;
//bool? status;
}
final productupload = ChangeNotifierProvider((ref)=>ProductuploadProv());
class ProductuploadProv extends ChangeNotifier{
  //question
  // String? option;
String? width;
String? length;
 String? height;
String? weight;
List selectedhastagIndex =[];
// List<String>?videolength=;
//String? videolength;
 List selected=[];
List<File> productimage=[];
File? tumbnail;
String? productname;
String? description;
var id;
String? name;
String? address;
String? phoneNumber;
String? country;
String? state;
String? zipcode;
var price =0;
var minprice;
}
final videolength = ChangeNotifierProvider((ref)=>Videolength());
class Videolength extends ChangeNotifier{
List videolength=[];
//String? videolength;
}
final producttype = ChangeNotifierProvider.autoDispose((ref)=>ProducttypeProv());
class ProducttypeProv extends ChangeNotifier{

var type;
var id;
}
final addressProv =ChangeNotifierProvider((ref)=>AddressData());
class AddressData extends ChangeNotifier{
int id=0;
void selectaddress(addressid){
id= addressid;
notifyListeners();
}
List selectedaddressIndex =[];
 List selected=[];
}
final productpostprov = ChangeNotifierProvider((ref)=>ProductData());

class ProductData extends ChangeNotifier{
// File? filepathprov;
// File? file;

int? count;
int? productid;

}
final otherprofile = ChangeNotifierProvider.autoDispose((ref)=>OtherProfileProv());
class OtherProfileProv extends ChangeNotifier{
 // String? groupname;
// String? image;
// List selectedhastagIndex =[];
//  List selected=[];
// List<File> ?productimage;
// File? tumbnail;
// String? productname;
// String? description;
var id;
String? name;
String? dp;
String? bg;
// String? address;
// String? phoneNumber;
// String? country;
// String? state;
// String? zipcode;
// var price =0;
// var minprice;
}

