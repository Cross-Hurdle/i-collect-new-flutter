// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/ImageView.dart';
import 'package:icollekt/Model/CommentUnlikeModle.dart';
import 'package:icollekt/Model/CommentlikeModle.dart';
import 'package:icollekt/Model/GoupPostModle.dart';
import 'package:icollekt/Model/GroupImageUpdateResponse.dart';
import 'package:icollekt/Model/PostLikeModle.dart';
import 'package:icollekt/Model/PostUnlikeModle.dart';
import 'package:icollekt/Model/UpdateGroupImageDp.dart';
import 'package:icollekt/Screens/chat/AboutGroup.dart';
import 'package:icollekt/Screens/chat/GroupComment.dart';
import 'package:icollekt/Screens/chat/GroupPhotos.dart';
import 'package:icollekt/Screens/chat/postView.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

import 'InviteContact.dart';
import 'grouppostprocess.dart';

class MyGroupProfile extends ConsumerStatefulWidget {
  final bool? isdirect;
  final int? groupid;
  MyGroupProfile({Key? key, this.isdirect, this.groupid}) : super(key: key);

  @override
  _MyGroupProfileState createState() => _MyGroupProfileState();
}

class _MyGroupProfileState extends ConsumerState<MyGroupProfile> {
  //VideoPlayerController? _videoPlayerController;
  var viewdata;
  //  VideoPlayerController? _controller;
  ScrollController scrollController = ScrollController();
  //late Future<void> _initializeVideoPlayerFuture;
  void initState() {
    super.initState();
    viewdata = ref.read(viewgroupprov);
    getGroupprofilepic(ref.read(viewgroupprov));
    //_videoPlayerController=;
    getpostedresponse();
  }

 
  bool isliked = false;
  bool status = false;
  LikeDataResponse? allpostlikeresponse;
  Future getallLikeresponse(ViewGroupData allgroupview) async {
    // print('object${allgroupview.postid!.toInt()}');
    allpostlikeresponse = await GroupAndChatRepository().getPostlikeData(
        postid: allgroupview.postid!.toInt(),
        groupid: ref.read(viewgroupprov).groupid!.toInt());
// print( 'sdfsdsf${allpostlikeresponse!.likeData.length}');

    if (mounted) {
      setState(() {});
    }
  }

//LikeDataResponse?
  UnLikeDataResponse? allUnpostlikeresponse;
  Future getallUnLikeresponse(ViewGroupData allgroupview) async {
    allUnpostlikeresponse = await GroupAndChatRepository()
        .getPostUnlikeData(postid: allgroupview.postid!.toInt());
    //print(allUnpostlikeresponse);
    //  print( 'asdasdadasd${allpostlikeresponse!.likeData[0].likeCount}');
    setState(() {});
  }

  //getpostedresponse(ref.read(viewgroupprov));
  GroupPostedDataResponse? postresponse;
  Future<void> getpostedresponse() async {
    // print(ref.read(viewgroupprov).groupid!);
    postresponse = await GroupAndChatRepository()
        .getAllGroupPostedData(id: ref.read(viewgroupprov).groupid!);
    // print(postresponse!.userData.length);
    //postresponse!.userData.reversed;
    status = true;

    // print( postresponse!.userData[0].likes.length);
    if (mounted) {
      setState(() {});
    }
  }

//  getalldeletepostresponse(ViewGroupData allgroupview)async{

//  final allpostresponse=   await GroupAndChatRepository().getAllDeletepostData(id:allgroupview.postid!.toInt());
//  print( allpostresponse.status);
//   // status=true;
//   setState(() {

// });

// }
  //ProfileUpdatedp
  Future cameraImage(
    context,
  ) async {
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
      Fluttertoast.showToast(
        msg: "Go to your application settings and give photo permission ",
      );
    } else if (status.isGranted) {
      var pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
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
      } else {
        // ignore: unnecessary_null_comparison
        if (pickedFile != null) {
          File imageFile = File(pickedFile.path);

          uploadImageToDB(imageFile, ref.watch(viewgroupprov));
          //getprofilepic();

        }
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
      Fluttertoast.showToast(
        msg: "Go to your application settings and give photo permission ",
      );
    } else if (status.isGranted) {
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
        uploadImageToDB(_file, ref.watch(viewgroupprov));
      }
    }
  }

//Dp API Call
  uploadImageToDB(filepath, ViewGroupData viewdata) async {
    String filename = basename(filepath.path);
    //  imagetodb.filepathprov=filename;
    try {
      var formData = FormData.fromMap({
        'group_image': [
          await MultipartFile.fromFile(filepath.path, filename: filename),
          //  await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
        ]
      });
      final response = await Dio().post(
          "http://i-collekt.jksoftec.com:3001/api/group_image/group_image-update/${viewdata.groupid!}",
          data: formData);
//  print('hello${filename}');
      if (response.statusCode == 200) {
        UpdateGroupImageDpDataResponse dp;
        dp = UpdateGroupImageDpDataResponse.fromJson(response.data);

        // imagetodb.filepathprov=dp.profilePicUrl;
        //   print('response data11 ${imagetodb.filepathprov}');
        // print('response data ${dp.profilePicUrl}');
        print('successfully uploaded');
      } else {
        print('could not be uploaded');
      }
    } catch (e) {}

    setState(() {});
  }

//BackGround imagepicker
  Future cameraImageforbg(
    context,
  ) async {
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
      Fluttertoast.showToast(
        msg: "Go to your application settings and give photo permission ",
      );
    } else if (status.isGranted) {
      var pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile == null) {
        // print('object1');
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
      } else {
        // ignore: unnecessary_null_comparison
        if (pickedFile != null) {
          setState(() {});
          File imageFile = File(pickedFile.path);

//uploadImageToDBbg1(imageFile ,);
          uploadImageToDBbg1(imageFile, ref.read(viewgroupprov));
        }
      }
    }
  }

