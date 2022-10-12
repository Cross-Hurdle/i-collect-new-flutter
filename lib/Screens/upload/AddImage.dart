import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'TumbnailImage.dart';

class AddImage extends ConsumerStatefulWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddImageState();
}

class _AddImageState extends ConsumerState<AddImage> {
  ScrollController scrollController = ScrollController();
  // @override
  // void initState() {
  //   super.initState();
  //   ref.read(productupload).productimage.clear();
  //   ref.read(videolength).videolength.clear();
  // }
//    Future cameraImage(context)async{
//     var status = await Permission.camera.request();

//   setState(() {
//     //_image= File( camera.);
//   });
//     if (status.isDenied) {
//       // We didn't ask for permission yet.
//       showDialog(
//           context: context,
//           builder: (BuildContext context) => CupertinoAlertDialog(
//                 title: Text('Photo Permission'),
//                 content: Text('This app needs photo to upload user document'),
//                 actions: <Widget>[
//                   CupertinoDialogAction(
//                     child: Text('Deny'),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                   CupertinoDialogAction(
//                     child: Text('Settings'),
//                     onPressed: () => openAppSettings(),
//                   ),
//                 ],
//               ));
//     } else if (status.isRestricted) {
//       Fluttertoast.showToast(msg:
//           "Go to your application settings and give photo permission ", );
//     } else if (status.isGranted) {
//      // FilePickerResult pickedFile;
// //XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
//     //  pickedFile = (await FilePicker.platform.pickFiles(
//     //     type: FileType.image,
//     //     allowMultiple: false,
//     //   ))!;
// var pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
//       if (pickedFile == null) {

//          showToast("No file is chosen",
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
//        // Fluttertoast.showToast(msg:"No file is chosen",
//         //    );
//       }
//        else {
//     // ignore: unnecessary_null_comparison
//     if (pickedFile != null) {

//         File imageFile = File(pickedFile.path);

//         //dpprovider.profilebg=File(pickedFile.path);

//     // showModalBottomSheet(
//     //       isScrollControlled: true,
//     //       backgroundColor: Colors.black.withOpacity(0.5),
//     //       context: context,
//     //       builder: (context) => Container(
//     //   margin: EdgeInsets.all(15),
//     //   child: Column(
//     //     mainAxisAlignment: MainAxisAlignment.center,
//     //     children: [
//     //       Container(
//     //         height: 250,
//     //         width: double.infinity,
//     //         decoration: BoxDecoration(
//     //           borderRadius: BorderRadius.circular(10),
//     //           color: Colors.white,
//     //         ),
//     //         padding: EdgeInsets.all(10),
//     //         alignment: Alignment.center,
//     //         child: Image.file(
//     //           imageFile,
//     //           fit: BoxFit.fill,
//     //         ),
//     //       ),
//     //       SizedBox(
//     //         height: 15,
//     //       ),
//     //       Row(
//     //         mainAxisAlignment: MainAxisAlignment.center,
//     //         children: [
//     //           MaterialButton(
//     //             onPressed: () {
//     //               Navigator.pop(context);
//     //             },
//     //             color:Color(0xff591B4C),
//     //             child: Padding(
//     //               padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
//     //               child: Text(
//     //                 "Cancel",
//     //                 style: TextStyle(
//     //                   fontSize: 18,
//     //                   color: Colors.white,
//     //                   fontWeight: FontWeight.w400,
//     //                   //  fontFamily: 'Gilroy',
//     //                 ),
//     //               ),
//     //             ),
//     //           ),
//     //           SizedBox(
//     //             width: 15,
//     //           ),
//     //           MaterialButton(
//     //               onPressed: (){
//     //                 Navigator.pop(context);
//     //                  //uploadImageToDB(imageFile,ref.watch(profilebgprov));
//     //                //  uploadImageToDB(imageFile);
//     //               //  print(dpprovider.filepathprov);

//     // //                 showToast('uploaded successfully',
//     // //  textStyle: TextStyle(color: Colors.black),
//     // //  backgroundColor: Colors.grey[300],
//     // //                 context: context,

//     // //                 borderRadius: BorderRadius.circular(10),
//     // //                 animation: StyledToastAnimation.size,
//     // //                 reverseAnimation: StyledToastAnimation.size,
//     // //                 axis: Axis.horizontal,
//     // //                 position: StyledToastPosition.center,
//     // //                 animDuration: Duration(milliseconds: 400),
//     // //                 duration: Duration(seconds: 2),
//     // //                 curve: Curves.linear,
//     // //                 reverseCurve: Curves.linear);

//     //                // uploadImageToDB();

//     //               },
//     //             color:Color(0xff591B4C),
//     //             child: Padding(
//     //               padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
//     //               child: Text(
//     //                 "Confirm",
//     //                 style: TextStyle(
//     //                   fontSize: 18,
//     //                   color: Colors.white,
//     //                   fontWeight: FontWeight.w400,
//     //                   //  fontFamily: 'Gilroy',
//     //                 ),
//     //               ),
//     //             ),
//     //           ),
//     //         ],
//     //       ),
//     //     ],
//     //   ),
//     // ),
//     //     );
//     }

//       }

//    }
// }
  bool status1 = false;
  List imageMultiplelist = [];
  chooseAndUploadImage(
    context,
  ) async {
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
        type: FileType.media,
        allowMultiple: true,
      ))!;

      // ignore: unnecessary_null_comparison
      if (filePickerResult == null) {
      } else {
        // File _file = File("${filePickerResult.files.single.path}");
        ref.read(productupload).productimage =
            filePickerResult.paths.map((path) => File(path!)).toList();
        //        final fs = filesize(filePickerResult.files);
        // print(fs);
        status1 = true;
        setState(() {});
        // for (var i = 0; i < _file.lengthSync(); i++) {

        // }
        // dpprovider.profilebg=_file;

        // print(files.length);

      }
    }
  }

  validation() {
    //  for (var i = 0; i <ref.read(videolength).videolength.length ; i++)
    // print('fffffffffffffffff');
    setState(() {});
    // ignore: unnecessary_null_comparison
    if (ref.read(productupload).productimage != null) {
      if (ref.read(productupload).productimage.length <= 5 &&
          ref.read(productupload).productimage.isNotEmpty) {
        //  print('object1');
        //  print(ref.read(productupload).productimage);
        var videolengthdata;
        for (var i = 0; i < ref.read(videolength).videolength.length; i++) {
          videolengthdata = ref.read(videolength).videolength[i]! > 100;
          // ||ref.read(videolength).videolength[i]!=0;
          // debugPrint(ref.read(videolength).videolength[i].toString());
        }
        if (videolengthdata) {
          // print(ref.read(videolength).videolength[0].toString());
          //  print(videolength);
          showToast(
              'The Video file type you have Chosen is unsupported.Please try again',
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
          pushNewScreen(
            context,
            screen: TumbnaileImage(),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        }

        //                pushNewScreen(
        //     context,
        //     screen:TumbnaileImage(),
        //     withNavBar:false, // OPTIONAL VALUE. True by default.
        //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
      } else {
        showToast('You can upload 5 images',
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
    } else {
      showToast('You can upload 5 images',
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
//    if (ref.read(productupload).productimage!.length<=5) {
//      print(ref.read(videolength).videolength.length);
//      for (var i = 0; i <ref.read(videolength).videolength.length ; i++) {
// //  print(ref.read(videolength).videolength[i]);
// //         if(ref.read(videolength).videolength[i]>60||ref.read(videolength).videolength[i]==0){
// //            showToast('The Video file type you have Chosen is unsupported.Please try again',
// //      textStyle: TextStyle(color: Colors.black),
// //      backgroundColor: Colors.grey[300],
// //                     context: context,

// //                     borderRadius: BorderRadius.circular(10),
// //                     animation: StyledToastAnimation.size,
// //                     reverseAnimation: StyledToastAnimation.size,
// //                     axis: Axis.horizontal,
// //                     position: StyledToastPosition.center,
// //                     animDuration: Duration(milliseconds: 400),
// //                     duration: Duration(seconds: 2),
// //                     curve: Curves.linear,
// //                     reverseCurve: Curves.linear);
// //   //    print(ref.read(videolength).videolength[i]);
// //   // print('nooooooooooooooooo');
// //    } else {
// //       print('noooossooooooooooooo');
// //            pushNewScreen(
// //           context,
// //           screen:TumbnaileImage(),
// //           withNavBar:false, // OPTIONAL VALUE. True by default.
// //           pageTransitionAnimation: PageTransitionAnimation.cupertino,
// //       );
// //    }
//      }

//    }else {
//       showToast('You can upload 5 images',
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
//    }
//    else{
//       //  pushNewScreen(
//       //     context,
//       //     screen:TumbnaileImage(),
//       //     withNavBar:false, // OPTIONAL VALUE. True by default.
//       //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
//       // );
//      showToast('Upload Your Product Picture',
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
//    }
  }

  @override
  Widget build(BuildContext context) {
    // ref.read(productupload).productimage!.clear();
    // ref.read(videolength).videolength.clear();
    return Scaffold(
      appBar: topappbar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 48.0, left: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Upload your product picture',
                            style: TextStyle(
                                color: Color(0xff1A1A1A),
                                fontWeight: FontWeight.w700,
                                fontSize: 15.sp,
                                fontFamily: 'Gilroy'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  camera(),
                        fileupload()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0, left: 20),
                    child: Row(
                      children: [
                        Text(
                          'You can upload 5 images',
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
                    height: 40,
                  ),
                  imagelist()
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //  ref.read(videolength).videolength.add('a');
              // print(ref.read(videolength).videolength[0].toString());
              print('objectfdsf');
              validation();
              //   listed();

              //  print("d");
              //   ref.read(videolength).videolength.clear();
              // imageupload.productimage=
              // TumbnaileImage();
              //           pushNewScreen(
              //     context,
              //     screen:AddImage() ,
              //     withNavBar:false, // OPTIONAL VALUE. True by default.
              //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
              // );
              // onPressed(function: onpressedtitle);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: 95.w,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5),
                  color: Color(0xff591B4C)),
              child: Center(
                  child: Text(
                'Next',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                    fontSize: 16),
              )),
            ),
          ),
          // CustomButton(title: 'Next', ontapped:()=> TumbnaileImage(),nav: false,)
        ],
      ),
    );
  }

  Widget camera() {
    return Expanded(
      child: InkWell(
        onTap: () {
          //  cameraImage(context);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          // width: 51.w,
          height: 41.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Image.asset(
            "Assets/Images/camera.png",
          ),
        ),
      ),
    );
  }

  Widget fileupload() {
    return Expanded(
      child: InkWell(
        onTap: () {
          ref.read(videolength).videolength.clear();
          chooseAndUploadImage(
            context,
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          // width: 51.w,
          height: 41.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Image.asset(
            "Assets/Images/fileupload.png",
          ),
        ),
      ),
    );
  }

  Widget imagelist() {
    final imageupload = ref.read(productupload);
    //           final fs = filesize(imageupload.productimage![0].path);
    // print(fs);
    // ignore: unnecessary_null_comparison
    if (imageupload.productimage == null) {
      // final fs = filesize(imageupload.productimage![0].path);
      //print(fs);
      return Container(
        height: 10.h,
        // child: Center(child: CircularProgressIndicator())
      );
    } else
      return imageupload.productimage.length != 0
          ? Container(
              width: double.infinity,
              height: 20.h,
              child: ListView.builder(
                  itemCount: imageupload.productimage.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(2, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          height: 20.h,
                          width: 50.w,
                          child: Builder(builder: (context) {
                            if (imageupload.productimage[index].path
                                        .split('.')
                                        .last ==
                                    "png" ||
                                imageupload.productimage[index].path
                                        .split('.')
                                        .last ==
                                    "jpg" ||
                                imageupload.productimage[index].path
                                        .split('.')
                                        .last ==
                                    "jpeg" ||
                                imageupload.productimage[index].path
                                        .split('.')
                                        .last ==
                                    "web") {
                              ref.read(videolength).videolength.add(0);
                              // imageupload.videolength= filesize(imageupload.productimage![index].lengthSync());
                              return Image.file(
                                imageupload.productimage[index],
                                fit: BoxFit.fill,
                              );
                            }
                            // else if(item.split('.').last=="png"){
                            //   return Container();
                            // }
                            else {
                              //   imageupload.videolength= filesize(imageupload.productimage![index].lengthSync());

                              return UploadVideoPlayerScreen(
                                  url: imageupload.productimage[index],
                                  scrollController: scrollController);
                            }
                          }),
                          //    color: Colors.red,
                        ),
                        //  Builder(
                        //    builder: (context) {
                        //      return Container(
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(5),
                        //           color: Color(0xff591B4C).withOpacity(0.7),
                        //            boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.black12,
                        //         spreadRadius: 1,
                        //         blurRadius: 5,
                        //         offset: Offset(2, 2), // changes position of shadow
                        //       ),
                        //         ],
                        //         ),
                        //        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        //        height: 20.h,
                        //        width: 50.w,
                        //      );
                        //    }
                        //  )
                      ],
                    );
                  }),
            )
          : Container();
  }

  AppBar topappbar(context) {
    return AppBar(
      title: Text(
        'Add image',
        style: TextStyle(
            color: Color(0xff1A1A1A),
            fontWeight: FontWeight.w700,
            fontSize: 18,
            fontFamily: 'Gilroy'),
      ),
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
    );
  }
}

