
// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:permission_handler/permission_handler.dart';
class CreateaGroup extends ConsumerStatefulWidget {
  const CreateaGroup({ Key? key }) : super(key: key);

  @override
  _CreateaGroupState createState() => _CreateaGroupState();
}

class _CreateaGroupState extends ConsumerState<CreateaGroup> {
   TextEditingController _searchcontroller= TextEditingController();
   TextEditingController _msgcontroller= TextEditingController();

@override
void initState() { 
 //empty(ref.read(creategroupprov));
 
  super.initState();
  
}
userexist(context) async {
    final  exitResponse = await AuthRepository().getGroupnamealredyexitresponse(username: _searchcontroller.text );
     if(exitResponse.result==true){
       showToast(exitResponse.message,
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
     
       
     }   else if(exitResponse.result==false){
    //     showToast(exitResponse.message,
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
           pushNewScreen(
          context,
          screen: ChatContact() ,
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    //       showToast(exitResponse.message,
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
         return ;
     }
          
      
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }
// Future<void> share() async {
//     await FlutterShare.share(
//         title: 'Example share',
//         text: 'Example share text',
//         linkUrl: 'https://flutter.dev/',
//         chooserTitle: 'Example Chooser Title');
//   }
  //File ? _image;
 Future cameraImage(context,CreateGroupData imageprov)async{
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
        // Fluttertoast.showToast(msg:"No file is chosen",
        //     );
    //      showToast("No file is chosen",
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
      }
       else {
    if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        // String base64Image = base64Encode(imageFile.readAsBytesSync());
        // String fileName = pickedFile.name;
        imageprov.file=imageFile;
     print('${imageprov.file}');
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
            child:imageprov.file==null?Container(): Image.file(
              imageprov.file!,
              fit: BoxFit.fill,
            )
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
                     ///uploadImageToDB(imageFile);
                     imageprov.file=imageFile;
                    // imageprov.filebg=imageFile;
                     imageprov.filepathprov=imageFile;
                    //  imageprov.filepathprovbg=imageFile
                    // imageprov.file==''?0: imageprov.file;
                    print(imageFile);
                    showToast("Profile Picture uploaded successfully",
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
                  
                   // uploadImageToDB();
                     Navigator.pop(context);
                  },
                color: Color(0xff591B4C),
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


 chooseAndUploadImage(context,CreateGroupData grouppicprov) async {
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

      if (filePickerResult == null) {
        // Fluttertoast.showToast(msg:"No file is chosen",
        //     );
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
        File _file = File("${filePickerResult.files.single.path}");
 grouppicprov.filepathprov=File("${filePickerResult.files.single.path}");
        // String base64Image = base64Encode(_file.readAsBytesSync());
 grouppicprov.file=File(filePickerResult.files.single.name);
        // String fileName = filePickerResult.files.single.name;

       //  print('helooooooooooo${filePickerResult.files.single.name}');

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
                  //  grouppicprov.filebg=_file;
                    grouppicprov.file=_file;
                    grouppicprov.filepathprov=_file;
                   // grouppicprov.filepathprovbg=_file;
                      print('helooooooooooo${grouppicprov.file}');
                       print('helooooooooooo11${grouppicprov.filepathprov}');
                       showToast("Profile Picture uploaded successfully",
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
                   //  uploadImageToDB(_file,);
                   // print('123$_file');
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

validate(context,CreateGroupData grouppicprov){
  if( grouppicprov.file==null){
 showToast('Please Upload Profile Image',
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
 else{
   if( grouppicprov.filebg==null){
 showToast('Please Upload background Image',
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
    else{
        
      if(_msgcontroller.text.isNotEmpty){
      //   print('11s${grouppicprov.file}');
      grouppicprov.subject=_searchcontroller.text;
      grouppicprov.message=_msgcontroller.text;
      //    pushNewScreen(
      //     context,
      //     screen: ChatContact() ,
      //     withNavBar: true, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
//uploadImageToDB(grouppicprov.file,ref.watch(creategroupprov));
//Navigator.pop(context);

      }else if (_msgcontroller.text.toString().isEmpty){
  return showToast('Enter message',
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
      else{
        print('object123');
        userexist(context);
      }if(_searchcontroller.text.toString().isEmpty){
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
  }else{
       userexist(context);
      print('object');
  }
       
      
    }
   
//uploadImageToDB(grouppicprov.file,ref.watch(creategroupprov));
  }
  //  if(_searchcontroller.text.toString().isEmpty){
  //    showToast('Enter subject',
  //    textStyle: TextStyle(color: Colors.black),
  //    backgroundColor: Colors.grey[300],
  //                   context: context,
                    
  //                   borderRadius: BorderRadius.circular(10),
  //                   animation: StyledToastAnimation.size,
  //                   reverseAnimation: StyledToastAnimation.size,
  //                   axis: Axis.horizontal,
  //                   position: StyledToastPosition.center,
  //                   animDuration: Duration(milliseconds: 400),
  //                   duration: Duration(seconds: 2),
  //                   curve: Curves.linear,
  //                   reverseCurve: Curves.linear);
  // }
  // else{
     
  //     //     pushNewScreen(
  //     //     context,
  //     //     screen: ChatContact() ,
  //     //     withNavBar: true, // OPTIONAL VALUE. True by default.
  //     //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
  //     // );
  //   }
}
//Background Image
 Future cameraImageforbg(context,CreateGroupData imageprov)async{
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
        // Fluttertoast.showToast(msg:"No file is chosen",
        //     );
    //      showToast("No file is chosen",
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
      }
       else {
    if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        // String base64Image = base64Encode(imageFile.readAsBytesSync());
        // String fileName = pickedFile.name;
        imageprov.filebg=imageFile;
     print('${imageprov.filebg}');
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
            child:imageprov.filebg==null?Container(): Image.file(
              imageprov.filebg!,
              fit: BoxFit.fill,
            )
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
                     ///uploadImageToDB(imageFile);
                     imageprov.filebg=imageFile;
                    // imageprov.file==''?0: imageprov.file;
                    print(imageFile);
                    showToast("Background Image uploaded successfully",
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
    //                 showToast("uploaded successfully",
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
                     Navigator.pop(context);
                  },
                color: Color(0xff591B4C),
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


 chooseAndUploadImageforbg(context,CreateGroupData grouppicprov) async {
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

      if (filePickerResult == null) {
        // Fluttertoast.showToast(msg:"No file is chosen",
        //     );
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
        File _file = File("${filePickerResult.files.single.path}");
 //grouppicprov.filepathprovbg=File("${filePickerResult.files.single.path}");
        // String base64Image = base64Encode(_file.readAsBytesSync());
 //grouppicprov.filebg=File(filePickerResult.files.single.name);
        // String fileName = filePickerResult.files.single.name;

       //  print('helooooooooooo${filePickerResult.files.single.name}');

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
                    grouppicprov.filebg=_file;
                     showToast("Background Image uploaded successfully",
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
                      print('helooooooooooo${grouppicprov.file}');
                       print('helooooooooooo11${grouppicprov.filepathprov}');
                   //  uploadImageToDB(_file,);
                   // print('123$_file');
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
  @override
  
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: topappbar(context),
      backgroundColor: Color(0xffF9F2FF),
     body: CustomScrollView(
        physics:  BouncingScrollPhysics(),
        slivers: 
          [
            SliverList(delegate: SliverChildListDelegate(
              [
           SizedBox(height: 60,),
          //  invite(context,ref.watch(contactProv)),
            textField(),
             // CustomButton(title: 'Next', ontapped:()=> ForSale(),nav: false,),
             
          //  Padding(
          //           padding: const EdgeInsets.only(top:10,left: 25),
          //           child: Row(
          //             children: [
          //             Text('Upload or take picture',
          //     style: TextStyle(
          //       color: Color(0xff1A1A1A),
          //       fontWeight: FontWeight.w600,
          //       fontSize: 15.sp,
          //       fontFamily: 'Gilroy'
          //     ),
          //     ),
          //             ],
          //           ),
          //         ),
                  Padding(
                    padding: const EdgeInsets.only(top:10,left: 25),
                    child: Row(
                      children: [
                      Text('Upload Profile Picture',
              style: TextStyle(
                color: Color(0xff1A1A1A),
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                fontFamily: 'Gilroy'
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
                       camera(context,'dp'),
                       fileupload(context,'dp')
                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                     Padding(
                    padding: const EdgeInsets.only(top:10,left: 25),
                    child: Row(
                      children: [
                      Text('Upload Background Picture',
              style: TextStyle(
                color: Color(0xff1A1A1A),
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                fontFamily: 'Gilroy'
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
                       camera(context,'bg'),
                       fileupload(context,'bg')
                      ],
                    ),
                  ),
                  textmsgField(),
                 //  picture(context,ref.watch(creategroupprov)),
            button(context,ref.watch(creategroupprov))
         ]
            )
            ),
          
            //  SliverList(delegate: SliverChildListDelegate(
            //   [
            //      profiletop(),
            //   ]
            // )
            // ),
         
         
        ],
      ),
     
    
    );
    
  }
Widget picture(context,CreateGroupData imageprov){
  return   Container(
     decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,

          ),
    margin: EdgeInsets.symmetric(horizontal: 10.w),
                       height: 22.5.h,
                      width: double.infinity,
                       
                       child: Image.file(
              imageprov.filepathprov!,
              fit: BoxFit.fill,
            ),
  //                       CachedNetworkImage(
  //       imageUrl:  imageprov.file.toString(),

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
Widget button(context ,CreateGroupData grouppicprov){
  return 
  InkWell(
             onTap: (){
               validate(context,ref.watch(creategroupprov));
                
                //uploadImageToDB(grouppicprov.camera);
               
              //  uploadImageToDB(_file,);
              
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:90.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text( 'Add Members',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          );
   //CustomButton(title: 'Create Group', ontapped:()=> CollectionGroupPage(),nav: true,);
}
   Widget camera(context,String photo){
    return Expanded(
      child: InkWell(
        onTap: (){
          if(photo=='dp'){
           cameraImage(context,ref.watch(creategroupprov));
          }else{
            cameraImageforbg(context, ref.watch(creategroupprov));
          }

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

    Widget fileupload(context, String photo){
    return Expanded(
      child: InkWell(
        onTap: (){
          if(photo=='dp'){
            chooseAndUploadImage(context,ref.watch(creategroupprov));
          }else{
           chooseAndUploadImageforbg(context, ref.watch(creategroupprov));
          }

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

  invite(context,ContactData prov){
    return   InkWell(
             onTap: (){
               prov.selected.clear();
      //           pushNewScreen(
      //     context,
      //     screen: ChatContact() ,
      //     withNavBar: true, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
    ///  share();
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:90.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xffFFFFFF)
              ),
              child: Center(child: Text('Invite',
              style: TextStyle(
                color: Color(0xff343339),
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          );
  }

Widget textField(){
   
    return Container(
       margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        // width: 51.w,
         height: 14.w,
        decoration: BoxDecoration(
         // borderRadius: BorderRadius.circular(9),
          color: Color(0xffFAF7F7),
          
        ),
      child: TextField(
        controller: _searchcontroller,
        decoration: InputDecoration(
          
          border: InputBorder.none,
          hintText: 'Type Group subject here...',
          hintStyle: TextStyle(
            color: Color(0xffCCCCCC),
            fontSize: 14.sp
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 18),
        //  suffixIcon:  Image.asset("Assets/Images/searchright.png",
       // ),
      )),
    );
  }

 AppBar topappbar(context){
    return AppBar(
      title: Text('Create a Group',
      style: TextStyle(
        color: Color(0xff1A1A1A),
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
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

  Widget textmsgField(){
    
    return Container(
       margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        // width: 51.w,
         height: 14.w,
        decoration: BoxDecoration(
         // borderRadius: BorderRadius.circular(9),
          color: Color(0xffFAF7F7),
          
        ),
      child: TextField(
        controller:_msgcontroller,
        decoration: InputDecoration(
          
          border: InputBorder.none,
          hintText: 'Message',
          hintStyle: TextStyle(
            color: Color(0xffCCCCCC),
            fontSize: 14.sp
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 18),
        //  suffixIcon:  Image.asset("Assets/Images/searchright.png",
       // ),
      )),
    );
  }
}