
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/profilebg_modle.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class SignUpBackgroundImage extends ConsumerStatefulWidget{
 final int id;
  SignUpBackgroundImage({Key? key,required this.id}) : super(key: key);

  @override
  _SignUpBackgroundImageState createState() => _SignUpBackgroundImageState();
}

class _SignUpBackgroundImageState extends ConsumerState<SignUpBackgroundImage> {
 

 
 var next1 ='skip';
//  Future pickImage()async{
 
//    final image= ImagePicker().pickImage(source: ImageSource.gallery);
//    if (image == null)return;

//   // final imageTemporary = File(image.p);
//  }


 Future cameraImage(context,CreatebackgroungData dpprovider)async{
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


        dpprovider.profilebg=File(pickedFile.path);

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
                     uploadImageToDB(imageFile,ref.watch(profilebgprov));
                   //  uploadImageToDB(imageFile);
                    print(dpprovider.filepathprov);
                     
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

chooseAndUploadImage(context,CreatebackgroungData dpprovider) async {
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

   dpprovider.profilebg=_file;

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
                    uploadImageToDB(_file,ref.watch(profilebgprov));
                    print(_file);

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

//API Call
uploadImageToDB(filepath,CreatebackgroungData imagetodb) async {

       String filename= basename(filepath.path);
      try{
      var formData = FormData.fromMap({
  'banner': [
    await MultipartFile.fromFile(filepath.path, filename: filename),
  //  await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
  ]
});  
  final response = await Dio().post("http://3.218.216.93:3001/api/profile/banner-update/${widget.id}",
 data: formData);

    if(response.statusCode == 200 ){
   
     next1 ='Next';
    ProfilebgModel dp;
      dp=ProfilebgModel.fromJson( response.data);
    
      imagetodb.filepathprov=dp.bannerImgUrl;
        print('response data11 ${imagetodb.filepathprov}');
      print('response data ${dp.bannerImgUrl}');
       print('successfully uploaded');
    }else{ 
       next1 ='skip';
      print('could not be uploaded');
    }
      }catch(e){

      }
 
if(mounted){
 setState(() {});
}
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 20),
                   title(),
                    SizedBox(height: 40,),
                      Container(
                      //  height: double.infinity,
                        // margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           camera(context),
                           fileupload(context)
                          ],
                        ),
                      ),
                       SizedBox(height: 12.h,),
                       picture(ref.watch(profilebgprov))
                  // camera(),
                  // image(),
                 
                ],
              ),
            ),
          ),
           next(context),
        ],
      ),
    );
  }
Widget picture(CreatebackgroungData dp3){
  return   Container(
     decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,

          ),
    margin: EdgeInsets.symmetric(horizontal: 10.w),
                       height: 22.5.h,
                      width: double.infinity,
                       
                       child:  CachedNetworkImage(
        imageUrl:   dp3.filepathprov.toString(),
       /// "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
        //  width: 9.5.h,
        //                 height: 9.5.h,
        //                    fit: BoxFit.cover,
             imageBuilder: (context, imageProvider) =>Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
            color: Colors.grey[600],
             boxShadow: [
        BoxShadow(
          color: Colors.black12,
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(2, 2), // changes position of shadow
        ),
          ],
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
                CircularProgressIndicator(value: downloadProgress.progress,),
        errorWidget: (context, url, error) =>Container(
         // color: Colors.white,
    // margin: EdgeInsets.symmetric(horizontal: 10.w),
    //                    height: 22.5.h,
    //                   width: double.infinity,
        )
        //Icon(Icons.error)
         // Image.asset("Assets/Images/placeholder-image.png",fit: BoxFit.cover,),
     ),
          
                    );
  
}
   title() {
    return Text(
        'Upload or take your background image here',
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
        ),
      );
  }
Widget camera(context){
    return Expanded(
      child: InkWell(
        onTap: (){
          // _getFromCamera();
         cameraImage(context,ref.watch(profilebgprov));
// cameraImage();
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
    Widget fileupload(context){
    return Expanded(
      child: InkWell(
        onTap: (){
         // chooseAndUploadImage(context);
        //  pickImage();
         chooseAndUploadImage(context,ref.watch(profilebgprov));
         setState(() {
           
         });
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

  Widget image() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          "Assets/Images/IcollecktAvatar.png",
          height: 25.h,
        ),
      ),
    );
  }

 

  Widget next(context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) =>
  MainPage(
       id: widget.id,
      )
  ),
  (Route<dynamic> route) => false,
),
    //         Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) =>MainPage(
    //    id: widget.id,
    //   )
    //   //ProfileEdit(show_back_button: false,)
    // // SignUpBackgroundImage()
    //   // ProfileEdit(
    //   //   show_back_button: true,
    //   // )
    //   ),
   
    // ),
            child: Text(
            '$next1',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
              ),
            ),
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
  }


