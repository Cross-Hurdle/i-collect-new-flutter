import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TumbnaileImage extends ConsumerStatefulWidget {
  const TumbnaileImage({Key? key}) : super(key: key);

  @override
  ConsumerState<TumbnaileImage> createState() => _TumbnaileImageState();
}

class _TumbnaileImageState extends ConsumerState<TumbnaileImage> {
   Future cameraImage(context)async{
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
     // FilePickerResult pickedFile;
//XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    //  pickedFile = (await FilePicker.platform.pickFiles(
    //     type: FileType.image,
    //     allowMultiple: false,
    //   ))!;
var pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile == null) {
        
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
       // Fluttertoast.showToast(msg:"No file is chosen",
        //    );
      }
       else {
    // ignore: unnecessary_null_comparison
    if (pickedFile != null) {
      
        File imageFile = File(pickedFile.path);


        //dpprovider.profilebg=File(pickedFile.path);

    showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.black.withOpacity(0.5),
          context: context,
          builder: (context) => Container(
      margin: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Image.file(
              imageFile,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color:Color(0xff591B4C),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      //  fontFamily: 'Gilroy',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              MaterialButton(
                  onPressed: (){
                    Navigator.pop(context);
                     //uploadImageToDB(imageFile,ref.watch(profilebgprov));
                   //  uploadImageToDB(imageFile);
                  //  print(dpprovider.filepathprov);
                     
    //                 showToast('uploaded successfully',
    //  textStyle: TextStyle(color: Colors.black),
    //  backgroundColor: Colors.grey[300],
    //                 context: context,
                    
    //                 borderRadius: BorderRadius.circular(10),
    //                 animation: StyledToastAnimation.size,
    //                 reverseAnimation: StyledToastAnimation.size,
    //                 axis: Axis.horizontal,
    //                 position: StyledToastPosition.center,
    //                 animDuration: Duration(milliseconds: 400),
    //                 duration: Duration(seconds: 2),
    //                 curve: Curves.linear,
    //                 reverseCurve: Curves.linear);
                    
                   // uploadImageToDB();
                    _filedata = imageFile;
                     ref.watch(productupload).tumbnail=imageFile;
                      final fs2 = filesize( _filedata!.lengthSync());
  print(fs2);
                   // final kb = bytes / 1024;
                   
                  //  print();
                  setState(() {
                    
                  });
                    
                  },
                color:Color(0xff591B4C),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      //  fontFamily: 'Gilroy',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
        );
    }

      }

  
    }
 }