class UploadVideoPlayerScreen extends ConsumerStatefulWidget {
  final File url;
  final ScrollController scrollController;
  UploadVideoPlayerScreen(
      {Key? key, required this.url, required this.scrollController})
      : super(key: key);

  @override
  _UploadVideoPlayerScreenState createState() =>
      _UploadVideoPlayerScreenState();
}

class _UploadVideoPlayerScreenState
    extends ConsumerState<UploadVideoPlayerScreen> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    ref.read(videolength).videolength.clear();
    setState(() {});
    print("rrrrrrrrrrrr   ${widget.url}");
    _controller = VideoPlayerController.file(widget.url);

    _initializeVideoPlayerFuture = _controller!.initialize();

    _controller!.setLooping(true);
    // _controller.videoPlayerOptions.
    _controller!.setVolume(0);
    //  if ( _controller!.value.isPlaying) {
    //    print('play')
    //    _controller!.pause();
    //   }
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
    _controller = VideoPlayerController.file(widget.url);
    _initializeVideoPlayerFuture = _controller!.initialize();

    _controller!.setLooping(true);
    // _controller.videoPlayerOptions.
    _controller!.setVolume(0);
    ref
        .read(videolength)
        .videolength
        .add(_controller!.value.duration.inSeconds.toInt());
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
              ref
                  .read(videolength)
                  .videolength
                  .add(_controller!.value.duration.inSeconds.toInt());
              return Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  ),
                  // _controller!.value.isBuffering?  Container(
                  //     child: CircularProgressIndicator(),
                  //   ):Container()
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
                            if (_controller!.value.isPlaying) {
                              _controller!.pause();
                            } else {
                              // If the video is paused, play it.
                              _controller!.play();
                            }
                          });
                        },
                        // Display the correct icon depending on the state of the player.
                        child: Icon(
                          _controller!.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                      ),
                    ),
                  )
                  // else Container()
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
