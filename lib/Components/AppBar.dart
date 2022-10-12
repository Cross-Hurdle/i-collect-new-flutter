
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icollekt/Exports/Exports.dart';

import '../Screens/Notification/Notification.dart';
 appbar(context){
  return AppBar(
      backgroundColor: kBackground,

      centerTitle: true,
      title: Image.asset("Assets/Images/Icollekt.png",
      height: 11.h,
      ),
      actions: [
         IconButton(icon: Icon(Icons.notifications,size: 29,),color: Color(0xff591B4C),onPressed: (){
                pushNewScreen(
          context,
          screen: NotificationScreen() ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
            },),
              SizedBox(width: 5,),
        GestureDetector(
          onTap: (){
                pushNewScreen(
          context,
          screen: Cart() ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
           // Navigator.push(context, MaterialPageRoute(builder: (context) =>Cart())); 
          },
          child: SvgPicture.asset("Assets/Images/shop.svg",
             width: 7.w,
              ),
        ),
        SizedBox(width: 3.w,)
      ],
      elevation: 1,
    );
}