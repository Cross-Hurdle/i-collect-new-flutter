import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Exports/Exports.dart';
import 'Notificationcard.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context),
       backgroundColor: Color(0xffF9F2FF),
      body: Column(
        children: [
           Row(
                  children: [
                 
                      Padding(
                           padding:  EdgeInsets.only(top:3.h,left: 5.w,bottom: 3.h),
                        child: Row(
                          children: [
                             Text("Notifications",
                             style: TextStyle(
                               fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                             color: Color(0xff1A1A1A),
                            fontSize: 17.sp
                            ),
                          ),
                        ],
                     ),
                  )                           
                  ],
                ),
          Expanded(
            child: SingleChildScrollView(child: Column(
              children: [
                NotificationList(),
              ],
            )),
          ),
        ],
      ),
    );
  }
   buildappbar(context){
    return AppBar(
      backgroundColor: kBackground,
       elevation: 1,
        leading: GestureDetector(
        onTap: (){
        Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      centerTitle: true,
      title: Image.asset("Assets/Images/Icollekt.png",
      height: 11.h,
      ),
      actions: [
      //     IconButton(icon: Icon(Icons.notifications,size: 29,),color: Color(0xff591B4C),onPressed: (){
      //           pushNewScreen(
      //     context,
      //     screen: NotificationScreen() ,
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
      //       },),
      //         SizedBox(width: 5,),
      //   GestureDetector(
      //     onTap: (){
      //        pushNewScreen(
      //     context,
      //     screen: Cart() ,
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
      //     },
      //     child: SvgPicture.asset("Assets/Images/shop.svg",
      //        width: 7.w,
      //         ),
      //   ),
      //   SizedBox(width: 3.w,)
      ],
    
    );
  }
}