import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/UpdateProfiledp.dart';
import 'package:icollekt/Model/profilebg_modle.dart';
import 'package:icollekt/Screens/Profile/Followers/Followers.dart';
import 'package:icollekt/Screens/Profile/Followig/Following.dart';
import 'package:icollekt/Screens/chat/yourOffers/OfferScreen.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../ImageView.dart';
import '../../../Service/ProfileRepositoryService.dart';
import '../Page/ProfilePhotos.dart';

class ProfileTopInfo extends ConsumerStatefulWidget {
  final id;
  final followcount;
  final followingcount;
  final postcount;
  final status;
  const ProfileTopInfo({
    Key? key,
    this.id,
    this.followcount,
    this.followingcount,
    this.postcount,
    this.status,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileTopInfoState();
}

class _ProfileTopInfoState extends ConsumerState<ProfileTopInfo> {
  @override
  void initState() {
    super.initState();
  }

  var homedata = '';
  var pic = '';
  getprofilepic() async {
    final productResponse =
        await AuthRepository().getprofile(id: preferences.getInt('Userid'));

    try {
      homedata = productResponse.profilePic;
      pic = productResponse.bannerImg;
    } catch (e) {
      print(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

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
          // print('object');
          File imageFile = File(pickedFile.path);

          uploadImageToDB(imageFile, ref.watch(profiledpprov));
          getprofilepic();
        }
      }
    }
  }

  //Background Image
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
        //   print('object');
      } else {
        File _file = File("${filePickerResult.files.single.path}");

        uploadImageToDBbg1(
          _file,
        );
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
        uploadImageToDB(_file, ref.watch(profiledpprov));
      }
    }
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
        //   print('object1');
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
          //   print('object');
          File imageFile = File(pickedFile.path);
          uploadImageToDBbg1(
            imageFile,
          );
        }
      }
    }
  }

  //Dp API Call
  uploadImageToDB(filepath, CreateProfileData imagetodb) async {
    String filename = basename(filepath.path);
    //  imagetodb.filepathprov=filename;
    try {
      var formData = FormData.fromMap({
        'profile': [
          await MultipartFile.fromFile(filepath.path, filename: filename),
          //  await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
        ]
      });
      final response = await Dio().post(
          "http://i-collekt.jksoftec.com:3001/api/profile/profile-update/${preferences.getInt('Userid')}",
          data: formData);
//  print('hello${filename}');
      if (response.statusCode == 200) {
        UpdateProfileDataResponse dp;
        dp = UpdateProfileDataResponse.fromJson(response.data);

        imagetodb.filepathprov = dp.profilePicUrl;
        print('response data11 ${imagetodb.filepathprov}');
        print('response data ${dp.profilePicUrl}');
        print('successfully uploaded');
      } else {
        print('could not be uploaded');
      }
    } catch (e) {}

    setState(() {});
  }

  //Background Api Call
  uploadImageToDBbg1(
    filepath,
  ) async {
    String filename = basename(filepath.path);
    try {
      var formData = FormData.fromMap({
        'banner': [
          await MultipartFile.fromFile(filepath.path, filename: filename),
        ]
      });
      final response = await Dio().post(
          "http://i-collekt.jksoftec.com:3001/api/profile/banner-update/${preferences.getInt('Userid')}",
          data: formData);

      if (response.statusCode == 200) {
        //next1 ='Next';
        ProfilebgModel dp;
        dp = ProfilebgModel.fromJson(response.data);

        print('response data ${dp.bannerImgUrl}');
        print('successfully uploaded');
      } else {
        print('could not be uploaded');
      }
    } catch (e) {}

    if (mounted) {
      setState(() {});
    }
  }

  getdeletebannerprofilepic() async {
    final deletebannerResponse =
        await ProfileRepository().getProfilebannerImageDeleteResponse();
    print(deletebannerResponse);

    setState(() {});
  }

  getdeletedpprofilepic() async {
    final deletedpprofilepic =
        await ProfileRepository().getProfileDpImageDeleteResponse();
    print(deletedpprofilepic);

    setState(() {});
  }
 final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  WebViewController? _con;