//post for camera
  Future cameraImageforpost(context, Grouppostprov post) async {
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
      Fluttertoast.showToast(
        msg: "Go to your application settings and give photo permission ",
      );
    } else if (status.isGranted) {
      var pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile == null) {
        //  print('object1');
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
      } else {
        // ignore: unnecessary_null_comparison
        if (pickedFile != null) {
          // print('object');
          File imageFile = File(pickedFile.path);
          //  print(imageFile);
          post.photodata = imageFile;
//uploadImageToDBbg1(imageFile ,);
//uploadImageToDBbg1(imageFile,ref.read(viewgroupprov));
          setState(() {});
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
      Fluttertoast.showToast(
        msg: "Go to your application settings and give photo permission ",
      );
    } else if (status.isGranted) {
      FilePickerResult filePickerResult;

      filePickerResult = (await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      ))!;

      // ignore: unnecessary_null_comparison
      if (filePickerResult == null) {
        //  print('object');
      } else {
        File _file = File("${filePickerResult.files.single.path}");

        uploadImageToDBbg1(_file, ref.read(viewgroupprov));
      }
    }
  }

  //Post in group
  chooseAndUploadImageforpost(context, Grouppostprov post) async {
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
      Fluttertoast.showToast(
        msg: "Go to your application settings and give photo permission ",
      );
    } else if (status.isGranted) {
      FilePickerResult filePickerResult;

      filePickerResult = (await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      ))!;

      // ignore: unnecessary_null_comparison
      if (filePickerResult == null) {
        //  print('object123');
      } else {
        File _file = File("${filePickerResult.files.single.path}");
        post.photodata = _file;
//uploadImageToDBbg1(_file,ref.read(viewgroupprov));

      }
    }
  }

  //Background Api Call
  uploadImageToDBbg1(filepath, ViewGroupData viewdata) async {
    String filename = basename(filepath.path);
    try {
      var formData = FormData.fromMap({
        'group_banner': [
          await MultipartFile.fromFile(filepath.path, filename: filename),
        ]
      });
      final response = await Dio().post(
          "http://i-collekt.jksoftec.com:3001/api/group_image/group_banner-update/${viewdata.groupid}",
          data: formData);

      if (response.statusCode == 200) {
        //next1 ='Next';
        UpdateGroupbannerDataResponse dp;
        dp = UpdateGroupbannerDataResponse.fromJson(response.data);

        print('response data ${dp.groupBannerUrl}');
        print('successfully uploaded');
      } else {
        print('could not be uploaded');
      }
    } catch (e) {}

    if (mounted) {
      setState(() {});
    }
  }

  var subject = '';
  var message = '';
  var pic = '';
  var groupname = '';
  var id = 0;
  var count = 0;
  getGroupprofilepic(ViewGroupData viewdata) async {
    final viewgroupResponse =
        await GroupAndChatRepository().getViewGroupData(id: viewdata.groupid!);
    // print('Idddddddd${ viewdata.groupid}');
    //print(viewgroupResponse.data.groupBanner);
    try {
      pic = viewgroupResponse.data.groupImage;
      groupname = viewgroupResponse.data.groupBanner;
      subject = viewgroupResponse.data.subject;
      message = viewgroupResponse.data.message;
      id = viewgroupResponse.data.id;
      count = viewgroupResponse.usercount;
    } catch (e) {
      print(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

//Remove Api Call For Dp
  getdeletebannerprofilepic() async {
    final deletebannerResponse = await GroupAndChatRepository()
        .getProfilebannerImageDeleteResponse(
            id: ref.read(viewgroupprov).groupid!.toInt());
    print(deletebannerResponse);

    setState(() {});
  }

  getdeletedpprofilepic() async {
    final deletedpprofilepic = await GroupAndChatRepository()
        .getProfileDpImageDeleteResponse(
            id: ref.read(viewgroupprov).groupid!.toInt());
    print(deletedpprofilepic);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(viewgroupprov);
    //_videoPlayerController =VideoPlayerController.network("http://i-collekt.jksoftec.com:3001/group_upload/photos_1648045212058.mp4");
    return Scaffold(
      appBar: topappbar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: RefreshIndicator(
          onRefresh: () async {},
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  GestureDetector(
                    onTap: () {
                      backgroundImageBottomsheet(
                          context, ref.read(viewphotoprov));
                      print('BackGroundpic');
                    },
                    child: Container(
                      //  color: Colors.yellow,
                      height: 20.5.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 14.5.h,
                            width: double.infinity,
                            color: Colors.grey[600],
                            child: Builder(builder: (context) {
                              getGroupprofilepic(ref.read(viewgroupprov));
                              return CachedNetworkImage(
                                imageUrl: groupname,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
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
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                        child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: CircularProgressIndicator(
                                                value: downloadProgress
                                                    .progress))),
                                //  CircularProgressIndicator(value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    //Icon(Icons.error)
                                    Image.asset(
                                  "Assets/Images/placeholder-image.png",
                                  fit: BoxFit.cover,
                                ),
                              );
                            }),
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
                    child: GestureDetector(
                      onTap: () {
                        profiledpImage(context, ref.read(viewphotoprov));
                        print('Profiledp');
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 39.sp,
                        child: CircleAvatar(
                          radius: 33.sp,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Builder(builder: (context) {
                              getGroupprofilepic(ref.read(viewgroupprov));
                              return CachedNetworkImage(
                                imageUrl: '$pic',

                                ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                                width: 9.5.h,
                                height: 9.5.h,
                                fit: BoxFit.cover,
                                imageBuilder: (context, imageProvider) =>
                                    CircleAvatar(
                                  radius: 33.sp,
                                  child: Container(
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

                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  "Assets/Images/Portrait_Placeholder.png",
                                  fit: BoxFit.cover,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Builder(builder: (context) {
                getGroupprofilepic(ref.read(viewgroupprov));
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$subject',
                          style: TextStyle(
                              color: Color(0xff1A1A1A),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              fontFamily: 'Gilroy'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$message',
                          style: TextStyle(
                              color: Color(0xff1A1A1A),
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              fontFamily: 'Gilroy'),
                        )
                      ],
                    ),
                  ],
                );
              }),
              SizedBox(
                height: 2.h,
              ),
              // Text('${viewdata.groupid}'),

              Row(
                children: [
                  InkWell(
                    onTap: () {
                      // cameraOrGallery(context,'post',ref.watch(grouppostprov));
                      pushNewScreen(
                        context,
                        screen: GrouppostProcess(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      ).then((value) => getpostedresponse());

                      //           pushNewScreen(
                      //     context,
                      //     screen: Sample() ,
                      //     withNavBar: false, // OPTIONAL VALUE. True by default.
                      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      // );
                      // onPressed(function: onpressedtitle);
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: 94.w,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(5),
                          color: Color(0xff591B4C)),
                      child: Center(
                          child: Text(
                        'Post in group',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Gilroy",
                            fontSize: 16),
                      )),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // CustomButton1(title: 'About', ontapped:  ()=>Sample(), nav: false),
                  InkWell(
                    onTap: () {
                      data.groupname = subject;
                      data.groupimage = pic;
                      data.groupmessage = message;
                      data.groupid = id;
                      data.count = count;
                      // cameraOrGallery(context,'post');
                      pushNewScreen(
                        context,
                        screen: AboutGroup(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                      // onPressed(function: onpressedtitle);
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: 40.w,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(5),
                          color: Color(0xff591B4C)),
                      child: Center(
                          child: Text(
                        'About',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Gilroy",
                            fontSize: 16),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      data.groupname = subject;
                      data.groupimage = pic;
                      data.groupid = id;
                      // cameraOrGallery(context,'post');
                      pushNewScreen(
                        context,
                        screen: GroupPhotos(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                      // onPressed(function: onpressedtitle);
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: 40.w,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(5),
                          color: Color(0xff591B4C)),
                      child: Center(
                          child: Text(
                        'Photos',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Gilroy",
                            fontSize: 16),
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
              //           print('groupid   ${ id}');
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
              //     ),

              // Container(
              //   height: 400,
              //   color: Colors.red,
              //   width: 300,
              // )
              Container(child: explore())
              // CustomButton(title: 'Posts', ontapped: ()=> GrupPost(), nav: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget commented(List<Comment> commentes) {
    return commentes.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: commentes.length,
            itemBuilder: (context, index) {
              if (commentes[index].likeComments.isNotEmpty) {
                count = commentes[index].likeComments[0].likecount;
                commentes[index].likeComments.forEach((element) {
                  if (element.userId == preferences.getInt('Userid') &&
                      element.status == 1) {
                    // print('222222222222222222222222222222');
                    isliked = true;
                  } else {
                    //print('1111111111111111111111111');
                    isliked = false;
                  }
                });
              } else {
                count = 0;
                isliked = false;
              }
              return PostCommentContainer(
                index: index,
                commentid: commentes[index].id,
                status: isliked,
                listcount: count,
                //commentes[index].likeComments[0].likecount,
                commentcolor: false,
                profilename: commentes[index].user.name,
                profilepic: commentes[index].user.profilePic,
                comment: commentes[index].comment,
                likelist: commentes[index].likeComments,
                time: commentes[index].createdAt,
              );
            })
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Center(child: Text('No Comments'))),
          );
  }

  Widget explore() {
    final allgroupview = ref.watch(viewgroupprov);
    final comment = ref.watch(commentinfo);
    if (!status) {
      return Container(
          height: 50.h, child: Center(child: CircularProgressIndicator()));
    } else
      return postresponse!.userData.length != 0
          ?

          // getpostedresponse();
          StreamBuilder(
              stream: getpostedresponse().asStream(),
              builder: (context, snapshot) {
                // print(postresponse!.userData[0].photos);
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  controller: scrollController,
                  // reverse: true,
                  itemCount: postresponse!.userData.length,
                  itemBuilder: (context, index) {
                    //    allgroupview.postid=  postresponse!.userData[index].id;
                    //getpostedresponse(ref.read(viewgroupprov));
                    //  getallLikeresponse(ref.read(viewgroupprov));

                    DateTime? convert = DateTime.tryParse(
                        postresponse!.userData[index].createdAt.toString());
                    //var dateString = DateFormat.jm().format(DateFormat("yy hh:mm:ss").parse('2022-02-14T18:02:15.000Z'));
                    String date = DateFormat('EEE, d/M/y').format(convert!);
                    return GestureDetector(
                      onTap: () {
                        //  print('month');
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 2.sp, horizontal: 1.sp),
                        child: Builder(builder: (context) {
                          //                 _videoPlayerController=VideoPlayerController.network(postresponse!.userData[index].photos)..initialize().then((value) {
                          //   setState(() {

                          //   });
                          //   _videoPlayerController!.play();
                          // });
                          // getpostedresponse();
                          return Column(
                            children: [
                              DeletePost(
                                name: postresponse!.userData[index].user.name,
                                profileimg: postresponse!
                                    .userData[index].user.profilePic,
                                postid: postresponse!.userData[index].id,
                                otheruserid:
                                    postresponse!.userData[index].fromUserId,
                              ),

                              Builder(builder: (context) {
                                if (postresponse!.userData[index].photos
                                            .split('.')
                                            .last ==
                                        "png" ||
                                    postresponse!.userData[index].photos
                                            .split('.')
                                            .last ==
                                        "jpg" ||
                                    postresponse!.userData[index].photos
                                            .split('.')
                                            .last ==
                                        "jpeg" ||
                                    postresponse!.userData[index].photos
                                            .split('.')
                                            .last ==
                                        "web") {
                                  return Stack(
                                    alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      Container(
                                        child: GestureDetector(
                                          onTap: () {
                                            ref
                                                    .watch(viewMygroupprov)
                                                    .postimage =
                                                postresponse!
                                                    .userData[index].photos;
                                            pushNewScreen(
                                              context,
                                              screen: PostViewScreen(),
                                              withNavBar:
                                                  false, // OPTIONAL VALUE. True by default.
                                              pageTransitionAnimation:
                                                  PageTransitionAnimation.scale,
                                            ).then(
                                                (value) => getpostedresponse());
                                          },
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                '${postresponse!.userData[index].photos}',
                                            placeholder: (context, url) =>
                                                Container(
                                                    height: 35.5.h,
                                                    width: double.infinity,
                                                    child: Center(
                                                        child:
                                                            new CircularProgressIndicator())),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                              "Assets/Images/Portrait_Placeholder.png",
                                            ),
                                          ),
                                        ),
                                        //  Image.network( '${postresponse!.userData[index].photos}',

                                        //                       fit: BoxFit.contain,width: double.infinity),
                                      ),

                                      //                                      Column(children: [
                                      //       GestureDetector(
                                      //         onTap: () {
                                      //           setState(() {});

                                      //           //print(isliked);
                                      //           if (isliked) {
                                      //            // getallUnLikeresponse();
                                      //             // isliked=false;
                                      //           } else {
                                      //             // isliked=true;
                                      //            // getallLikeresponse();
                                      //             //    ref.read(viewgroupprov).postid=widget.postid;
                                      //             //  getallLikeresponse();
                                      //           }
                                      //         },
                                      //         child: isliked == true
                                      //             ? Padding(
                                      //                 padding: EdgeInsets.only(top: 13.0, right: 4),
                                      //                 child: SvgPicture.asset(
                                      //                   "Assets/Images/Tag.svg",
                                      //                   width: 12.w,
                                      //                 ),
                                      //               )
                                      //             : Padding(
                                      //                 padding:
                                      //                     EdgeInsets.only(top: 13.0, right: 4, bottom: 4),
                                      //                 child: CircleAvatar(
                                      //                     backgroundColor: Colors.grey[900],
                                      //                     radius: 18,
                                      //                     child: Image.asset(
                                      //                       "Assets/Images/Layer 1.png",
                                      //                     )),
                                      //                 // CircleAvatar(
                                      //                 //  backgroundColor: Colors.grey[900],radius: 17,),
                                      //               ),
                                      //       ),
                                      //       //  Container(
                                      //       //    margin: EdgeInsets.only(top: 2.h,right: 2.w,bottom: 1.h),
                                      //       //    child: CircleAvatar(
                                      //       //      backgroundColor: Colors.white,
                                      //       //      child: Center(
                                      //       //        child: IconButton(
                                      //       //                            onPressed: (){
                                      //       //                            setState(() {

                                      //       //                             });
                                      //       //                      print(widget.boolstaus);
                                      //       //                       if(widget.boolstaus!){
                                      //       //                             getallUnLikeresponse();
                                      //       //                            // isliked=false;
                                      //       //                        }else{
                                      //       //                            // isliked=true;
                                      //       //                              getallLikeresponse();
                                      //       //                                           //    ref.read(viewgroupprov).postid=widget.postid;
                                      //       //                                               //  getallLikeresponse();
                                      //       //                           }
                                      //       //                            },
                                      //       //                            icon: Icon(Icons.favorite),color:widget.boolstaus==true?Colors.red: Colors.grey,iconSize: 24,),
                                      //       //      ),
                                      //       //    ),
                                      //       //  ),

                                      //       Text(
                                      //         '$count',
                                      //         style: TextStyle(
                                      //             fontWeight: FontWeight.w600,
                                      //             fontFamily: "Gilroy",
                                      //             fontSize: 16,
                                      //             color: Colors.white),
                                      //       ),
                                      //       Column(
                                      //         children: [
                                      //           GestureDetector(
                                      //             onTap: () {
                                      //               final comment = ref.watch(commentinfo);
                                      // //  comment.postname=oneproductResponse!.product.name;
                                      // //  comment.id=oneproductResponse!.product.id;
                                      // //   comment.subject=oneproductResponse!.product.description;
                                      // //    comment.profile=oneproductResponse!.product.thumbnailImg;
                                      // //   // comment.dateandtime=oneproductResponse!.product.
                                      // //               setState(() {});
                                      // //               pushNewScreen(
                                      // //                 context,
                                      // //                 screen: ProductComment(id:oneproductResponse!.product.id ,),
                                      // //                 withNavBar: false, // OPTIONAL VALUE. True by default.
                                      // //                 pageTransitionAnimation:
                                      // //                     PageTransitionAnimation.cupertino,
                                      // //               );
                                      //             },
                                      //             // child: isliked == true
                                      //             //     ? Padding(
                                      //             //         padding: EdgeInsets.only(top: 13.0, right: 4),
                                      //             //         child: SvgPicture.asset(
                                      //             //           "Assets/Images/Tag.svg",
                                      //             //           width: 12.w,
                                      //             //         ),
                                      //             //       )
                                      //             //     :
                                      //             child: Padding(
                                      //               padding: EdgeInsets.only(top: 13.0, right: 4, bottom: 4),
                                      //               child: CircleAvatar(
                                      //                   backgroundColor: Colors.grey[900],
                                      //                   //  radius: 18,
                                      //                   child: Icon(Icons.comment)
                                      //                   //  Image.asset(
                                      //                   //   "Assets/Images/Layer 1.png",
                                      //                   // )
                                      //                   ),
                                      //               // CircleAvatar(
                                      //               //  backgroundColor: Colors.grey[900],radius: 17,),
                                      //             ),
                                      //           ),

                                      //         ],
                                      //       ),

                                      //       // Positioned(
                                      //       //                // bottom: 295,
                                      //       //                 right: 4,
                                      //       //                 top: 18,
                                      //       //                 child: Image.asset("Assets/Images/inactive.png",),
                                      //       //              ),_
                                      //     ]),
                                      Builder(builder: (context) {
                                        int? count;
                                        bool islike = false;
                                        if (allpostlikeresponse != null) {
                                          allpostlikeresponse?.likeData
                                              .forEach((element) {
                                            if (element.postId ==
                                                ref
                                                    .read(viewgroupprov)
                                                    .postid!
                                                    .toInt()) {
                                              count = element.likeCount;
                                              islike = element.status == 0
                                                  ? false
                                                  : true;
                                            } else {
                                              count = 0;
                                            }
                                          });
                                        } else {
                                          count = 0;
                                          islike = false;
                                        }
                                        return LIke(
                                          time: date,
                                          name: postresponse!
                                              .userData[index].user.name,
                                          pic: postresponse!
                                              .userData[index].user.profilePic,
                                          subject: postresponse!
                                              .userData[index].message,
                                          likes: postresponse!
                                              .userData[index].likes,
                                          index: index,
                                          count: count!,
                                          islike: islike,
                                          postid:
                                              postresponse!.userData[index].id,
                                        );
                                      })
                                    ],
                                  );
                                } else {
                                  return Stack(
                                     alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      VideoPlayerScreen(
                                          url: postresponse!
                                              .userData[index].photos,
                                          scrollController: scrollController),
                                      Builder(builder: (context) {
                                        int? count;
                                        bool islike = false;
                                        if (allpostlikeresponse != null) {
                                          allpostlikeresponse?.likeData
                                              .forEach((element) {
                                            if (element.postId ==
                                                ref
                                                    .read(viewgroupprov)
                                                    .postid!
                                                    .toInt()) {
                                              count = element.likeCount;
                                              islike = element.status == 0
                                                  ? false
                                                  : true;
                                            } else {
                                              count = 0;
                                            }
                                          });
                                        } else {
                                          count = 0;
                                          islike = false;
                                        }
                                        return LIke(
                                          time: date,
                                          name: postresponse!
                                              .userData[index].user.name,
                                          pic: postresponse!
                                              .userData[index].user.profilePic,
                                          subject: postresponse!
                                              .userData[index].message,
                                          likes: postresponse!
                                              .userData[index].likes,
                                          index: index,
                                          count: count!,
                                          islike: islike,
                                          postid:
                                              postresponse!.userData[index].id,
                                        );
                                      })
                                    ],
                                  );
                                }
                              }),

                              //                       FutureBuilder(
                              //   future: _initializeVideoPlayerFuture,
                              //   builder: (context, snapshot){
                              //     if(snapshot.connectionState == ConnectionState.done){
                              //       return AspectRatio(
                              //         aspectRatio: _controller!.value.aspectRatio,
                              //         child: VideoPlayer(_controller!),
                              //       );
                              //     } else {
                              //       return Center(
                              //         child: CircularProgressIndicator(backgroundColor: Colors.blue,
                              //         ),
                              //       );
                              //     }
                              //   }
                              // ),
                              //Container(),
                              //VideoPlayerScreen(url:postresponse!.userData[index].photos ,),
                              //                       FutureBuilder(
                              //   future: _initializeVideoPlayerFuture,
                              //   builder: (context, snapshot) {
                              //     if (snapshot.connectionState == ConnectionState.done) {
                              //       // If the VideoPlayerController has finished initialization, use
                              //       // the data it provides to limit the aspect ratio of the video.
                              //      if (_controller!=null) {
                              //         return Stack(
                              //         alignment: AlignmentDirectional.center,
                              //         children:
                              //           [AspectRatio(
                              //             aspectRatio: _controller!.value.aspectRatio,
                              //             // Use the VideoPlayer widget to display the video.
                              //             child: VideoPlayer(_controller!),
                              //           ),
                              //           FloatingActionButton(
                              //   onPressed: () {
                              //     // Wrap the play or pause in a call to `setState`. This ensures the
                              //     // correct icon is shown.
                              //     setState(() {
                              //       // If the video is playing, pause it.
                              //       if (_controller!.value.isPlaying) {
                              //         _controller!.pause();
                              //       } else {
                              //         // If the video is paused, play it.
                              //         _controller!.play();
                              //       }
                              //     });
                              //   },
                              //   // Display the correct icon depending on the state of the player.
                              //   child: Icon(
                              //     _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                              //   ),
                              // ),
                              //         ],
                              //       );
                              //      } else {
                              //        return Container();
                              //      }
                              //     } else {
                              //       // If the VideoPlayerController is still initializing, show a
                              //       // loading spinner.
                              //       return Container(
                              //          height: 35.5.h,
                              //                           width: double.infinity,
                              //         child: const Center(
                              //           child: CircularProgressIndicator(),
                              //         ),
                              //       );
                              //     }
                              //   },
                              // ),

                              Container(
                                // height: 18.h,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Column(
                                          //   children: [
                                          //     Builder(builder: (context) {
                                          //       int? count;
                                          //       bool islike = false;
                                          //       if (allpostlikeresponse !=
                                          //           null) {
                                          //         allpostlikeresponse?.likeData
                                          //             .forEach((element) {
                                          //           if (element.postId ==
                                          //               ref
                                          //                   .read(viewgroupprov)
                                          //                   .postid!
                                          //                   .toInt()) {
                                          //             count = element.likeCount;
                                          //             islike =
                                          //                 element.status == 0
                                          //                     ? false
                                          //                     : true;
                                          //           } else {
                                          //             count = 0;
                                          //           }
                                          //         });
                                          //       } else {
                                          //         count = 0;
                                          //         islike = false;
                                          //       }
                                          //       return LIke(
                                          //         time: date,
                                          //         name: postresponse!
                                          //             .userData[index]
                                          //             .user
                                          //             .name,
                                          //         pic: postresponse!
                                          //             .userData[index]
                                          //             .user
                                          //             .profilePic,
                                          //         subject: postresponse!
                                          //             .userData[index].message,
                                          //         likes: postresponse!
                                          //             .userData[index].likes,
                                          //         index: index,
                                          //         count: count!,
                                          //         islike: islike,
                                          //         postid: postresponse!
                                          //             .userData[index].id,
                                          //       );
                                          //     })
                                          //   ],
                                          // ),
                                          // Container(
                                          //  // color: Colors.red,

                                          //   child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          //     children: [
                                          //       Padding(
                                          //         padding:  EdgeInsets.only(right:12.0.sp),
                                          //         child: Icon(Icons.more_horiz,size: 18.sp,),
                                          //       )
                                          //     // Text('data')
                                          //   ],),
                                          // ),
                                          // Row(
                                          //     children: [
                                          //        Image.asset( "Assets/Images/chat.png",
                                          //       fit: BoxFit.contain,width: 7.w,),
                                          //     ],
                                          //   ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          width: 90.w,
                                          child: Text(
                                            '${postresponse!.userData[index].message}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Gilroy',
                                                fontSize: 10.sp),
                                          ),
                                        )
                                      ],
                                    ),
                                    
                                    commented(
                                        postresponse!.userData[index].comments),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {});
                                        comment.profile = postresponse!
                                            .userData[index].user.profilePic;
                                        comment.postname = postresponse!
                                            .userData[index].user.name;
                                        comment.subject = postresponse!
                                            .userData[index].message;
                                        comment.dateandtime = date;
                                        comment.id =
                                            postresponse!.userData[index].id;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GroupComment()),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'view all Comments',
                                              style: TextStyle(
                                                  color: Color(0x77000000),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 11.sp),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '$date',
                                            style: TextStyle(
                                                color: Color(0x77000000),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Gilroy',
                                                fontSize: 11.sp),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    );
                  },
                );
              })
          : Container(height: 50.h, child: Center(child: Text('No Post')));
  }

  AppBar buildappbar(context, ViewGroupData viewdata) {
    return AppBar(
      toolbarHeight: 8.h,
      backgroundColor: kBackground,
      //  flexibleSpace: ,
      leading: Container(
        margin: EdgeInsets.only(left: 10.sp),
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      // centerTitle: true,
      title: GestureDetector(
        onTap: () {
          //      pushNewScreen(
          //     context,
          //     screen:MyGroupProfile() ,
          //     withNavBar: false, // OPTIONAL VALUE. True by default.
          //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
          // );
        },
        child: Container(
          child: Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 16.sp,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: '${viewdata.groupimage}',

                        ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                        width: 9.5.h,
                        height: 9.5.h,
                        fit: BoxFit.cover,

                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 33.sp,
                          child: Container(
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

                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Image.asset(
                          "Assets/Images/Portrait_Placeholder.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                width: 44.w,
                child: Text(
                  '${viewdata.groupname}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Color(0xff1A1A1A),
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),

      elevation: 1,
    );
  }

  AppBar topappbar(context) {
    final data = ref.watch(viewgroupprov);
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
      actions: [
        MaterialButton(
          onPressed: () {
            data.groupid = id;
            pushNewScreen(
              context,
              screen: InviteContact(),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          child: Center(
            child: Text('Invite',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff591B4C))),
          ),
        ),
        SizedBox(
          width: 4.w,
        )
      ],
    );
  }

  backgroundImageBottomsheet(BuildContext context, ViewPhotoData bgphototprov) {
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
                      color: Color(0xff591B4C))),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                bgphototprov.photodata = groupname;
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
                        color: Color(0xff1A1A1A))),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                cameraOrGallery(context, 'bg', ref.watch(grouppostprov));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Upload image',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A))),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                getdeletebannerprofilepic();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Remove image',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A))),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
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
                        color: Color(0xff1A1A1A))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  profiledpImage(BuildContext context, ViewPhotoData dpphototprov) {
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
              child: Text('Profile picture',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Gilroy',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff591B4C))),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                dpphototprov.photodata = pic;
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
                        color: Color(0xff1A1A1A))),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                cameraOrGallery(context, 'dp', ref.watch(grouppostprov));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Upload image',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A))),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                getdeletedpprofilepic();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Remove image',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A))),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
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
                        color: Color(0xff1A1A1A))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  cameraOrGallery(BuildContext context, String dporbg, Grouppostprov post) {
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
              child: Builder(builder: (context) {
                //         if(dporbg=='post'){
                //  // chooseAndUploadImageforpost(context);
                //    return Text('Post in group',
                //         style: TextStyle(
                //            decoration: TextDecoration.none,
                //               fontFamily: 'Gilroy',
                //               fontSize: 16.sp,
                //               fontWeight: FontWeight.w600,
                //               color: Color(0xff591B4C))
                //         );
                //       }else

                return Text('Choose Camera or Gallery',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Gilroy',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff591B4C)));
              }),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                if (dporbg == 'dp') {
                  return chooseAndUploadImage(
                    context,
                  );
                } else if (dporbg == 'bg') {
                  chooseAndUploadImageforbg(
                    context,
                  );
                }
                //             else if(dporbg=='post'){
                //              // CustomButton1(title: 'Join group', ontapped: ()=>Sample(), nav: false);
                //     chooseAndUploadImageforpost(context,ref.watch(grouppostprov));
                //       pushNewScreen(
                //     context,
                //     screen: GrouppostProcess() ,
                //     withNavBar: false, // OPTIONAL VALUE. True by default.
                //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
                //         }

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
                        color: Color(0xff1A1A1A))),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);

                if (dporbg == 'dp') {
                  cameraImage(
                    context,
                  );
                } else if (dporbg == 'bg') {
                  cameraImageforbg(
                    context,
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Camera',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A))),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
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
                        color: Color(0xff1A1A1A))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LIke extends ConsumerStatefulWidget {
  final int count;
  final bool islike;
  final int postid;
  final int index;
  final List<Like> likes;
  final String name;
  final String pic;
  final String subject;
  final String time;
  LIke(
      {Key? key,
      required this.time,
      required this.name,
      required this.pic,
      required this.subject,
      required this.count,
      this.islike = false,
      required this.postid,
      required this.index,
      required this.likes})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LIkeState();
}

class _LIkeState extends ConsumerState<LIke> {
  @override
  void initState() {
    super.initState();
    //  ontaplike();
    // print('myyyyyyyyyyyyyyyyyyyy');
    // getallresponse();
  }

  bool isliked = false;
 
  // GroupPostedDataResponse? postresponse;
  // getpostedresponse() async {
  //   //  print(allgroupview.groupid!);
  //   postresponse = await GroupAndChatRepository()
  //       .getAllGroupPostedData(id: ref.read(viewgroupprov).groupid!);
  //   //status=true;

  //   // print( postresponse!);
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  int? postid;

  int count = 0;
  LikeDataResponse? allpostlikeresponse;
  Future getallLikeresponse() async {
    allpostlikeresponse = await GroupAndChatRepository().getPostlikeData(
        postid: ref.read(viewgroupprov).postid!.toInt(),
        groupid: ref.read(viewgroupprov).groupid!);
    //allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:ref.read(viewgroupprov).postid!.toInt());
    //print( 'sdfsdsf${allpostlikeresponse!.likeData.length}');
    if (mounted) {
      setState(() {
        isliked = true;
        allpostlikeresponse!.likeData.forEach((element) {
          if (element.postId == widget.postid) {
            print(ref.read(viewgroupprov).postid!.toInt());
            count = element.likeCount;
          }
        });
      });
    }
  }

//LikeDataResponse?
  UnLikeDataResponse? allUnpostlikeresponse;
  Future getallUnLikeresponse() async {
    // postresponse!.userData.forEach((element) {
    //     ref.read(viewgroupprov).postid=  element.id;
    //   });
    allUnpostlikeresponse = await GroupAndChatRepository()
        .getPostUnlikeData(postid: ref.read(viewgroupprov).postid!);
    print(allUnpostlikeresponse);
    //  print( 'asdasdadasd${allpostlikeresponse!.likeData[0].likeCount}');
    if (mounted) {
      setState(() {
        isliked = false;
        allUnpostlikeresponse!.likeData.forEach((element) {
          if (element.postId == widget.postid) {
            count = element.likeCount;
          }
        });
      });
    }
  }

  // Future getallresponse() async {
  //   allUnpostlikeresponse =
  //       await GroupAndChatRepository().getPostUnlikeData(postid: widget.postid);
  //   print(allUnpostlikeresponse);
  //   //  print( 'asdasdadasd${allpostlikeresponse!.likeData[0].likeCount}');
  //   setState(() {
  //     // postresponse!.userData.forEach((element) {
  //     //     ref.read(viewgroupprov).postid=  element.id;
  //     //   });
  //     allUnpostlikeresponse!.likeData.forEach((element) {
  //       if (element.postId == widget.postid) {
  //         count = element.likeCount;
  //       }
  //     });
  //   });
  // }

  // ontap() {
  //   ref.read(viewgroupprov).postid = widget.postid;
  // }

  @override
  Widget build(BuildContext context) {
    final comment = ref.watch(commentinfo);
    if (widget.likes.isNotEmpty) {
      count = widget.likes[0].likeCount;
      widget.likes.forEach((element) {
        if (element.userId == preferences.getInt('Userid') &&
            element.status == 1) {
          isliked = true;
        } else {
          isliked = false;
        }
      });
    } else {
      count = 0;
      isliked = false;
    }

    return Builder(builder: (context) {
      // ontap();

      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
           //   ontap();
              print(isliked);
              if (isliked) {
                //  ref.read(viewgroupprov).postid=postresponse.userData[index];
                ref.read(viewgroupprov).postid = widget.postid;
                getallUnLikeresponse();
              } else {
                ref.read(viewgroupprov).postid = widget.postid;
                getallLikeresponse();
              }
            },
            child: isliked == true
                ? Padding(
                    padding: EdgeInsets.only(top: 13.0, right: 4),
                    child: SvgPicture.asset(
                      "Assets/Images/Tag.svg",
                      width: 12.w,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 13.0, right: 4, bottom: 4),
                    child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        radius: 18,
                        child: Image.asset(
                          "Assets/Images/Layer 1.png",
                        )),
                    // CircleAvatar(
                    //  backgroundColor: Colors.grey[900],radius: 17,),
                  ),
            // child: Icon(
            //   Icons.favorite,
            //   color: isliked == true ? Colors.red : Colors.grey[500],
            //   size: 26,
            // )
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '$count',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'SF Pro Text',
                color: Colors.white,
                fontSize: 11.sp),
          ),
          GestureDetector(
            onTap: () {
              setState(() {});
              comment.profile = widget.pic;
              comment.postname = widget.name;
              comment.subject = widget.subject;
              comment.dateandtime = widget.time;
              comment.id = widget.postid;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupComment()),
              );
            },
            // child: isliked == true
            //     ? Padding(
            //         padding: EdgeInsets.only(top: 13.0, right: 4),
            //         child: SvgPicture.asset(
            //           "Assets/Images/Tag.svg",
            //           width: 12.w,
            //         ),
            //       )
            //     :
            child: Padding(
              padding: EdgeInsets.only(top: 13.0, right: 4, bottom: 4),
              child: CircleAvatar(
                  backgroundColor: Colors.grey[900],
                  //  radius: 18,
                  child: Icon(Icons.comment)
                  //  Image.asset(
                  //   "Assets/Images/Layer 1.png",
                  // )
                  ),
              // CircleAvatar(
              //  backgroundColor: Colors.grey[900],radius: 17,),
            ),
          ),
          // IconButton(
          //   icon: Icon(Icons.comment_sharp),
          //   onPressed: () {
          //     setState(() {});
          //     comment.profile = widget.pic;
          //     comment.postname = widget.name;
          //     comment.subject = widget.subject;
          //     comment.dateandtime = widget.time;
          //     comment.id = widget.postid;
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => GroupComment()),
          //     );
          //   },
          // )
        ],
      );
    });
  }
}

