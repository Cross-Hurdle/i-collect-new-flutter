// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/ImageView.dart';
import 'package:icollekt/Model/GroupImageUpdateResponse.dart';
import 'package:icollekt/Model/JoinRequest_Modle.dart';
import 'package:icollekt/Model/UpdateGroupImageDp.dart';
import 'package:icollekt/Model/ViewGroupModle.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

import 'AboutOtherGroup.dart';
import 'GroupPhotos.dart';
import 'grouppostprocess.dart';


class CollectionGroupPage extends ConsumerStatefulWidget {

 
  const CollectionGroupPage({Key? key, }) : super(key: key);

  @override
  _CollectionGroupPageState createState() => _CollectionGroupPageState();
}
class _CollectionGroupPageState extends ConsumerState<CollectionGroupPage> {
 String  isjoin= 'Join Group';
  var viewdata;
  void initState() {
//  viewdata =ref.read(viewgroupprov);
 getGroupprofilepic(ref.read(viewgroupprov));
    super.initState();
  }
  //join request
  JoinRequestDataResponse? joiDataResponse;
 //getAllinviteGroupData
 getAlljoinGroupData1(context)async { 
   print('object123');
  //  print(ref.read(viewgroupprov).groupid!.toInt());
  //    print(ref.read(viewgroupprov).adminid!.toInt());
     joiDataResponse = await GroupAndChatRepository().getAlljoinRequestGroupData(
       groupid:ref.read(viewgroupprov).groupid!.toInt(), 
     adminid:ref.read(viewgroupprov).adminid!.toInt());
   print(joiDataResponse!.message);
   print('object');
    if(joiDataResponse!.result==false){
      isjoin= 'Request Sent';
       showToast(joiDataResponse!.message,
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,
                    
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);
    // Navigator.pop(context);
      print(joiDataResponse!.message); 
    }else{

    }
     setState(() {
       
     });
     


}
   //ProfileUpdatedp
 Future cameraImage(context,)async{
    var status = await Permission.camera.request();
  
  setState(() {
    //_image= File( camera.);
  });
    if (status.isDenied) {
      // We didn't ask for permission yet.
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Photo Permission'),
                content: Text('This app needs photo to upload user document'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    } else if (status.isRestricted) {
      Fluttertoast.showToast(msg:
          "Go to your application settings and give photo permission ", );
    } else if (status.isGranted) {

var pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile == null) {
            print('object1');
         showToast("No file is chosen",
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,
                    
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);

      }
       else {
    // ignore: unnecessary_null_comparison
    if (pickedFile != null) {
      print('object');
        File imageFile = File(pickedFile.path);
      

        
 uploadImageToDB(imageFile,ref.watch(viewgroupprov));
 //getprofilepic();


    }

      }

    }
 }

//post for camera
Future cameraImageforpost(context,Grouppostprov post)async{
    var status = await Permission.camera.request();
  
  setState(() {
    //_image= File( camera.);
  });
    if (status.isDenied) {
      // We didn't ask for permission yet.
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Photo Permission'),
                content: Text('This app needs photo to upload user document'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    } else if (status.isRestricted) {
      Fluttertoast.showToast(msg:
          "Go to your application settings and give photo permission ", );
    } else if (status.isGranted) {

var pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile == null) {
            print('object1');
         showToast("No file is chosen",
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,
                    
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);

      }
       else {
    // ignore: unnecessary_null_comparison
    if (pickedFile != null) {
      print('object');
        File imageFile = File(pickedFile.path);
        print(imageFile);
        post.photodata=imageFile;
//uploadImageToDBbg1(imageFile ,);
//uploadImageToDBbg1(imageFile,ref.read(viewgroupprov));
setState(() {
  
});
    }

      }

    }
 }

  //Post in group
   chooseAndUploadImageforpost(context,Grouppostprov post) async {
    var status = await Permission.photos.request();

    if (status.isDenied) {
      // We didn't ask for permission yet.
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Photo Permission'),
                content: Text('This app needs photo to upload user document'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    } else if (status.isRestricted) {
      Fluttertoast.showToast(msg:
          "Go to your application settings and give photo permission ", );
    } 
    else if (status.isGranted) {
      FilePickerResult filePickerResult;
      
      filePickerResult = (await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      ))!;

      // ignore: unnecessary_null_comparison
      if (filePickerResult == null) {
        print('object123');
      } else {
        File _file = File("${filePickerResult.files.single.path}");
        post.photodata=_file;
//uploadImageToDBbg1(_file,ref.read(viewgroupprov));

      }


    }
  }