String sethtml(){
  return('''<span id=''></span>
<script src='https://www.paypalobjects.com/js/external/api.js'></script>
<script>
paypal.use( ['login'], function (login) {
  login.render ({
    "appid":"AUU8IiB0De8c41cDCr5YPhHzc0eydU77wxpjoJSbRPJM6wzwkZ6Fg7UYlMmr5Gm_kgFUlsqomP3pT_P6",
    "authend":"sandbox",
    "scopes":"email",
    "responseType":"code",
    "locale":"en-in",
    "buttonType":"LWP",
    "buttonShape":"pill",
    "buttonSize":"lg",
    "fullPage":"true",
    "returnurl":"https://www.paypal.com/webapps/auth/protocol/openidconnect/v1/authorize?client_id=AUU8IiB0De8c41cDCr5YPhHzc0eydU77wxpjoJSbRPJM6wzwkZ6Fg7UYlMmr5Gm_kgFUlsqomP3pT_P6&scope=openid%2520profile%2520email&response_type=code&redirect_uri=http%253A%252F%252Flocalhost%253A5000%252Fsignin-paypal&state=CfDJ8MrLCpontb5BpF_XK8aS5v2ZloqcJevGj2CsUOPB9VdVd63zq-GY2t44aZPAi6-94UbUxH2-LnTTQ7AxPTSpj63Vdp7gfJdr7PYFRirvJHmVzY7R_6cslWFhwp2Qu5t0tg6W56BcPtALBQ2vDVP1HbENp2QeTHm9BPYVLT10ZYSdR9xnOIiMyKCDubRKYEaAeABNGAi-vyldUu140GpIAHx9pNuTy-wUP3YMP2sFshNuYMefO8yQI8-uTgQzkFhNAEFOKqmxkl3bdPSCWQv8iIEzQ-ZF1sn0WYwSOXXRzuQzSVA8QPsLmcYD68i2cqPE2LwAWqCwSlbxDyh8bHtrOOswgzIAd2QSOAYSz9hghcTPx4uNARiiv0_HvMrtlzFKDWKsQucZadWafi7RQz_kO8dC1N2IgdW9KCBaQDCJyWLC-SD5n0TaKdg4hSHiCQT9yDVDExm7-aq8QHIOhs3PkzH6BGfRtkaKQLswdaKax8Cp5_ve2zJ-xwxDayF2S_WsVXfwBx_EJpCYT3ERCbKWSbyWtIpy9sEQDln2uTPiwokqQS9TEaU1cm8Dn0rMD6TdoxKp7hy4vw5HzKXusvOPaSHnc7eaKDolPpbuZjF4yRhFrtL76pJSsy7tzUcgLiJntA"
  });
});
</script>''');
}
 _loadHTML() async {
    _con!.loadUrl(Uri.dataFromString(
        sethtml(
          
        ),
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        profiletop(context),
        SizedBox(
          height: 1.h,
        ),
        profilename(context),
        // Text('${ preferences.getInt('Userid')}'),
        SizedBox(
          height: 2.h,
        ),
         CustomButton(
            title: 'Edit Profile',
            ontapped: () => About(
                  feature: 'feature',
                ),
            nav: false),
          //   InkWell(
          //    onTap: () => {
          //           Navigator.of(context).push(
          //             MaterialPageRoute(
          //               builder: (BuildContext context) =>
          //               SafeArea(
          //                 top: true,
          //                 child: WebView(
          //                    initialUrl: 'https://flutter.dev',
          // javascriptMode: JavascriptMode.unrestricted,
          // onWebViewCreated: (WebViewController webViewController) {
          //   // _controller.complete(webViewController);
          //   _con = webViewController;
          //   _loadHTML();
          // },
                            
                            
          //                 ),
          //               )
                       
          //             ),
          //           )
          //         },
          //   child: Container(
          //     margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          //     width:95.w,
          //     height: 50,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadiusDirectional.circular(5),
          //       color: Color(0xff591B4C)
          //     ),
          //     child: Center(child: Text('Connect to Paypal',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.w600,
          //       fontFamily: "Gilroy",
          //       fontSize: 16
          //     ),
          //     )),
          //   ),
          // ),
           InkWell(
             onTap: (){
      //          ref.watch(creategroupnavigatorprov).creategroup='create';
                pushNewScreen(
          context,
          screen: OfferScreen() ,
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      //.then((value) =>  filteredData.clear()).then((value) =>  getallgroupdata());
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:100.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text('Your Offers',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 15
              ),
              )),
            ),
          ),

       
        SizedBox(
          height: 2.h,
        ),
        Container(
            margin: EdgeInsets.only(bottom: 1, left: 20),
            child: Row(
              children: [
                Text(
                  'My Products',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff1A1A1A),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      fontFamily: 'Gilroy'),
                ),
              ],
            ),
            //child: Icon( Icons.vertical_split_outlined, ),
            width: double.infinity,
            height: 50,
            color: Colors.white),
        Container(
            margin: EdgeInsets.only(bottom: 1, left: 10, top: 0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      InkWell(
                        //minWidth: 30.w,
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: ProfilePhotos(id: preferences.getInt('Userid'),),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },

                        child: Container(
                          width: 30.w,
                          //  height: 10,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              'Photos',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff1A1A1A),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.sp,
                                  fontFamily: 'Gilroy'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        //minWidth: 30.w,
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: About(),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },

                        child: Container(
                          width: 30.w,
                          //  height: 10,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              'About',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff1A1A1A),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.sp,
                                  fontFamily: 'Gilroy'),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
            //child: Icon( Icons.vertical_split_outlined, ),
            width: double.infinity,
            height: 35,
            color: Colors.white),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget profiletop(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          //color: Colors.yellow,
          height: 20.5.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  backgroundImageBottomsheet(context, ref.read(viewphotoprov));
                },
                child: Container(
                  height: 14.5.h,
                  width: double.infinity,
                  color: Colors.grey[600],
                  child: CachedNetworkImage(
                    imageUrl: '$pic',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
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
                                    value: downloadProgress.progress))),
                    // CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        //Icon(Icons.error)
                        Image.asset(
                      "Assets/Images/placeholder-image.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 7.5.h,
          child: GestureDetector(
            onTap: () {
              profiledpImage(context, ref.read(viewphotoprov));
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 39.sp,
              child: CircleAvatar(
                radius: 33.sp,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Builder(builder: (context) {
                    getprofilepic();
                    return CachedNetworkImage(
                      imageUrl: '$homedata',

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
                          (context, url, downloadProgress) => Center(
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress))),
                      // CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Image.asset(
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
    );
  }

  cameraOrGallery(BuildContext context, String dporbg) {
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
        height: 25.h,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.sp),
              child: Text('Choose Camera or Gallery',
                  style: TextStyle(
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
                Navigator.pop(context);
                if (dporbg == 'dp') {
                  chooseAndUploadImage(
                    context,
                  );
                } else {
                  chooseAndUploadImageforbg(
                    context,
                  );
                }

                // Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Gallery',
                    style: TextStyle(
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
                } else {
                  cameraImageforbg(
                    context,
                  );
                }
                // chooseAndUploadImage(context,ref.watch(profiledpUpdateprov));
                //   Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Camera',
                    style: TextStyle(
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

  profiledpImage(BuildContext context, ViewPhotoData bdpphototprov) {
    return showCupertinoModalBottomSheet(
      enableDrag: true,
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        //  margin: EdgeInsets.symmetric(horizontal: 10),
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
                bdpphototprov.photodata = homedata;
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
                cameraOrGallery(context, 'dp');
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Upload image',
                    style: TextStyle(
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
                getdeletedpprofilepic();
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Remove image',
                    style: TextStyle(
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

  Widget profilename(context) {
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60.w,
              child: Text(
                '${preferences.getString('Name')}',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff1A1A1A),
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                    fontFamily: 'Gilroy'),
              ),
            )
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  '${widget.postcount}',
                  style: TextStyle(
                      color: Color(0xff1A1A1A),
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      fontFamily: 'Gilroy'),
                ),
                Text(
                  'Post',
                  style: TextStyle(
                      //  decoration: TextDecoration.underline,
                      color: Color(0xff1A1A1A),
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      fontFamily: 'Gilroy'),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: Following(
                    id: preferences.getInt('Userid'),
                  ),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: Column(
                children: [
                  Text(
                    //'0',
                  '${widget.followcount}',
                    style: TextStyle(
                        color: Color(0xff1A1A1A),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        fontFamily: 'Gilroy'),
                  ),
                  Text(
                    'Followers',
                    style: TextStyle(
                        color: Color(0xff1A1A1A),
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        fontFamily: 'Gilroy'),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: Followers(
                    id: preferences.getInt('Userid'),
                  ),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: Column(
                children: [
                  Text(
                    //'0',
                    '${widget.followingcount}',
                    style: TextStyle(
                        color: Color(0xff1A1A1A),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        fontFamily: 'Gilroy'),
                  ),
                  Text(
                    'Following',
                    style: TextStyle(
                        color: Color(0xff1A1A1A),
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        fontFamily: 'Gilroy'),
                  ),
                ],
              ),
            )
          ],
        ),
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
        margin: EdgeInsets.symmetric(horizontal: 10),
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
                bgphototprov.photodata = pic;
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
                cameraOrGallery(context, 'bg');
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Upload image',
                    style: TextStyle(
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
                getdeletebannerprofilepic();
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Remove image',
                    style: TextStyle(
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
