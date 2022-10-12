import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';




class NotificationList extends ConsumerStatefulWidget {
  final List? name;
  final String? type;
  final Function? tapped;
  const NotificationList({Key? key, this.name, this.tapped, this.type}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationListState();
}

class _NotificationListState extends ConsumerState<NotificationList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 11,
      itemBuilder: (context,index){
       return GestureDetector(
         onTap:(){
       
         } ,
         child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
          // width: 51.w,
          // height: 22.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.white,
            
          ),
           child: Row(
             children: [
               SizedBox(width: 11,),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 20),
                 child: CachedNetworkImage(
                    imageUrl:'',
                    //widget.name![index]['image']==null?'':widget.name![index]['image'],
                    
                  ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                     width: 6.h,
                 // height: 6.h,
                  
                     fit: BoxFit.cover,
                     
                         imageBuilder: (context, imageProvider) =>Container(
                           decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(9),
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                             // colorFilter:
                                //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                  ),
                           ),
                         ),
                      
                    progressIndicatorBuilder: (context, url, downloadProgress) => 
                            CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
                 ),
               ),
               SizedBox(width: 10,),
               Column(crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   // SizedBox(height: 20,),
                   Text('Tested',
                   style: TextStyle(
                           fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                         color: Color(0xff1A1A1A),
                        fontSize: 11.sp
                        ),
                   ),
                    SizedBox(height: 2,),
                    Container(
                      width: 70.w,
                      child: Text('Tested noted! Notifications!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!',
                      style: TextStyle(
                             fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                           color: Color(0xff1A1A1A),
                          fontSize: 10.sp
                          ),
                      ),
                    ),
                 ],
               ),
             ],
           ),
         ),
       );
    });
  }
}