File ?_filedata;
chooseAndUploadImage(context,) async {
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
       
      } else {
        File _file = File("${filePickerResult.files.single.path}");

  // dpprovider.profilebg=_file;

        print(_file);

        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.black.withOpacity(0.5),
          context: context,
          builder: (context) => Container(
      margin: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Image.file(
              _file,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color(0xff591B4C),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      //  fontFamily: 'Gilroy',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              MaterialButton(
                  onPressed: (){
                  //  uploadImageToDB(_file,ref.watch(profilebgprov));
                   _filedata = _file;
                   ref.watch(productupload).tumbnail=_file;
                  setState(() {
                    
                  });
                    print(_file);
                    final fs2 = filesize( _filedata!.lengthSync());
  print(fs2);
                     Navigator.pop(context);
                  },
                color:Color(0xff591B4C),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      //  fontFamily: 'Gilroy',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),

        );
      }


    }
  }
    validation(){
       if(ref.read(productupload).tumbnail!=null)
   {
       
                pushNewScreen(
          context,
          screen:Hashtags(),
          withNavBar:false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
   } else {
      showToast('Upload Your Thumbnail Picture',
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
   
   }
  @override
  Widget build(BuildContext context) {
   // final imageupload= ref.read(productupload);
    return Scaffold(
      appBar: topappbar(context),
      body: Column(crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:48.0,left: 25),
                  child: Row(
                    children: [
                    Expanded(
                      child: Text('Upload or take your product Thumbnail',
                                style: TextStyle(
                                  color: Color(0xff1A1A1A),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  fontFamily: 'Gilroy'
                                ),
                                ),
                    ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     camera(),
                     fileupload()
                    ],
                  ),
                ),
                SizedBox(height: 60,),
                picture()
            //       Padding(
            //       padding: const EdgeInsets.only(top:38.0,left: 20),
            //       child: Row(
            //         children: [
            //         Text('You can upload up to 5 images',
            // style: TextStyle(
            //   color: Color(0xff1A1A1A),
            //   fontWeight: FontWeight.w400,
            //   fontSize: 13.sp,
            //   fontFamily: 'Gilroy'
            // ),
            // ),
            //         ],
            //       ),
            //     ),
               //  imagelist()
              ],
            ),
          ),
            InkWell(
             onTap: (){
               
               validation();
      //           pushNewScreen(
      //     context,
      //     screen:AddImage() ,
      //     withNavBar:false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:95.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text('Next',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          ),
         // CustomButton(title: 'Next', ontapped:()=> Hashtags(),nav: false,)
        ],
      ),
    );
  }

  Widget camera(){
    return Expanded(
      child: InkWell(
        onTap: (){
         cameraImage(context);
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
          child:  Image.asset("Assets/Images/camera.png",),
        ),
      ),
    );
  }

    Widget fileupload(){
    return Expanded(
      child: InkWell(
        onTap: (){
        chooseAndUploadImage(context,);
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
          child:  Image.asset("Assets/Images/fileupload.png",),
        ),
      ),
    );
  }
  Widget imagelist(){
    return Container(
      width: double.infinity,
      height:  20.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
       return Container(
         margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
         height: 10.h,
         width: 50.w,
         color: Colors.red,
       );
      }),
    );
  }
  AppBar topappbar(context){
    return AppBar(
      title: Text('Thumbnail image',
      style: TextStyle(
        color: Color(0xff1A1A1A),
        fontWeight: FontWeight.w700,
        fontSize: 18,
        fontFamily: 'Gilroy'
      ),
      ),
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
  Widget picture(){
  return _filedata==null?Container():  Container(
     decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,

          ),
    margin: EdgeInsets.symmetric(horizontal: 10.w),
                       height: 22.5.h,
                      width: double.infinity,
                       
                       child:_filedata==null?Container():Container(
                         child: Image.file(File(_filedata!.path),fit: BoxFit.cover,))
  //                        CachedNetworkImage(
  //       imageUrl: '$_filedata'  ,
  //       //dp3.filepathprov.toString(),
  //      /// "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
  //       //  width: 9.5.h,
  //       //                 height: 9.5.h,
  //       //                    fit: BoxFit.cover,
  //            imageBuilder: (context, imageProvider) =>Container(
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.circular(5),
  //           color: Colors.grey[600],
  //            boxShadow: [
  //       BoxShadow(
  //         color: Colors.black12,
  //         spreadRadius: 1,
  //         blurRadius: 5,
  //         offset: Offset(2, 2), // changes position of shadow
  //       ),
  //         ],
  //     image: DecorationImage(
  //         image: imageProvider,
  //         fit: BoxFit.cover,
  //        // colorFilter:
  //           //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
  //             ),
  //   ),
  // ),
  //                        // placeholder: (BuildContext, String)=>,  
  //       progressIndicatorBuilder: (context, url, downloadProgress) => 
  //               CircularProgressIndicator(value: downloadProgress.progress,),
  //       errorWidget: (context, url, error) =>Container(
  //        // color: Colors.white,
  //   // margin: EdgeInsets.symmetric(horizontal: 10.w),
  //   //                    height: 22.5.h,
  //   //                   width: double.infinity,
  //       )
  //       //Icon(Icons.error)
  //        // Image.asset("Assets/Images/placeholder-image.png",fit: BoxFit.cover,),
  //    ),
          
                    );
  
}
}