 chooseAndUploadImage(context) async {
    var status = await Permission.photos.request();

    if (status.isDenied) {
      // We didn't ask for permission yet.
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Photo Permission'),
                content: Text('This app needs photo to upload user document'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    } else if (status.isRestricted) {
      Fluttertoast.showToast(msg:
          "Go to your application settings and give photo permission ", );
    } 
    else if (status.isGranted) {
      FilePickerResult filePickerResult;
      
      filePickerResult = (await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      ))!;

      // ignore: unnecessary_null_comparison
      if (filePickerResult == null) {
        print('object');
      } else {
        File _file = File("${filePickerResult.files.single.path}");
 uploadImageToDB(_file,ref.watch(viewgroupprov));


      }


    }
  }
  
//Dp API Call
uploadImageToDB(filepath,ViewGroupData viewdata) async {

       String filename= basename(filepath.path);
      //  imagetodb.filepathprov=filename;
      try{
      var formData = FormData.fromMap({
  'group_image': [
    await MultipartFile.fromFile(filepath.path, filename: filename),
  //  await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
  ]
});  
  final response = await Dio().post("http://i-collekt.jksoftec.com:3001/api/group_image/group_image-update/${viewdata.groupid!}",
 data: formData);
//  print('hello${filename}');
    if(response.statusCode == 200 ){

   
      UpdateGroupImageDpDataResponse dp;
      dp=UpdateGroupImageDpDataResponse.fromJson( response.data);
    
      // imagetodb.filepathprov=dp.profilePicUrl;
      //   print('response data11 ${imagetodb.filepathprov}');
      // print('response data ${dp.profilePicUrl}');
       print('successfully uploaded');

    }else{ 
     
      print('could not be uploaded');
    }
      }catch(e){

      }


    setState(() {});
  }
//BackGround imagepicker
 Future cameraImageforbg(context,)async{
    var status = await Permission.camera.request();
  
  setState(() {
    //_image= File( camera.);
  });
    if (status.isDenied) {
      // We didn't ask for permission yet.
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Photo Permission'),
                content: Text('This app needs photo to upload user document'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    } else if (status.isRestricted) {
      Fluttertoast.showToast(msg:
          "Go to your application settings and give photo permission ", );
    } else if (status.isGranted) {

var pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile == null) {
            print('object1');
         showToast("No file is chosen",
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,
                    
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);

      }
       else {
    // ignore: unnecessary_null_comparison
    if (pickedFile != null) {
      print('object');
        File imageFile = File(pickedFile.path);
//uploadImageToDBbg1(imageFile ,);
uploadImageToDBbg1(imageFile,ref.read(viewgroupprov));

    }

      }

    }
 }