class DeletePost extends ConsumerStatefulWidget {
  final int otheruserid;
  final String profileimg;
  final String name;
  final int postid;

  DeletePost(
      {Key? key,
      required this.name,
      required this.otheruserid,
      required this.postid,
      required this.profileimg})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DeletePostState();
}

class _DeletePostState extends ConsumerState<DeletePost> {
  bool status = false;
  GroupPostedDataResponse? postresponse;
  @override
  void initState() {
    getpostedresponse();
    // print(widget.postid);
    super.initState();
  }

  Future getpostedresponse() async {
    print('gId${ref.read(viewgroupprov).groupid!}');
    postresponse = await GroupAndChatRepository()
        .getAllGroupPostedData(id: ref.read(viewgroupprov).groupid!);

    //postresponse!.userData.reversed;
    status = true;

    // print( postresponse!.userData[0].likes.length);
    if (mounted) {
      setState(() {});
    }
  }

  getalldeletepostresponse(ViewGroupData allgroupview, context) async {
    final allpostresponse =
        await GroupAndChatRepository().getAllDeletepostData(id: widget.postid);
    //print( allpostresponse.status);
    // status=true;
    if (allpostresponse.status == "Your Post Will Be Deleted") {
      showToast(allpostresponse.status,
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
      getpostedresponse();
    } else {
      //print('object111');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50.h,
      // color: Colors.yellow,
      child: Column(
        children: [
          //SizedBox(height: 10,),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 2.5.w,
                        ),
                        CircleAvatar(
                          radius: 16.sp,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: '${widget.profileimg}',

                              ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                              width: 9.5.h,
                              height: 9.5.h,
                              fit: BoxFit.cover,

                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                radius: 33.sp,
                                child: Container(
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

                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress)),
                              errorWidget: (context, url, error) => Image.asset(
                                "Assets/Images/Portrait_Placeholder.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                //  getallLikeresponse(ref.read(viewgroupprov));
                              },
                              child: Container(
                                  height: 40,
                                  child: Text(
                                    '${widget.name}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'SF Pro Text',
                                        fontSize: 12.sp),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
                Row(
                  children: [
                    widget.otheruserid == preferences.getInt('Userid')
                        ? PopupMenuButton(
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry>[
                              // const PopupMenuItem(child: Text('Images',style: TextStyle(
                              //   fontFamily: 'Gilroy',
                              //   fontSize: 17,
                              //   fontWeight: FontWeight.w600,
                              //   color: Color(0xff591B4C)),)),
                              PopupMenuItem(
                                  onTap: () {
                                    //                  for (var i = 0; i < postresponse!.userData.length; i++) {
                                    // allgroupview.postid=  postresponse!.userData[i].id;
                                    //    print( postresponse!.userData[i].id);
                                    //       }
                                    // allgroupview.postid=  postresponse!.userData[index].id;
                                    //  print( allgroupview.postid);
                                    getalldeletepostresponse(
                                        ref.watch(viewgroupprov), context);
                                    getpostedresponse();
                                  },
                                  // height: 42,
                                  child: Text('Delete Post',
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff591B4C)))),
                            ],
                          )
                        : Container()
                    //                      IconButton(onPressed: (){

                    // SizedBox(width: 4.w,);
                    //                      }, icon: Icon(Icons.more_horiz)),
                    //                       SizedBox(width: 4.w,),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String url;
  final ScrollController scrollController;
  VideoPlayerScreen(
      {Key? key, required this.url, required this.scrollController})
      : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    setState(() {});
    print(widget.url);
    _controller = VideoPlayerController.network('${widget.url}');
    _initializeVideoPlayerFuture = _controller!.initialize();
    _controller!.setLooping(true);
    _controller!.setVolume(0.0);
    // _controller.videoPlayerOptions.
    // _controller!.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.url);
    //    _controller = VideoPlayerController.network(
    //     'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4');
    // _initializeVideoPlayerFuture = _controller!.initialize();
    // _controller!.setLooping(true);
    // _controller!.setVolume(1.0);
    return VisibilityDetector(
      key: ObjectKey(_controller),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          _controller!.pause(); //pausing  functionality

        } else {
          _controller!.play();
        }
      },
      child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                      _controller!.value.hasError
                          ? Container(
                              color: Colors.grey,
                              width: double.infinity,
                              child: Center(child: Text('Error Video')),
                            )
                          : Container()
                      //                Container(
                      //                   /// height: 40.h,
                      //                  child: FloatingActionButton(
                      //                    backgroundColor: Colors.transparent,
                      //                    onPressed: () {
                      //   // Wrap the play or pause in a call to `setState`. This ensures the
                      //   // correct icon is shown.
                      //   setState(() {
                      //     // If the video is playing, pause it.
                      //     if ( _controller!.setVolume(0.0)) {
                      //      _controller!.setVolume(0.1);
                      //     } else {
                      //       // If the video is paused, play it.
                      //        _controller!.setVolume(0);
                      //     }
                      //   });
                      //   },
                      //   // Display the correct icon depending on the state of the player.
                      //   child: Icon(
                      //  _controller!.setVolume(0.0)==_controller!.setVolume(0.0) ? Icons.volume_up : Icons.volume_off,
                      //   ),
                      //                   ),
                      //                )
                      // else Container()
                    ],
                  ),
                  Container(
                    /// height: 40.h,
                    child: FloatingActionButton(
                      elevation: 0,

                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        print(_controller!.value.volume);
                        // Wrap the play or pause in a call to `setState`. This ensures the
                        // correct icon is shown.
                        setState(() {
                          // // If the video is playing, pause it.
                          if (_controller!.value.volume == 1.0) {
                            _controller!.setVolume(0.0);
                          } else {
                            _controller!.setVolume(1.0);
                            // If the video is paused, play it.
                            //_controller!.setVolume(0.1);
                          }
                        });
                      },
                      // Display the correct icon depending on the state of the player.
                      child: Icon(
                        _controller!.value.volume == 1.0
                            ? Icons.volume_up
                            : Icons.volume_off,
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Container(
                height: 35.5.h,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                ),
              );
            }
          }),
    );
  }
}

