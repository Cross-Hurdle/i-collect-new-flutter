


// ignore_for_file: unnecessary_null_comparison

import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/SignUp/DateOfBirth.dart';



class GoogleAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future getCurrentUser() async {
    return  auth.currentUser;
    
  }

  Future signInwithGoogle({required BuildContext context}) async {
    
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    UserCredential authResult = await firebaseAuth.signInWithCredential(credential);
  print('${authResult.user?.photoURL}');
   //print('${authResult.user?.}');
    // print('login12333333');
   if(authResult != null)
    {
       bool _keepLogin = true;
     var socialloginResponse = await AuthRepository().getsocialResponse(name: "${authResult.user?.displayName}",
  email:'${authResult.user?.email}' , providerid:"google.com");
    
               if (socialloginResponse.result == true) {
                   preferences.setString('Name', socialloginResponse.userData.name);
                              preferences.setString(
                              'Email', socialloginResponse.userData.email);
                               preferences.setInt(
                              'Userid', socialloginResponse.userData.id);
                            //  preferences.setBool("Login", false);
                               preferences.setString(
                              'Image','${authResult.user?.photoURL}' );
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
print('login');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
        } else
         if(socialloginResponse.result==false){
           print('login1');
  preferences.setString(
                              'Name', socialloginResponse.userData.name);
                              preferences.setString(
                              'Email', socialloginResponse.userData.email);
                               preferences.setInt(
                              'Userid', socialloginResponse.userData.id);
                             // preferences.setBool("Login", false);
                               preferences.setBool(
                              'login',socialloginResponse.result==false);
                               preferences.setString(
                              'Image','${authResult.user?.photoURL}' );
                               if (_keepLogin) {
        preferences.setBool("Login", true);
      } 
    //print(socialloginResponse.result);
                           Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => DateOfBirth(
      id:socialloginResponse.userData.id,
      username: socialloginResponse.userData.name,
  )),
  (Route<dynamic> route) => false,
);
        }
          print('login12');
    //  Map userDetails = {
    //   "ProviderID": authResult..additionalUserInfo!.providerId,
    //   "UserName": authResult.user!.displayName,
    //   "Email": authResult.user!.email,
    //   "Image": authResult.user!.photoURL,
    // };

      
      // userNameforId = userDetails.email.replaceAll("@gmail.com", "");
      // print(" User Email from Global variable: $userNameforId");
      // DatabaseMethods().addUserInfoToDB(userDetails.uid, userInfoMap).then((value) =>
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())));



    }
else
  print('nothing happends');


    // print( authResult.additionalUserInfo!.providerId);
    // print(googleSignInAuthentication.idToken);
    //   print(authResult.user?.email);
    //   print(userDetails);
 
  
  }

  Future signOut() async {
    auth.signOut();
  }
}
