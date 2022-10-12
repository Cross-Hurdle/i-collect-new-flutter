import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

class EditUsername extends ConsumerStatefulWidget {
  const EditUsername({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditUsernameState();
}

class _EditUsernameState extends ConsumerState<EditUsername> {
TextEditingController _searchcontroller= TextEditingController();

editUsername() async {
    final  messageResponse = await GroupAndChatRepository().getEditprofileNameResponse(name:_searchcontroller.text );
     preferences.setString('Name',messageResponse['name']);
     if(messageResponse['result']==true){
        preferences.setString('Name',messageResponse['name']);
       if(mounted){
          showToast(messageResponse['message'],
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
      //  Fluttertoast.showToast(msg: signupResponse.message);



       
     }   else if(messageResponse['result']==false){
          showToast(messageResponse['message'],
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
         return ;
     }
          
    if(mounted){
       setState(() {
       
     });
    } 
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }
   userexist(context) async {
    final  exitResponse = await AuthRepository(). getalredyexitresponse(username: _searchcontroller.text );
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
       editUsername();
    //     showToast('Group Subject Updated Successfully',
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
       Navigator.pop(context);
      //      pushNewScreen(
      //     context,
      //     screen: ChatContact() ,
      //     withNavBar: true, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );

         return ;
     }

   }
   validation(){
     if (_searchcontroller.text.isNotEmpty) {
       userexist(context);
     } else {
       showToast('Enter Subject',
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
    return Scaffold(
      appBar:buildappbar(context),
       backgroundColor: Color(0xffF9F2FF),
      body:Column(
        children: [
          Container(
            child: Expanded(
              child: Column(
                children: [
                  textField()
                ],
              ),
            ),
          ),
         InkWell(
             onTap: (){
                validation();
      //           pushNewScreen(
      //     context,
      //     screen: ontapped() ,
      //     withNavBar: nav, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
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
              child: Center(child: Text( 'Save Changes',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          )
        ],
      ),
    );
  }
  Widget textField(){
   // final namedata= ref.watch(viewgroupprov);
    _searchcontroller.text='${preferences.getString('Name')}';
   // TextEditingController _searchcontroller= TextEditingController();
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
        //  onChanged: (text) {
        //       text = text.toLowerCase();
        //       filter(text);

        //     },
        decoration: InputDecoration(
          
          border: InputBorder.none,
          hintText: 'Enter Subject',
          hintStyle: TextStyle(
            color: Color(0xffCCCCCC),
            fontSize: 14.sp
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 18),
          //suffixIcon:  Image.asset("Assets/Images/searchright.png",
       // ),
      )),
    );
  }
  AppBar buildappbar(context){
    return AppBar(
      backgroundColor: kBackground,
        leading: GestureDetector(
        onTap: (){
         Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      centerTitle: true,
      title: Text('Edit Details',style: TextStyle(
        color: Color(0xff1A1A1A),
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w700
      ),),
      actions: [
        
      ],
      elevation: 1,
    );
  }
}