class PostCommentContainer extends ConsumerStatefulWidget {
  final bool status;
  final int index;
  final bool commentcolor;
  final String profilename;
  final String profilepic;
  final String comment;
  final int commentid;
  final List<LikeComment> likelist;
  final int listcount;
  final DateTime time;
  PostCommentContainer(
      {Key? key,
      required this.index,
      required this.commentid,
      required this.listcount,
      required this.status,
      required this.commentcolor,
      required this.comment,
      required this.likelist,
      required this.profilename,
      required this.profilepic,
      required this.time})
      : super(key: key);

  @override
  _PostCommentContainerState createState() => _PostCommentContainerState();
}

class _PostCommentContainerState extends ConsumerState<PostCommentContainer> {
  bool isliked = false;
  int count = 0;
  String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365)
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    if (diff.inDays > 30)
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    if (diff.inDays > 7)
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    if (diff.inDays > 0)
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    if (diff.inHours > 0)
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    if (diff.inMinutes > 0)
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "min" : "minutes"} ago";
    return "just now";
  }

  CommentLikeModle? allpostlikeresponse;
  getallLikeresponse() async {
    allpostlikeresponse = await AuthRepository().getCommentlikeData(
      commentid: widget.commentid,
      postid: ref.read(commentinfo).id!,
      groupid: ref.read(viewgroupprov).groupid!,
    );
    //allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:ref.read(viewgroupprov).postid!.toInt());
    print('sdfsdsf${allpostlikeresponse!.likeData[0].status}');
    print('asdasdadasd${widget.commentid}');
    print(allpostlikeresponse!.likeData[0].likecount);
    if (mounted) {
      setState(() {
        isliked = true;
        // allpostlikeresponse!.likeData.forEach((element) {
        //   if (element.postId==widget.commentid) {
        //     print(ref.read(viewgroupprov).postid!.toInt());
        //     count=element.likecount;
        //   }
        // });
      });
    }
  }

