import 'package:flutter_svg/svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/Profile/hastageEdit.dart';
import 'package:icollekt/Screens/Profile/usernameEdit.dart';

class About extends StatefulWidget {
  final String ?feature;
  const About({Key? key,this.feature}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
    //Profileimage View
    @override
  void initState() {
     gethastage();
    super.initState();
  }
 var hastag='';
 var name='';
   Future gethastage()async{  
  //  print(  'hi  ${preferences.getString('Name')}');
  final hastagResponse = await  GroupAndChatRepository().gethastagEditResponse();
 // print('${hastagResponse.hashtag}');
    try {
       hastag=hastagResponse.hashtag; 
     name=hastagResponse.username;
    } catch (e) {
      print(e);
    } 
   setState(() {
     
   });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context),
      body: StreamBuilder(
        stream: gethastage().asStream(),
        builder: (context, snapshot) {
          return Column(
            children: [
              SizedBox(height: 5.h,),
             Container(
               margin: EdgeInsets.symmetric(horizontal: 4.w),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                   //  width: 200,
                     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Username',
                         style: TextStyle(
                           fontSize: 12.sp,
                           fontWeight: FontWeight.w600,
                           color: Color(0xff591B4C)
                         ),
                         ),
                          SizedBox(height: 1.h,),
                        Container(
                          width: 40.w,
                          child: Text('$name',
                          overflow: TextOverflow.ellipsis,
                               style: TextStyle(
                                 fontSize: 12.sp,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.black
                               ),
                               ),
                        )
                          
                       ],
                     ),
                   ),
            widget.feature=='feature'?        GestureDetector(
                       onTap: (){
                         
                                           pushNewScreen(
              context,
              screen: EditUsername(),
              withNavBar: false, // featureAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
          ).then((value) => gethastage());
                       },
                       child: Text('Edit',
                           style: TextStyle(
                             fontSize: 12.sp,
                             fontWeight: FontWeight.w400,
                             color: Color(0xff591B4C)
                           ),
                           ),
                     ):Container()
                 ],
               ),
             ),
               SizedBox(height: 2.5.h,),
             Container(
               margin: EdgeInsets.symmetric(horizontal: 4.w),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                   //  width: 200,
                     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('About my collektion',
                         style: TextStyle(
                           fontSize: 12.sp,
                           fontWeight: FontWeight.w600,
                           color: Color(0xff591B4C)
                         ),
                         ),
                          SizedBox(height: 1.h,),
                         Container(
                           width: 70.w,
                           child: Text('$hastag',
                           style: TextStyle(
                             fontSize: 12.sp,
                             fontWeight: FontWeight.w400,
                             color: Colors.black
                           ),
                           ),
                         )
                       ],
                     ),
                   ),
             widget.feature=='feature'?  GestureDetector(
                       onTap: (){
                         
                                           pushNewScreen(
              context,
              screen: EditHastags(),
              withNavBar: false, // featureAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
          ).then((value) => gethastage());
                       },
                       child: Text('Edit',
                           style: TextStyle(
                             fontSize: 12.sp,
                             fontWeight: FontWeight.w400,
                             color: Color(0xff591B4C)
                           ),
                           ),
                     ):Container()
                 ],
               ),
             ),
              SizedBox(height: 3.h,),
             Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Text('Followers',
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                           fontSize: 13.sp,
                           fontWeight: FontWeight.w600,
                           color: Color(0xff591B4C)
                         ),
                 ),
                 Text('Following',
                  style: TextStyle(
                     fontFamily: 'Gilroy',
                           fontSize: 13.sp,
                           fontWeight: FontWeight.w600,
                           color: Color(0xff591B4C)
                         ),
                 )
               ],
             ),
              SizedBox(height: 2.h,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Text('200k',
                 style: TextStyle(
                   fontFamily: 'Gilroy',
                           fontSize: 14.sp,
                           fontWeight: FontWeight.w600,
                           color: Colors.black
                         ),
                 ),
                 Text('500k',
                 style: TextStyle(
                    fontFamily: 'Gilroy',
                           fontSize: 14.sp,
                           fontWeight: FontWeight.w600,
                           color: Colors.black
                         ),
                 )
               ],
             ),
              SizedBox(height: 3.h,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                Image.asset("Assets/Images/insta.png",
                        height: 4.h,
                       ),
                SvgPicture.asset("Assets/Images/twitter.svg",
                        height: 4.h,
                       ),
               ],
             ),
              SizedBox(height: 1.h,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Text('Instagram',
                  style: TextStyle(
                     fontFamily: 'Gilroy',
                           fontSize: 13.sp,
                           fontWeight: FontWeight.w400,
                           color: Color(0xff591B4C)
                         ),
                 ),
                 Text('Twitter',
                  style: TextStyle(
                     fontFamily: 'Gilroy',
                           fontSize: 13.sp,
                           fontWeight: FontWeight.w400,
                           color: Color(0xff591B4C)
                         ),
                 )
               ],
             )
            ],
          );
        }
      ),
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
      title: Text('About',style: TextStyle(
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