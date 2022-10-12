import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/SignUp/DateOfBirth.dart';

class FBAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future getCurrentUser() async {
    return  auth.currentUser;
    
  }

  Future signInwithfacebook({required BuildContext context}) async {




    final facebookLogin = FacebookLogin();
    final facebookLoginResult = await facebookLogin.logIn(customPermissions: ['public_profile','email']);

    /*print(facebookLoginResult.accessToken);
    print(facebookLoginResult.accessToken.token);
    print(facebookLoginResult.accessToken.expires);
    print(facebookLoginResult.accessToken.permissions);
    print(facebookLoginResult.accessToken.userId);
    print(facebookLoginResult.accessToken.isValid());

    print(facebookLoginResult.errorMessage);
    print(facebookLoginResult.status);*/

    final token = facebookLoginResult.accessToken!.token;

    /// for profile details also use the below code
    final graphResponse = await http.get(
        Uri.parse('https://graph.facebook.com/v3.3/me?fields=name,picture,friends,email&access_token=$token'));
    final profile = json.decode(graphResponse.body);
  // print(facebookLoginResult.accessToken!.token.);
      print(profile['email']);
     print(profile['name']);
    print(facebookLoginResult.accessToken!.userId);
//     if(facebookLoginResult.status == FacebookLoginStatus.success){
// showToast('${facebookLoginResult.status}',
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
//     }else{
//       showToast('${facebookLoginResult.status}',
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
//     }
    print(facebookLoginResult);
    print(graphResponse.body);
    //print(facebook);
    // print(graphResponse.body);
    print(profile['name'],);
  //  print(profile['public_profile']);
 var email='';
        var value;
         if(profile['email'] == null){
           value =profile['name'].split(' ').first;
            //value.split(' ').first;
            email = '$value@gmail.com';
         }else 
           email =profile['email'];
        //  setState(() {
           
        //  })
      var socialloginResponse = await AuthRepository().getsocialResponse(name: profile['name'],
  //email:'jagadishkarthikeyan619@gmail.com',
  email:email,
  //profile['email'],
  providerid:"facebook.com");
  
    print(socialloginResponse.result);
     bool _keepLogin = true;
  if (socialloginResponse.result == true) {
                   preferences.setString('Name', socialloginResponse.userData.name);
                            preferences.setString(
                              'Email', socialloginResponse.userData.email);
                              preferences.setInt(
                              'Userid', socialloginResponse.userData.id);
                              //  preferences.setBool(
                              // 'login',socialloginResponse.result==false);
                                                    if (_keepLogin) {
        preferences.setBool("Login", true);
      }     
                  Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) =>  MainPage(
      id:socialloginResponse.userData.id,
  )),
  (Route<dynamic> route) => false,
);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
        } else
         if(socialloginResponse.result==false){
      preferences.setString(
                              'Email', socialloginResponse.userData.email);
  preferences.setString(
                              'Name', socialloginResponse.userData.name);
                               preferences.setInt(
                              'Userid', socialloginResponse.userData.id);
                              // preferences.setBool("Login", false);
                                                             if (_keepLogin) {
        preferences.setBool("Login", true);
      } 
    //print(socialloginResponse.result);
                           Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => DateOfBirth(
      id:socialloginResponse.userData.id,
  )),
  (Route<dynamic> route) => false,
);
        }
    


 }
  
  Future signOut() async {
    auth.signOut();
  }

}

// onPressedFacebookLogin() async {
//     final facebookLogin = FacebookLogin();
//     final facebookLoginResult = await facebookLogin.logIn(['email']);

//     /*print(facebookLoginResult.accessToken);
//     print(facebookLoginResult.accessToken.token);
//     print(facebookLoginResult.accessToken.expires);
//     print(facebookLoginResult.accessToken.permissions);
//     print(facebookLoginResult.accessToken.userId);
//     print(facebookLoginResult.accessToken.isValid());

//     print(facebookLoginResult.errorMessage);
//     print(facebookLoginResult.status);*/

//     final token = facebookLoginResult.accessToken.token;

//     /// for profile details also use the below code
//     final graphResponse = await http.get(
//         Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token'));
//     final profile = json.decode(graphResponse.body);
//     //print(profile);
//     /*from profile you will get the below params
//     {
//      "name": "Iiro Krankka",
//      "first_name": "Iiro",
//      "last_name": "Krankka",
//      "email": "iiro.krankka\u0040gmail.com",
//      "id": "<user id here>"
//     }*/

//     // var loginResponse = await AuthRepository().getSocialLoginResponse(
//     //     profile['name'], profile['email'], profile['id'].toString());

//     // if (loginResponse.result == false) {
//     //   ToastComponent.showDialog(loginResponse.message, context,
//     //       gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
//     // } else {
//     //   ToastComponent.showDialog(loginResponse.message, context,
//     //       gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
//     //   AuthHelper().setUserData(loginResponse);
//     //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//     //     return Main();
//     //   }));
//     // }
//   }