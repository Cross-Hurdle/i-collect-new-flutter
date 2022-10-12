

// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/GroupPostedModle.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class GrouppostProcess extends ConsumerStatefulWidget {
  const GrouppostProcess({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GrouppostProcessState();
}

class _GrouppostProcessState extends ConsumerState<GrouppostProcess> {
  TextEditingController _controller = TextEditingController();
  VideoPlayerController? _videoPlayerController;
 bool posted=false;
validate(context,Grouppostprov grouppicprov){
  if(_controller.text.toString().isEmpty){
     showToast('Enter subject',
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
   else if( grouppicprov.photodata==null){
 showToast('Please Upload Image',
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
 
  //Navigator.pop(context);
  else{
    print('objectok');
    posted=true;
   // Navigator.pop(context);
uploadImageToDB(context);
setState(() {
  
});
  }
}
//post for camera
Future cameraImageforpost(context,Grouppostprov post)async{
    var status = await Permission.storage.request();
  
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
    var status = await Permission.storage.request();

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
        type: FileType.media,
        allowMultiple: false,
      ))!;

      // ignore: unnecessary_null_comparison
      if (filePickerResult == null) {
       
      } else {
        File _file = File("${filePickerResult.files.single.path}");
        post.photodata=File("${filePickerResult.files.single.path}");
        _videoPlayerController=VideoPlayerController.file( post.photodata!)..initialize().then((value) {
          setState(() {
            
          });
          _videoPlayerController!.play();
        });
//uploadImageToDBbg1(_file,ref.read(viewgroupprov));
setState(() {
  
});
      }


    }
  }
 //Posted
  bool loader=false;

 uploadImageToDB(context) async {
   String url='http://i-collekt.jksoftec.com:3001/api/conversation/upload/${preferences.getInt('Userid')}/${ref.read(viewgroupprov).groupid!}';
   String filename= basename(ref.read( grouppostprov).photodata!.path);
   print('hello');
      //  imagetodb.filepathprov=filename;
      try{
        loader=true;
         
      var formData = FormData.fromMap({
   'message':_controller.text.toString(),
  'photos': [
    await MultipartFile.fromFile(ref.read( grouppostprov).photodata!.path, filename: filename),
  ],
     if (_videoPlayerController!.value.size.aspectRatio==0.0) 
  'status':0
  else
   'status':1
});  
print(url);
  final response = await Dio().post("$url",
 data: formData);
 
  print('hello${response.statusCode}');
    if(response.statusCode == 200 ){
     // Navigator.pop(context);
print('successfully uploaded');
   setState(() {
     
   });
          GroupPostedDataResponse  dp;
      dp=GroupPostedDataResponse .fromJson( response.data);
    if (dp.status==true) {
       print('successfully uploaded');
       Navigator.pop(context);
    } else {
       print('no successfully uploaded');
    }
    loader=false;
      // imagetodb.filepathprov=dp.profilePicUrl;
      //   print('response data11 ${imagetodb.filepathprov}');
      // print('response data ${dp.profilePicUrl}');
     //  print('successfully uploaded');

    }else{ 
     
      print('could not be uploaded');
    }
      }catch(e){
loader=false;
      }
   if (mounted) {
      setState(() {});
   }
//        String filename= basename(ref.read( grouppostprov).photodata!.path);
//       //  imagetodb.filepathprov=filename;
//        print('hello${filename}');
//        print('hello11${ref.read(grouppostprov).photodata!.path}');
  
//       var formData = FormData.fromMap({
//         'message':_controller.text.toString(),
//   'photos': [
//     await MultipartFile.fromFile(ref.read( grouppostprov).photodata!.path, filename: filename),
//   ]
// });  
// print('hiiiiiii555');
//   final response = await Dio().post("http://i-collekt.jksoftec.com:3001/api/conversation/upload/${preferences.getInt('Userid')}/${ref.read(viewgroupprov).groupid!}",
//  data: formData);
//   print('hello${response.data}');

//       GroupPostedDataResponse  dp;
//       dp=GroupPostedDataResponse .fromJson( response.data);
//       if(dp.status ==true){
         
//               showToast("Post Created successfully",
//      textStyle: TextStyle(color: Colors.black),
//      backgroundColor: Colors.grey[300],
//                     context: context,
                    
//                     borderRadius: BorderRadius.circular(10),
//                     animation: StyledToastAnimation.size,
//                     reverseAnimation: StyledToastAnimation.size,
//                     axis: Axis.horizontal,
//                     position: StyledToastPosition.center,
//                     animDuration: Duration(milliseconds: 400),
//                     duration: Duration(seconds: 2),
//                     curve: Curves.linear,
//                     reverseCurve: Curves.linear);
//          Navigator.pop(context);
//       }else{
//         print('try again');
//       }
      
//    if(mounted){
//       setState(() {});
//    }
      // imagetodb.filepathprov=dp.profilePicUrl;
      //   print('response data11 ${imagetodb.filepathprov}');
      // print('response data ${dp.profilePicUrl}');
     //  print('successfully uploaded');

    
     


  }
@override
  void dispose() {
    _videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 
   // ViewMyGroupData mygroupview,ViewGroupData allgroupview
   final mygroupview=ref.watch(viewMygroupprov);
  final allgroupview=ref.watch(viewgroupprov);
   final data = ref.watch(grouppostprov);
      print(data.photodata);
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
         // data.photodata=File(data.photodata!.path);
Navigator.pop(context);
        }, icon: Icon(Icons.close,color: Colors.black,)),
        actions: [
          posted==false?
          MaterialButton(
            onPressed: (){
              validate(context,ref.read(grouppostprov));
              //uploadImageToDB(context,ref.read(viewgroupprov),ref.read(grouppostprov));
             // Navigator.pop(context);
             // data.photodata.delete()
//                Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) =>
//   MyGroupMessage(   group: 'group',)
//   ),
 
// );
      //            pushNewScreen(
      //     context,
      //     screen: GrouppostProcess() ,
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
            },
            child: Center(
              child: Text('Post',
               style: TextStyle(
                       decoration: TextDecoration.none,
                          fontFamily: 'Gilroy',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff591B4C))
              ),
            ),
          ):MaterialButton(
            onPressed: (){
              Navigator.pop(context);
            //  validate(context,ref.read(grouppostprov));
              //uploadImageToDB(context,ref.read(viewgroupprov),ref.read(grouppostprov));
             // Navigator.pop(context);
             // data.photodata.delete()
//                Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) =>
//   MyGroupMessage(   group: 'group',)
//   ),
 
// );
      //            pushNewScreen(
      //     context,
      //     screen: GrouppostProcess() ,
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
            },
            child: Center(
              child: Text('Posted',
               style: TextStyle(
                       decoration: TextDecoration.none,
                          fontFamily: 'Gilroy',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff591B4C))
              ),
            ),
          ),
         // SizedBox(width: 5.w,)
        ],
      ),
      body: Stack(
        children: 
          [SingleChildScrollView(
            child: Column(
              children: [
             // data.photodata!=null? Text('${_videoPlayerController!}'):Container(),
           data.photodata!=null? Builder(
             builder: (context) {
               if (_videoPlayerController!.value.size.aspectRatio!=0.0) 
               return Stack(
                alignment: AlignmentDirectional.center,
                 children: 
                   [GestureDetector(
                     onTap: (){
                        // _videoPlayerController!.pause();
                        //  _videoPlayerController!.play();
                     cameraOrGallery(context,'post',ref.watch(grouppostprov));
                     },
                     child: Container(
                       color: Colors.grey[300],
                               width: double.infinity,
                           // height: 40.h,
                         child: Column(
                           children: [
                                if (data.photodata!=null) 
                              
                            
                            _videoPlayerController!.value.isInitialized?
                            AspectRatio(aspectRatio:_videoPlayerController!.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController!),
                             ):Container()
                             else
                             GestureDetector(

                               child: Container(
                                color: Colors.grey[300],
                                 width: double.infinity,
                                                    height: 40.h,
                                 ),
                             )
                           ],
                         ),
                            //  data.photodata==null?   
                            // Image.asset("Assets/Images/placeholder-image.png",fit: BoxFit.cover,):Image.file(File(data.photodata!.path)),
                          ),
                   ),
                    if (data.photodata!=null) 
                   Center(
                     child: Container(
                        /// height: 40.h,
                       child: FloatingActionButton(
                         backgroundColor: Colors.transparent,
                         onPressed: () {
    // Wrap the play or pause in a call to `setState`. This ensures the
    // correct icon is shown.
    setState(() {
      // If the video is playing, pause it.
      if (_videoPlayerController!.value.isPlaying) {
       _videoPlayerController!.pause();
      } else {
        // If the video is paused, play it.
        _videoPlayerController!.play();
      }
    });
  },
  // Display the correct icon depending on the state of the player.
  child: Icon(
    _videoPlayerController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
  ),
                        ),
                     ),
                   )
                   else Container()
                 ],
               );
               else{
                 return
        data.photodata==null?   
                            Image.asset("Assets/Images/placeholder-image.png",fit: BoxFit.cover,)
                          :GestureDetector(
                            onTap: (){
                cameraOrGallery(context,'post',ref.watch(grouppostprov));
             },
                            child: Image.file(File(data.photodata!.path)));
               }
             }
           ):GestureDetector(
             onTap: (){
                cameraOrGallery(context,'post',ref.watch(grouppostprov));
             },
             child: Container(
                color: Colors.grey[300],
                                 width: double.infinity,
                              height: 40.h,
             ),
           ),
                Container(
                  width: double.infinity,
                  height: 40.h,
                 // color: Colors.red,
                  child: TextField(
                            controller: _controller,
                                      //  focusNode: focusNode,
                                        textAlignVertical: TextAlignVertical.center,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        minLines: 1,
                          cursorHeight: 23,
                          // controller:_chatcontroller,
              decoration: InputDecoration(
                
                border: InputBorder.none,
                hintText: 'Type something...',
                hintStyle: TextStyle(
                  color: Color(0xffAAAAAA),
                  fontSize: 14.sp
                ),
                contentPadding: EdgeInsets.only(left: 8.sp,top: 8.sp),
              //  suffixIcon:  Image.asset("Assets/Images/searchright.png",
            //  ),
            )
                        ),
                )
              ],
            ),
          ),
   if (loader)  Container(
            color: Colors.black.withOpacity(0.5),
            height: double.infinity,
            width: double.infinity,
            child: Center(child: CircularProgressIndicator()),
          )
        ],
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
             
         // chooseAndUploadImageforpost(context);
           return Text('Post in group',
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
                  chooseAndUploadImageforpost(context,ref.watch(grouppostprov));
              if (_videoPlayerController!.value.isPlaying) {
       _videoPlayerController!.pause();
       // chooseAndUploadImageforpost(context,ref.watch(grouppostprov));
      }
       
       setState(() {
         
       });
                   // CustomButton1(title: 'Join group', ontapped: ()=>Sample(), nav: false);
        
      //       pushNewScreen(
      //     context,
      //     screen: GrouppostProcess() ,
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
          
              
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
                

                   // CustomButton1(title: 'Join group', ontapped: ()=>Sample(), nav: false);
          cameraImageforpost(context,ref.watch(grouppostprov));
      //                pushNewScreen(
      //     context,
      //     screen: GrouppostProcess() ,
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
           
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