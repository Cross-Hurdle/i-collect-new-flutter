import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

import '../../../../../Services/Provider.dart';
import '../../../../OtherProfile/otherprofilepage.dart';

class SearchBar extends ConsumerStatefulWidget {
  final List name;
  final String type;
  final Function tapped;
  const SearchBar({Key? key,required this.name,required this.tapped,required this.type}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.name.length,
          itemBuilder: (context,index){
           return GestureDetector(
             onTap:(){
              // 'bgimg':element.bannerImg,
                ref.watch(otherprofile).name= widget.name[index]['name'];
                 ref.watch(otherprofile).dp=widget.name[index]['image'];
                  ref.watch(otherprofile).bg=widget.name[index]['bgimg'];
                  ref.read(otherprofile).id=widget.name[index]['Id'];
                  if (widget.name[index]['Id']==preferences.getInt('Userid')&&widget.type== 'account') {
                    print('hi');
                      pushNewScreen(
                               context,
                               screen: Profile(),
                               withNavBar: true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                  } 
                  else if(widget.type== 'account') {
                    pushNewScreen(
                                 context,
                                 screen: Otherprofilepage(name: widget.name,),
                                 withNavBar: true, // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                  );
                  }
                  else{
                      pushNewScreen(
                                 context,
                                 screen: ProductCards(id: widget.name[index]['Id'],),
                                 withNavBar: true, // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                  );
                  }
              //  widget.name[index]['Id']==preferences.getInt('Userid')&&widget.type== 'product'?
              //   pushNewScreen(
              //                  context,
              //                  screen: Profile(),
              //                  withNavBar: true, // OPTIONAL VALUE. True by default.
              //                     pageTransitionAnimation: PageTransitionAnimation.cupertino,
              //                   ): pushNewScreen(
              //                    context,
              //                    screen: Otherprofilepage(name: widget.name,),
              //                    withNavBar: true, // OPTIONAL VALUE. True by default.
              //                       pageTransitionAnimation: PageTransitionAnimation.cupertino,
              //                     ):
              // widget.type== 'account':
              //  pushNewScreen(
              //                    context,
              //                    screen: ProductCards(id: widget.name[index]['Id'],),
              //                    withNavBar: true, // OPTIONAL VALUE. True by default.
              //                       pageTransitionAnimation: PageTransitionAnimation.cupertino,
              //                     ):print('object');
             } ,
             child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              // width: 51.w,
               height: 16.w,
              decoration: BoxDecoration(
               // borderRadius: BorderRadius.circular(9),
                color: Colors.white,
                
              ),
               child: Row(
                 children: [
                   CircleAvatar(
                         radius: 26,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child:
                           CachedNetworkImage(
                              imageUrl:widget.name[index]['image']==null?'':widget.name[index]['image'],
                              
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
                                      CircularProgressIndicator(value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
                           ),
                      
                        ),
                                          ),
                   SizedBox(width: 10,),
                   Text(widget.name[index]['name']),
                 ],
               ),
             ),
           );
        }),
      ],
    );
  }
}