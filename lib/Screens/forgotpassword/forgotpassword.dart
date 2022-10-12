import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';

class ForgotPassword extends ConsumerStatefulWidget {

 
  const ForgotPassword({Key? key, }) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  
  TextEditingController textEditingController = new TextEditingController();
  validation(){
 bool emailValid = RegExp
        (r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch( textEditingController.text);
  if(emailValid==false){
print('invalid');
showToast('Invalid Password',
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
   signotp(ref.watch(forgotpasswordprov));
    print('valid');
  }
}

signotp(ForgotpasswordData passwordprovid) async {
    final  signupResponse = await AuthRepository().getconfirmpassword(password:  textEditingController.text,id:passwordprovid.id );
     if(signupResponse.result==false){
       showToast(signupResponse.message,
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
       // Fluttertoast.showToast(msg: signupResponse.message);

        return  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainRoute()
        ),
      );
     }   else if(signupResponse.result==true){
       showToast(signupResponse.message,
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
        // Fluttertoast.showToast(msg: signupResponse.message);
         return ;
     }
          
      
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackground,
      appBar: buildAppBar(),
      body: Container(
        child: Column(
          children: [
          //  displayInfo(),
          SizedBox(height: 20,),
          displayInfo(),
           SizedBox(height: 20,),
           textlable(),
            passwordField(),
           // forgotpassword(),
            image(),
            next(),
            BottomContainer()
          ],
        ),
      ),
    );
  }
 Widget displayInfo() {
    return Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: kBackground,
        boxShadow: [
          BoxShadow(
            color: kShadow,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            child: Text(
              "Choose your New password",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(
              "How will you gaurd your treasure? 8 characters, one symbol  or number included",
              style: TextStyle(fontSize: 10.sp, letterSpacing: 1.5),
            ),
          ),
        ],
      ),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kBackground,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.keyboard_arrow_left,
          size: 30.sp,
          color: kBlack,
        ),
      ),
      centerTitle: true,
      title: Text(
        'New Password',
        style: TextStyle(
          color: kBlack,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      elevation: 0,
    );
  }



  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: .5),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            letterSpacing: .5,
          ),
          hintText: 'New Password',
          border: InputBorder.none,
        ),
      ),
    );
  }
 Widget textlable(){
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: Text("reset your  password",
          style: TextStyle(
                fontSize: 12.5.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
          
          ),
        ),
      ],
    );
  }
 Widget forgotpassword(){
    return Row(
      children: [
        Container(
           margin: const EdgeInsets.symmetric(horizontal: 15),
          child: TextButton(
            onPressed: (){
                Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForgotUsername(),
          ),
        );
            },
            child: Text("I forgot my password",
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Color(0xff786900)
            )
            
            ),
          ),
        ),
      ],
    );
  }
 Widget image() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: SvgPicture.asset(
          "Assets/Images/Password logo.svg",
          height: 32.h,
       //   height: 25.h,
        ),
      ),
    );
  }


  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  onPressed() {
   // signotp();
    if (textEditingController.text.isNotEmpty) {
      if (textEditingController.text.length >= 8){
        validation();
      }
       
      else{
  showToast('Must be 8 or more characters',
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
    
      //  Fluttertoast.showToast(msg: 'Must be 8 or more characters');
    } else {
      showToast('Enter New Password',
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
      //Fluttertoast.showToast(msg: 'Enter Password');
    }
  
  }

  Widget next() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MaterialButton(
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            'Continue',
            style: TextStyle(
              color: kBackground,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
            ),
          ),
        ),
        minWidth: 100.w,
        elevation: 5,
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
        ),
      ),
    );
  }
}
