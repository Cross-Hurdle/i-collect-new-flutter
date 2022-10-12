import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import '../../Profile/Followers/Followers.dart';
import '../../Profile/Followig/Following.dart';
import '../../Profile/Service/ProfileRepositoryService.dart';

class OtherfollowerFollowing extends ConsumerStatefulWidget {
  final id;
  final followcount;
  final followingcount;
  final postcount;
  final status;
  final  statusbool;
  const OtherfollowerFollowing( {Key? key,
  required this.statusbool,
  this.id,
  this.followcount,
   this.followingcount,
   this.postcount,
   this.status}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtherfollowerFollowingState();
}

class _OtherfollowerFollowingState extends ConsumerState<OtherfollowerFollowing> {

  @override
  void initState() { 
    print('Follow Status:${widget.status}');
     if (widget.status==0) {
    status=true;
    //  status=true;
        followstatus="Follow";
    } else {
       status=false;
        followstatus="Unfollow";
       // status=false;
    }
    
    super.initState();
   // getcount()
  }
  //  print(widget.status);
   String? followstatus;
  //   bool status;
  
 Future getfollow()async{  
final followresponse = await ProfileRepository().getfollowResponse(widget.id);
 print(followresponse['message']);
    
setState(() {
  
});
}
 Future getUnfollow()async{  
final unfollowresponse = await ProfileRepository().getunfollowResponse(widget.id);
 print('123  ${unfollowresponse['message']}');
    
setState(() {
  
});
}
  bool status=false;
  @override
  Widget build(BuildContext context) {
  
 

    return Column(
      children: [
        
          Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Column(
               children: [
                  Text("${widget.postcount}",
             style: TextStyle(
                   color: Color(0xff1A1A1A),
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    fontFamily: 'Gilroy'
             ),
             ),
                 Text('Post',
                 style: TextStyle(
                 //  decoration: TextDecoration.underline,
                   color: Color(0xff1A1A1A),
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    fontFamily: 'Gilroy'
                 ),
                 ),
               ],
             ),
              SizedBox(width: 19,),
              GestureDetector(
                onTap: (){
                    pushNewScreen(
          context,
          screen: Following(id:widget.id,) ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
                },
                 child: Column(
                   children: [
                      Text(
                        //'0',
                        '${widget.followcount}',
             style: TextStyle(
                      color: Color(0xff1A1A1A),
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      fontFamily: 'Gilroy'
             ),
             ),
                     Text('Followers',
             style: TextStyle(
                     color: Color(0xff1A1A1A),
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      fontFamily: 'Gilroy'
             ),
             ),
                   ],
                 ),
               ),
             SizedBox(width: 19,),
               GestureDetector(
                onTap: (){
  pushNewScreen(
          context,
          screen: Followers(id:widget.id ,) ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
                },
                 child: Column(
                   children: [
                      Text(
                        //'0',
                      '${widget.followingcount}',
             style: TextStyle(
                     color: Color(0xff1A1A1A),
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      fontFamily: 'Gilroy'
             ),
             ),
                     Text('Following',
             style: TextStyle(
                    color: Color(0xff1A1A1A),
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      fontFamily: 'Gilroy'
             ),
             ),
                   ],
                 ),
               )
           ],
         ),
         SizedBox(height: 3.h,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
             onTap: (){
                pushNewScreen(
          context,
          screen: About() ,
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:40.w,
             // height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Padding(
                padding:  EdgeInsets.all(12.0),
                child: Center(child: Text('About',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Gilroy",
                  fontSize: 16
                ),
                )),
              ),
            ),
          ),
          InkWell(
             onTap: (){
               setState(() {
                  
                          });
                           if (!status) {
    status=true;
     getUnfollow();
    //  status=true;
        followstatus="Follow";
    } else {
       status=false;
       getfollow();
        followstatus="Unfollow";
       // status=false;
    }
                          // if (!widget.statusbool) {
                          //   getUnfollow();
                          //    followstatus="follow";
                          //    status= false;
                          // } else {
                          //   getfollow();
                          //   followstatus="Unfollow";
                          //   status= true;
                          // }
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
              width:40.w,
             // height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Padding(
                padding:  EdgeInsets.all(12.0),
                child: Center(child: Text(followstatus??'',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Gilroy",
                  fontSize: 16
                ),
                )),
              ),
            ),
          ),
        // CustomButton1(title: 'About', ontapped: ()=>About(), nav: false),
        //  CustomButton1(title: 'Follow', ontapped: ()=>Sample(), nav: false),
          ],
        ),
      ],
    );
  }
}