 chooseAndUploadImageforbg(context) async {
    var status = await Permission.photos.request();

    if (status.isDenied) {
      // We didn't ask for permission yet.
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Photo Permission'),
                content: Text('This app needs photo to upload user document'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    } else if (status.isRestricted) {
      Fluttertoast.showToast(msg:
          "Go to your application settings and give photo permission ", );
    } 
    else if (status.isGranted) {
      FilePickerResult filePickerResult;
      
      filePickerResult = (await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      ))!;

      // ignore: unnecessary_null_comparison
      if (filePickerResult == null) {
        print('object');
      } else {
        File _file = File("${filePickerResult.files.single.path}");

uploadImageToDBbg1(_file,ref.read(viewgroupprov));

      }


    }
  }
  //Background Api Call
uploadImageToDBbg1(filepath,ViewGroupData viewdata) async {

       String filename= basename(filepath.path);
      try{
      var formData = FormData.fromMap({
  'group_banner': [
    await MultipartFile.fromFile(filepath.path, filename: filename),
  ]
});  
  final response = await Dio().post("http://i-collekt.jksoftec.com:3001/api/group_image/group_banner-update/${viewdata.groupid}",
 data: formData);

    if(response.statusCode == 200 ){
   
     //next1 ='Next';
   UpdateGroupbannerDataResponse dp;
      dp=UpdateGroupbannerDataResponse.fromJson( response.data);

      print('response data ${dp.groupBannerUrl}');
       print('successfully uploaded');
    }else{ 
      
      print('could not be uploaded');
    }
      }catch(e){

      }
 
if(mounted){
 setState(() {});
}
   
  }
  var subject='' ;
   var message='' ;
 var pic='';
 var groupname='';
 var id=0;
 var count=0;
 ViewGroupDataResponse?viewgroupResponse;
    getGroupprofilepic(ViewGroupData viewdata)async{  
 viewgroupResponse = await GroupAndChatRepository().getViewGroupData(
    id:viewdata.groupid!
      );
  // print('Idddddddd${ viewdata.groupid}');
  print(viewgroupResponse!.data.groupBanner);
    try {
      pic=viewgroupResponse!.data.groupImage;
      groupname=viewgroupResponse!.data.groupBanner;
       subject=viewgroupResponse!.data.subject;
       message= viewgroupResponse!.data.message;
       id=viewgroupResponse!.data.id;
       count=viewgroupResponse!.usercount;
    } catch (e) {
      print(e);
    } 
    if (mounted) {
       setState(() {
     
   });
    }
  
}
//Remove Api Call For Dp
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(viewgroupprov);
    return Scaffold(
      appBar: topappbar(context),
      body: Builder(
        builder: (context) {
          getGroupprofilepic(ref.read(viewgroupprov));
          return Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: 
                  [GestureDetector(
                    onTap: (){
                     
                   // backgroundImageBottomsheet(context,ref.read(viewphotoprov));
                      print('BackGroundpic');
                    },
                    child: Container(
                   //  color: Colors.yellow,
                      height: 20.5.h,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                             height: 14.5.h,
                            width: double.infinity,
                             color: Colors.grey[600],
                            child: Builder(
                              builder: (context) {
                               //  getGroupprofilepic(ref.read(viewgroupprov));
                                return CachedNetworkImage(
                                      imageUrl:   groupname,
                                           imageBuilder: (context, imageProvider) =>Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                       // colorFilter:
                                          //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                            ),
                                  ),
                                ),
                                     // placeholder: (BuildContext, String)=>,  
                                      progressIndicatorBuilder: (context, url, downloadProgress) => 
                                              CircularProgressIndicator(value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                      //Icon(Icons.error)
                                        Image.asset("Assets/Images/placeholder-image.png",fit: BoxFit.cover,),
                                   );
                              }
                            ),
                          ),
                          // Image.asset("Assets/Images/bg.png",
                          //     width: double.infinity,
                          //     fit: BoxFit.contain,),
                        ],
                      ),
                    ),
                  ),
                     Positioned(
                    top: 7.5.h,
                    child:  GestureDetector(
                      onTap: (){
                  // profiledpImage(context,ref.read(viewphotoprov));
                        print('Profiledp');
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 39.sp,
                        child: CircleAvatar(
                          radius: 33.sp,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Builder(
                              builder: (context) {
                                getGroupprofilepic(ref.read(viewgroupprov));
                                return CachedNetworkImage(
                                imageUrl:'$pic',
                          ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                                 width: 9.5.h,
                                  height: 9.5.h,
                                     fit: BoxFit.cover,
                                     imageBuilder: (context, imageProvider) =>CircleAvatar(
                          radius: 33.sp,
                      
                          child:  Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                 // colorFilter:
                                    //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                      ),
                        ),
                      ),                 
                          ),
                                      
                                progressIndicatorBuilder: (context, url, downloadProgress) => 
                      CircularProgressIndicator(value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
                         );
                              }
                            ),
                          ),
                        ),
                      ),
                    ),
                  
                    ),
                ],
              ),
              SizedBox(height: 1.h,),
             Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                    width: 50.w,
                   child: Center(
                     child: Text('$subject',
                       overflow: TextOverflow.ellipsis,
                     style:TextStyle(
                       color: Color(0xff1A1A1A),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        fontFamily: 'Gilroy'
                     ),
                     ),
                   ),
                 )
               ],
             ),
              SizedBox(height: 2.h,),
              Container(
                width: 70.w,
                child: Center(
                  child: Text('$message',
                    overflow: TextOverflow.ellipsis,
                  style:TextStyle(
                    color: Color(0xff1A1A1A),
                     fontWeight: FontWeight.w400,
                     fontSize: 13.sp,
                     fontFamily: 'Gilroy'
                  ),
                  ),
                ),
              ),
             SizedBox(height: 2.h,),
           // Text('${viewdata.groupid}'),
            // CustomButton(title: 'Join group', ontapped: ()=>Sample(), nav: false),
            // //  Row(
            // //    children: [
            // //      CustomButton1(title: 'Join group', ontapped: ()=>Sample(), nav: false),
            // //        CustomButton1(title: 'Post in group', ontapped: ()=>Sample(), nav: false),
            // //    ],
            // //  ),
            //   Row(
            //    children: [
            //      CustomButton1(title: 'Posts', ontapped:  ()=>Sample(), nav: false),
            //        CustomButton1(title: 'Photos', ontapped:  ()=>Sample(), nav: false),
            //    ],
            //  ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                // CustomButton1(title: 'Join group', ontapped: ()=>Sample(), nav: false),
                    InkWell(
                 onTap: (){
                  // isjoin='Joined';
                   data.adminid=viewgroupResponse!.data.userId;
                    getAlljoinGroupData1(context);
                   setState(() {
                     
                   });
                   
          //           pushNewScreen(
          //     context,
          //     screen: GrouppostProcess() ,
          //     withNavBar: false, // OPTIONAL VALUE. True by default.
          //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
          // );
              },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  width:94.w,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(5),
                    color: Color(0xff591B4C)
                  ),
                  child: Center(child: Text('$isjoin',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                    fontSize: 16
                  ),
                  )),
                ),
              ),
          //           InkWell(
          //        onTap: (){
          //           pushNewScreen(
          //     context,
          //     screen: GrouppostProcess() ,
          //     withNavBar: false, // OPTIONAL VALUE. True by default.
          //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
          // );
          //     },
          //       child: Container(
          //         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          //         width:45.w,
          //         height: 50,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadiusDirectional.circular(5),
          //           color: Color(0xff591B4C)
          //         ),
          //         child: Center(child: Text('Post in group',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.w600,
          //           fontFamily: "Gilroy",
          //           fontSize: 16
          //         ),
          //         )),
          //       ),
          //     )
               ],
             ),
              Row(
               children: [
                // CustomButton1(title: 'About', ontapped:  ()=>Sample(), nav: false),
                  InkWell(
                 onTap: (){
                  data.groupname=subject;
                  data.groupimage=pic;
                  data.groupmessage=message;
                  data.groupid=id;
                  data.count=count;
                   // cameraOrGallery(context,'post');
                    pushNewScreen(
              context,
              screen: OtherAboutGroup() ,
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
                // onPressed(function: onpressedtitle);
              },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  width:45.w,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(5),
                    color: Color(0xff591B4C)
                  ),
                  child: Center(child: Text('About',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                    fontSize: 16
                  ),
                  )),
                ),
              ),
                  InkWell(
                 onTap: (){
                  data.groupname=subject;
                  data.groupimage=pic;
                    data.groupid=id;
                    
                   // cameraOrGallery(context,'post');
                    pushNewScreen(
              context,
              screen:  GroupPhotos() ,
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
                // onPressed(function: onpressedtitle);
              },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  width:45.w,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(5),
                    color: Color(0xff591B4C)
                  ),
                  child: Center(child: Text('Photos',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                    fontSize: 16
                  ),
                  )),
                ),
              )
                  // CustomButton1(title: 'Photos', ontapped:  ()=>GroupPhotos(), nav: false),
               ],
             ),
          //      InkWell(
          //        onTap: (){
          //         data.groupname=subject;
          //         data.groupimage=pic;
          //           data.groupid=id;
          //           print( id);
          //          // cameraOrGallery(context,'post');
          //           pushNewScreen(
          //     context,
          //     screen:  GrupPost() ,
          //     withNavBar: false, // OPTIONAL VALUE. True by default.
          //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
          // );
          //       // onPressed(function: onpressedtitle);
          //     },
          //       child: Container(
          //         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          //         width:100.w,
          //         height: 50,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadiusDirectional.circular(5),
          //           color: Color(0xff591B4C)
          //         ),
          //         child: Center(child: Text('Posts',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.w600,
          //           fontFamily: "Gilroy",
          //           fontSize: 16
          //         ),
          //         )),
          //       ),
          //     )
            ],
          );
        }
      ),
    );
  }

  AppBar topappbar(context){
    return AppBar(
     
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
        leading: GestureDetector(
        onTap: (){
        Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
    );
  }
  backgroundImageBottomsheet(BuildContext context,ViewPhotoData bgphototprov ){
    return showCupertinoModalBottomSheet(
                    enableDrag: true,
                              expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
     // margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
         topLeft: Radius.circular(20.0),
         topRight: Radius.circular(20.0),
         bottomLeft: Radius.zero,
         bottomRight: Radius.zero,
               ),
      ),
      height: 35.h,
      child: Column(
        children: [
          Container(
             margin: EdgeInsets.symmetric(vertical: 12.sp),
            child: Text('Background image',
            style: TextStyle(
              decoration: TextDecoration.none,
                  fontFamily: 'Gilroy',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff591B4C))
            ),
          ),
         Divider(thickness: 1,),
           GestureDetector(
               onTap: (){
                  bgphototprov.photodata=groupname;
                pushNewScreen(
          context,
          screen: ImageView(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
             },
             child: Container(
               margin: EdgeInsets.symmetric(vertical: 6.sp),
              child: Text('View image',
              style: TextStyle(
                decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A))
              ),
                     ),
           ),
          Divider(thickness: 1,),
          GestureDetector(
              onTap: (){
                Navigator.pop(context);
               cameraOrGallery(context,'bg',ref.watch(grouppostprov));
             },
            child: Container(
               margin: EdgeInsets.symmetric(vertical: 6.sp),
              child: Text('Upload image',
              style: TextStyle(
                decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A))
              ),
            ),
          ),
          Divider(thickness: 1,),
          GestureDetector(
            onTap: () {
               Navigator.pop(context);
            // getdeletebannerprofilepic();
            },
            child: Container(
               margin: EdgeInsets.symmetric(vertical: 6.sp),
              child: Text('Remove image',
              style: TextStyle(
                decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A))
              ),
            ),
          ),
          Divider(thickness: 1,),
           GestureDetector(
             onTap: (){
              Navigator.pop(context);
             },
             child: Container(
               margin: EdgeInsets.symmetric(vertical: 6.sp),
              child: Text('Cancel',
              style: TextStyle(
                decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A))
              ),
                     ),
           ),
        ],
      ),
    ),
                            );
  }
  profiledpImage(BuildContext context,ViewPhotoData dpphototprov ){
    return  showCupertinoModalBottomSheet(
                    enableDrag: true,
                              expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
     // margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
         topLeft: Radius.circular(20.0),
         topRight: Radius.circular(20.0),
         bottomLeft: Radius.zero,
         bottomRight: Radius.zero,
               ),
      ),
      height: 35.h,
      child: Column(
        children: [
          Container(
             margin: EdgeInsets.symmetric(vertical: 12.sp),
            child: Text('Profile picture',
            style: TextStyle(
              decoration: TextDecoration.none,
                  fontFamily: 'Gilroy',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff591B4C))
            ),
          ),
         Divider(thickness: 1,),
           GestureDetector(
               onTap: (){
                 dpphototprov.photodata=pic;
                pushNewScreen(
          context,
          screen: ImageView(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
             },
             child: Container(
               margin: EdgeInsets.symmetric(vertical: 6.sp),
              child: Text('View image',
              style: TextStyle(
                decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A))
              ),
                     ),
           ),
          Divider(thickness: 1,),
          GestureDetector(
              onTap: (){
                 Navigator.pop(context);
               cameraOrGallery(context,'dp',ref.watch(grouppostprov));
             },
            child: Container(
               margin: EdgeInsets.symmetric(vertical: 6.sp),
              child: Text('Upload image',
              style: TextStyle(
                decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A))
              ),
            ),
          ),
          Divider(thickness: 1,),
          GestureDetector(
            onTap: () {
               Navigator.pop(context);
            //  getdeletedpprofilepic();
            },
            child: Container(
               margin: EdgeInsets.symmetric(vertical: 6.sp),
              child: Text('Remove image',
              style: TextStyle(
                decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A))
              ),
            ),
          ),
          Divider(thickness: 1,),
           GestureDetector(
             onTap: (){
             Navigator.pop(context);
             },
             child: Container(
               margin: EdgeInsets.symmetric(vertical: 6.sp),
              child: Text('Cancel',
              style: TextStyle(
                decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A))
              ),
                     ),
           ),
        ],
      ),
    ),
                            );
  }
    cameraOrGallery(BuildContext context,String dporbg,Grouppostprov post ){
    return showCupertinoModalBottomSheet(
                    enableDrag: true,
                              expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
      //margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
         topLeft: Radius.circular(20.0),
         topRight: Radius.circular(20.0),
         bottomLeft: Radius.zero,
         bottomRight: Radius.zero,
               ),
      ),
      height: 30.h,
      child: Column(
        children: [
          Container(
             margin: EdgeInsets.symmetric(vertical: 12.sp),
            child: Builder(
              builder: (context) {
                if(dporbg=='post'){
         // chooseAndUploadImageforpost(context);
           return Text('Post in group',
                style: TextStyle(
                   decoration: TextDecoration.none,
                      fontFamily: 'Gilroy',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff591B4C))
                );
              }else
              
                return Text('Choose Camera or Gallery',
                style: TextStyle(
                   decoration: TextDecoration.none,
                      fontFamily: 'Gilroy',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff591B4C))
                );
              }
            ),
          ),
         Divider(thickness: 1,),
           GestureDetector(
               onTap: (){
                  Navigator.pop(context);
                  if (dporbg=='dp') {
                    return    chooseAndUploadImage(context,);
                  }  else if(dporbg =='bg'){
                       chooseAndUploadImageforbg(context,);
                  }else if(dporbg=='post'){
                   // CustomButton1(title: 'Join group', ontapped: ()=>Sample(), nav: false);
          chooseAndUploadImageforpost(context,ref.watch(grouppostprov));
            pushNewScreen(
          context,
          screen: GrouppostProcess() ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ).then((value) => post.photodata!.path!='');
              }
              
                // Navigator.pop(context);
             },
             child: Container(
               margin: EdgeInsets.symmetric(vertical: 6.sp),
              child: Text('Gallery',
              style: TextStyle(
                 decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A))
              ),
                     ),
           ),
          Divider(thickness: 1,),
          GestureDetector(
              onTap: (){
                 Navigator.pop(context);
                
                   if (dporbg=='dp') {
                     cameraImage(context,);
                  } else if(dporbg =='bg'){
                   cameraImageforbg(context,);
                  }else if(dporbg=='post'){
                   // CustomButton1(title: 'Join group', ontapped: ()=>Sample(), nav: false);
          cameraImageforpost(context,ref.watch(grouppostprov));
                     pushNewScreen(
          context,
          screen: GrouppostProcess() ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ).then((value) => post.photodata!.path!='');
              }
               // chooseAndUploadImage(context,ref.watch(profiledpUpdateprov));
              //   Navigator.pop(context);
             },
            child: Container(
               margin: EdgeInsets.symmetric(vertical: 6.sp),
              child: Text('Camera',
              style: TextStyle(
                 decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A))
              ),
            ),
          ),
            Divider(thickness: 1,),
          GestureDetector(
              onTap: (){
                 Navigator.pop(context);
                
                 
             },
            child: Container(
               margin: EdgeInsets.symmetric(vertical: 6.sp),
              child: Text('Cancel',
              style: TextStyle(
                 decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A1A))
              ),
            ),
          ),
        ],
      ),
    ),
      );
  }
}