import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/Signup_modle.dart';
import 'package:icollekt/Services/Provider.dart';

class SignUpEmail extends ConsumerStatefulWidget {
  const SignUpEmail({Key? key}) : super(key: key);

  @override
  _SignUpEmailState createState() => _SignUpEmailState();
}

class _SignUpEmailState extends ConsumerState<SignUpEmail> {
  TextEditingController textEditingController = new TextEditingController();
  validation() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(textEditingController.text.toString());
    if (emailValid == false) {
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
    } else {
      signup(ref.watch(signupprov));
      print('valid');
    }
  }

  bool _keepLogin = true;
  signup(SignupData signupprovider) async {
    SignupModel signup1;
    var signupResponse = await AuthRepository().getsignupResponse(
      name: signupprovider.username.toString(),
      password: signupprovider.password.toString(),
      email: textEditingController.text,
      // signupprovider.email.toString(),
      phone: signupprovider.phone,
      sendby: "email",
    );

    if (signupResponse["result"] == false) {
      signup1 = SignupModel.fromJson(signupResponse);
      // signupprovider.id=signup.userData.id;
      // ref.read(signupdataprov).email=signup1.userData.email;
      //  ref.read(signupdataprov).id=signup1.userData.id;
      //   ref.read(signupdataprov).name=signup1.userData.name;
      //    ref.read(signupdataprov)..status=true;
       print(signup1.userData.id);
      
      preferences.setString('Name', signup1.userData.name);
      preferences.setString('Email', signup1.userData.email);
      // preferences.setBool(
      //                     'login',signup1.result==false);
      preferences.setInt('Userid', signup1.userData.id);

      if (_keepLogin) {
        preferences.setBool("Login", true);
      }

      showToast(signup1.message,
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

      //      print(signupprovider.email);
      // print(signupprovider.username);
      //  print(signupprovider.id);
      //   print(signupprovider.password);
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpPOTP(
            // code: signup().signupResponse.userData.verificationCode,
            id: signup1.userData.id,
          ),
        ),
      );
    } else {
      print(2);
      showToast(signupResponse['message'],
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
      //Fluttertoast.showToast(msg: signupResponse.message);
      return;
    }
  }
 bool status = false;
  uivalidation(String value){
    if ( value.isEmpty) {
      status =false;
    } else {
      status =true;
    }
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackground,
      appBar: buildAppBar(),
      body: Column(
        children: [
          displayInfo(),
          emailField(),
          status==true? next():Container(),
            image(),
           status==false? next():Container(),
          //  textEditingController.text.isEmpty?  next():Container(),
          BottomContainer()
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
        'Get Started',
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(
              'Step 4 of 7',
              style: TextStyle(
                color: kGoldText,
                fontSize: 16.sp,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "What's your email?",
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
              "We will use this to send you receipts for collectables you purchase or sell",
              style: TextStyle(fontSize: 10.sp, letterSpacing: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget emailField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: .5),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: TextField(
         onChanged: (value){
          uivalidation(value);
        },
        controller: textEditingController,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            letterSpacing: .5,
          ),
          hintText: 'Email',
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

  onPressed(SignupData signupprovider) {
    if (textEditingController.text.isNotEmpty) {
      validation();
    } else {
      showToast('Enter Email',
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

      // Fluttertoast.showToast(msg: 'Enter Email',gravity: ToastGravity.CENTER);
    }
  }

  Widget next() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MaterialButton(
        onPressed: () => onPressed(ref.watch(signupprov)),
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