//LikeDataResponse?
  CommentUnLikeModle? allUnpostlikeresponse;
  getallUnLikeresponse() async {
    // postresponse!.userData.forEach((element) {
    //     ref.read(viewgroupprov).postid=  element.id;
    //   });
    allUnpostlikeresponse = await AuthRepository().getCommentUnlikeData(
      commentid: widget.commentid,
      postid: ref.read(commentinfo).id!,
    );
    print(allUnpostlikeresponse);
    print('asdasdadasd${widget.commentid}');
    if (mounted) {
      setState(() {
        isliked = false;
        //  allUnpostlikeresponse!.likeData.forEach((element) {
        //    if (element.postId==widget.commentid) {
        //     print(ref.read(viewgroupprov).postid!.toInt());
        //     count=element.likecount;
        //   }
        // });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (widget.likelist.isNotEmpty) {
        count = widget.likelist[0].likecount;
        widget.likelist.forEach((element) {
          if (element.userId == preferences.getInt('Userid') &&
              element.status == 1) {
            isliked = true;
          } else {
            isliked = false;
          }
        });
        print('111111111111111111');
      } else {
        count = 0;
        isliked = false;
      }
    } catch (e) {
      print(e);
    }
    return Container(
      color:
          widget.commentcolor == true ? Colors.blueAccent[100] : Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        color:
            widget.commentcolor == true ? Colors.blueAccent[100] : Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15.sp,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: '${widget.profilepic}',

                      ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                      width: 9.5.h,
                      height: 9.5.h,
                      fit: BoxFit.cover,

                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 33.sp,
                        child: Container(
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

                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Image.asset(
                        "Assets/Images/Portrait_Placeholder.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    //color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '${widget.profilename}',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1A1A1A))),

                              TextSpan(
                                  text: '  ${widget.comment}',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff1A1A1A))),
                              //  TextSpan(text: ' world!'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Text(timeAgo(widget.time),
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                            SizedBox(
                              width: 1.h,
                            ),
                            Text('${widget.listcount} Likes',
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    //child: Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Builder(builder: (context) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      // ontap();
                                      print(isliked);
                                      if (isliked) {
                                        //  ref.read(viewgroupprov).postid=postresponse.userData[index];
                                        //   ref.read(viewgroupprov).postid=widget.postid;
                                        getallUnLikeresponse();
                                      } else {
                                        //    ref.read(viewgroupprov).postid=widget.postid;
                                        getallLikeresponse();
                                      }
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: isliked == true
                                          ? Colors.red
                                          : Colors.grey[500],
                                      size: 26,
                                    )),
                              ],
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                  //child: Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
