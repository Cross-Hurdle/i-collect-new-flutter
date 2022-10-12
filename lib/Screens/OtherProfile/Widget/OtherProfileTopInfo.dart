
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

import 'package:icollekt/Services/Provider.dart';

class OtherProfileTopInfo extends ConsumerStatefulWidget {
  const OtherProfileTopInfo({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtherProfileTopInfoState();
}

class _OtherProfileTopInfoState extends ConsumerState<OtherProfileTopInfo> {
     var homedata='' ;
 var pic='';
 @override
 void initState() { 
   super.initState();
   getprofilepic();
 }
    getprofilepic()async{  
  final productResponse = await AuthRepository().getprofile(
    id: ref.read(otherprofile).id
  );
  
    try {
       homedata=productResponse.profilePic; 
      pic=productResponse.bannerImg;
    } catch (e) {
      print(e);
    } 
  if (mounted) {
     setState(() {
     
   });
  }
}
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           profiletop(context),
                       SizedBox(height: 1.h,),
                       profilename(),
                      // Text('${ preferences.getInt('Userid')}'),
                        SizedBox(height: 2.h,),
                  
                           SizedBox(height: 20,),           
      ],
    );
  }
   Widget profiletop(BuildContext context ){
    return  Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: 
              [
                Container(
               //color: Colors.yellow,
                height: 20.5.h,
                child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    
                    Container(
                       height: 14.5.h,
                      width: double.infinity,
                       color: Colors.grey[600],
                       child:  CachedNetworkImage(
                          imageUrl:  '$pic',
                               imageBuilder: (context, imageProvider) =>Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                                ),
                      ),
                    ),
                         // placeholder: (BuildContext, String)=>,  
                          progressIndicatorBuilder: (context, url, downloadProgress) => 
                                  Center(child: 
        SizedBox( width: 30, height: 30, child: CircularProgressIndicator(value: downloadProgress.progress))),
                                 // CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                          //Icon(Icons.error)
                            Image.asset("Assets/Images/placeholder-image.png",fit: BoxFit.cover,),
                       ),
                    )
                  ],
                ),
              ),
                 Positioned(
                top: 7.5.h,
                child:  CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 39.sp,
                  child: CircleAvatar(
                    radius: 33.sp,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                     child:
                       Builder(
                         builder: (context) {
                            getprofilepic();
                           return CachedNetworkImage(
                      imageUrl:'${ref.watch(otherprofile).dp}',
                    ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                           width: 9.5.h,
                            height: 9.5.h,
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
                Center(child: 
        SizedBox( width: 30, height: 30, child: CircularProgressIndicator(value: downloadProgress.progress))),
                 // CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
                   );
                         }
                       ),
                    ),
                  ),
                ),
              
                ),
            ],
          );
  }


Widget profilename(){
    return Column(
      children: [
         SizedBox(height: 3.h,),
         Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               width: 60.w,
               child: Text('${ref.watch(otherprofile).name}',
                  overflow: TextOverflow.ellipsis,
                  textAlign:TextAlign.center,
               style: TextStyle(
                 color: Color(0xff1A1A1A),
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  fontFamily: 'Gilroy'
               ),
               ),
             )
           ],
         ),
          
      ],
    );
  }
   
}