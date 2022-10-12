import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Exports/exports.dart';
import 'package:icollekt/Screens/Profile/Service/ProfileRepositoryService.dart';

class FollowingContainer extends ConsumerStatefulWidget {
    final  id;
  final String? name;
    final String? photo;
  const FollowingContainer( {Key? key,this.id, this.name, this.photo,}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FollowingContainerState();
}

class _FollowingContainerState extends ConsumerState<FollowingContainer> {
  String followstatus="Following";
  bool status=false;
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
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
               onTap:(){
             
               } ,
               child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                // width: 51.w,
                 height: 16.w,
                 
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                                   //  color: Colors.white,
                                    boxShadow: [
                                     BoxShadow(
                                      color: Colors.black12,
                                     spreadRadius: 1,
                                      blurRadius: 5,
                                                 offset: Offset(2, 2), // changes position of shadow
                                                          ),
                                                        ],
                 // borderRadius: BorderRadius.circular(9),
                  color: Colors.white,
                  
                ),
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                        SizedBox(width: 10,),
                         CircleAvatar(
                               radius: 23,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child:
                                 CachedNetworkImage(
                                    imageUrl:widget.photo.toString(),
                                    //widget.name![index]['image']==null?'':widget.name![index]['image'],
                                    
                                  ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                                     width: 8.h,
                                  height: 8.h,
                                     fit: BoxFit.cover,
                                     
                                         imageBuilder: (context, imageProvider) =>CircleAvatar(
                              radius: 33.sp,
                              
                              child:  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                     // colorFilter:
                                        //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                          ),
                                ),
                              ),                 
                              ),
                                      
                                    progressIndicatorBuilder: (context, url, downloadProgress) => 
                                            CircularProgressIndicator(value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
                                 ),
                            
                              ),
                                                ),
                         SizedBox(width: 10,),
                         Text(widget.name.toString(),),
                       ],
                     ),
                     Row(
                       children: [
                         InkWell(
                          onTap: (){
                          setState(() {
                  
                          });
                         
                          if (status) {
                            getfollow();
                             followstatus="Following";
                             status= false;
                          } else {
                            getUnfollow();
                            followstatus="follow";
                            status= true;
                          }
                          },
                           child: Container(
                            margin: EdgeInsets.symmetric(vertical: 13),
                           height: double.infinity,
                           decoration: BoxDecoration(
                             color: Color(0xff591B4C),
                             borderRadius: BorderRadius.circular(7)
                           ),
                            width: 130,
                            child: Center(child: Text('$followstatus',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                             fontFamily: "Gilroy",
                             letterSpacing: .5,
                             fontSize: 10.sp,
                            ),
                            )),
                           ),
                         ),
                          SizedBox(width: 10,),
                       ],
                     )
                   ],
                 ),
               ),
             );
  }
}