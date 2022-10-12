import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/forgotpassword/forgotpasswordotp.dart';
import 'package:icollekt/Services/Provider.dart';

class ForgotUsername extends ConsumerStatefulWidget {

  const ForgotUsername({Key? key}) : super(key: key);

  @override
  _ForgotUsernameState createState() => _ForgotUsernameState();
}

class _ForgotUsernameState extends ConsumerState<ForgotUsername> {
  TextEditingController textEditingController = new TextEditingController();
  validation(){
bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(textEditingController.text.toString());
  if(emailValid==false){
print('invalid');
showToast('Invalid Email ',
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
   onPressedforgotpassword(ref.watch(forgotpasswordprov));
    print('valid');
  }
}
     onPressedforgotpassword(ForgotpasswordData forgotprov) async {
    var forgotpasswordresponse = await AuthRepository().getforgotpasswordresponse
    ( email: '${textEditingController.text}',);
 forgotprov.email=textEditingController.text.toString();
 forgotprov.id=forgotpasswordresponse.id;
 if(forgotpasswordresponse.result==false){
     showToast(forgotpasswordresponse.message,
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
       // Fluttertoast.showToast(msg: forgotpasswordresponse.message);
        return  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ForgotverifyOTP(
            // email: widget.email,
            // id:forgotpasswordresponse.id,
            // number: textEditingController.text,
            // username: widget.name,
          )
        ),
      );
      
      
     }   else if(forgotpasswordresponse.result=true){
        showToast(forgotpasswordresponse.message,
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
        // Fluttertoast.showToast(msg: forgotpasswordresponse.message);
         return ;
     }

  }
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackground,
      appBar: buildAppBar(),
      body: Container(
        child: Column(
          children: [
           // displayInfo(),
           SizedBox(height: 100,),
           textlable(),
            usernameField(),
            image(),
            next(),
             BottomContainer(),
           
          ],
        ),
      ),
    );
  }
  Widget textlable(){
    return Row(
      children: [
        Container(
           margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Text("Type in your email",
          style: fonttexttheme
          
          ),
        ),
      ],
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
        'Forgot Password',
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

  

  Widget usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
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
          hintText: 'Enter Email ',
          border: InputBorder.none,
        ),
      ),
    );
  }

Widget image() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: SvgPicture.asset(
          "Assets/Images/Email logo.svg",
          height: 32.h,
        ),
      ),
    );
  }

  onPressed(ForgotpasswordData forgotprov) {
   // onPressedforgotpassword(ref.watch(forgotpasswordprov));
    if (textEditingController.text.isNotEmpty) {
      validation();
      
    } else {
     // Fluttertoast.showToast(msg: 'Email of Username');
    }
  }

  Widget next() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MaterialButton(
        onPressed: () =>onPressed(ref.watch(forgotpasswordprov)),
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
