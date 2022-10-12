import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';

class OtherAboutGroup extends ConsumerStatefulWidget {
  const OtherAboutGroup({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtherAboutGroupState();
}

class _OtherAboutGroupState extends ConsumerState<OtherAboutGroup> {

  @override
  Widget build(BuildContext context) {
   final groupdata= ref.watch(viewgroupprov);
    return Scaffold(
      appBar: buildappbar(context) ,
      body: Column(
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
                     Text('Subject',
                     style: TextStyle(
                       fontSize: 12.sp,
                       fontWeight: FontWeight.w600,
                       color: Color(0xff591B4C)
                     ),
                     ),
                      SizedBox(height: 1.h,),
                     Container(
                       width: 70.w,
                       child: Text('${groupdata.groupname}',
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
               
                //  Text('Edit',
                //      style: TextStyle(
                //        fontSize: 12.sp,
                //        fontWeight: FontWeight.w400,
                //        color: Color(0xff591B4C)
                //      ),
                //      ),
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
                     Text('Message',
                     style: TextStyle(
                       fontSize: 12.sp,
                       fontWeight: FontWeight.w600,
                       color: Color(0xff591B4C)
                     ),
                     ),
                      SizedBox(height: 1.h,),
                     Container(
                       width: 70.w,
                       child: Text('${groupdata.groupmessage}',
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
                     Text('Members',
                     style: TextStyle(
                       fontSize: 12.sp,
                       fontWeight: FontWeight.w600,
                       color: Color(0xff591B4C)
                     ),
                     ),
                      SizedBox(height: 1.h,),
                  groupdata.count==null? Text('0',
                     style: TextStyle(
                       fontSize: 12.sp,
                       fontWeight: FontWeight.w400,
                       color: Colors.black
                     ),
                     ):  Text('${groupdata.count}',
                     style: TextStyle(
                       fontSize: 12.sp,
                       fontWeight: FontWeight.w400,
                       color: Colors.black
                     ),
                     )
                   ],
                 ),
               ),
                //  Text('Edit',
                //      style: TextStyle(
                //        fontSize: 12.sp,
                //        fontWeight: FontWeight.w400,
                //        color: Color(0xff591B4C)
                //      ),
                //      ),
             ],
           ),
         ),
          SizedBox(height: 3.h,),
        ],
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