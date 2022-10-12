import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';

class EditMessage extends ConsumerStatefulWidget {
  const EditMessage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditMessageState();
}

class _EditMessageState extends ConsumerState<EditMessage> {
TextEditingController _searchcontroller= TextEditingController();
editmessage() async {
    final  messageResponse = await GroupAndChatRepository().getgroupnameEditResponse(id:ref.watch(viewgroupprov).groupid!.toInt() ,message:_searchcontroller.text );
     if(messageResponse.status=="sucess"){
       
        showToast(messageResponse.message,
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
      //  Fluttertoast.showToast(msg: signupResponse.message);
    Navigator.pop(context);


       
     }   else if(messageResponse.status!="sucess"){
          showToast(messageResponse.message,
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
   }
    validation(){
     if (_searchcontroller.text.isNotEmpty) {
      editmessage();
    
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
   final namedata= ref.watch(viewgroupprov);
    _searchcontroller.text=namedata.groupmessage.toString();
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
          hintText: 'Enter Message',
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