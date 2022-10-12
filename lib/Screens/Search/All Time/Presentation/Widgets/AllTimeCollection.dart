import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:icollekt/Exports/Exports.dart';

class TopCollectionAllTime extends StatefulWidget {
   final String? image;
  final String ?title;
  final String? description;
  final int? price;
  final int? id;
  const TopCollectionAllTime({ Key? key,this.description,this.image,this.price,this.title,this.id }) : super(key: key);

  @override
  State<TopCollectionAllTime> createState() => _TopCollectionAllTimeState();
}

class _TopCollectionAllTimeState extends State<TopCollectionAllTime> {
@override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
    //   Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductCards()));
        pushNewScreen(
          context,
          screen: ProductCards(id: widget.id,),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      },
      child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              color: Colors.white
              ),
              margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                       alignment: AlignmentDirectional.topEnd,
                      children: 
                        [ Column(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          // mainAxisSize: MainAxisSize.min,
                          // verticalDirection: VerticalDirection.down,
                          children: <Widget>[
                            // Padding(
                            //   padding: const EdgeInsets.all(12.0),
                            //   child: Row(children: [
                            //     Text('joshua',
                            //     style: TextStyle(
                            //       fontFamily: 'Gilroy',
                            //       fontSize: 10.5.sp,
                            //       fontWeight: FontWeight.w600
                            //     ),
                            //     )
                            //   ],),
                            // ),
                            Container(
                             // color: Colors.red,
                              height: 20.h,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                         imageUrl:  
                                         //"http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                                         "${widget.image}",
                                       fit: BoxFit.fill,
                                              imageBuilder: (context, imageProvider) => Container(
                                     decoration: BoxDecoration(
                                       image: DecorationImage(
                                           image: imageProvider,
                                           fit: BoxFit.cover,
                                          // colorFilter:
                                             //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                               ),
                                     ),
                                                           ),                 
                                        
                                         progressIndicatorBuilder: (context, url, downloadProgress) => 
                                                 Center(child: 
                                         SizedBox( width: 30, height: 30, child: CircularProgressIndicator(value: downloadProgress.progress))),
                                                // CircularProgressIndicator(value: downloadProgress.progress),
                                         errorWidget: (context, url, error) => Container(
                                           color: Colors.grey,
                                           child: Center(child: Icon(Icons.error))),
                                      ),

                              // Image.asset("Assets/Images/Chip 2.jpeg",fit: BoxFit.fill,
                              //  height: 215.0,
                               // ),
                            ),
                            // new SvgPicture.network(
                            //   country.flag.replaceAll('https', 'http'),r
                            //   height: 130.0,
                            //   width: 100.0,
                            //   placeholderBuilder: (BuildContext context) => new Container(
                            //       padding: const EdgeInsets.all(60.0),
                            //       child: const CircularProgressIndicator()),
                            // ),
                            new Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 0.90.h,),
                                 Row(
                                   children: [
                                     Container(
                                       width: 44.w,
                                       child: Text("${widget.title} ",
                                       style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                         fontFamily: "Gilroy",
                                         fontSize: 12.sp,
                                         color: Color(0xff1A1A1A)
                                       ),
                                       )),
                                   ],
                                 ),
                                   SizedBox(height:10,),
                                   Row(
                                   children: [
                                     Container(
                                      // height: 5.h,
                                       width: 44.w,
                                       child:  HtmlWidget("${widget.description}",
                                            textStyle: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                               fontWeight: FontWeight.w400,
                                               fontFamily: "Gilroy",
                                               fontSize: 11.sp,
                                               color: Color(0xff1A1A1A)
                                             ),
                                             )),
                                   ],
                                 ),
                                 SizedBox(height: 0.50.h,),
                                
                                ],
                              ),
                            )
                          ],
                        ),
                        //  Positioned(
                        //          // bottom: 295,
                        //           // right: 1.h,
                        //            top: 6,
                        //           child: Image.asset("Assets/Images/inactive.png",),
                        //         ),
                      ],
                  ),
                   Padding(
                     padding: EdgeInsets.only(bottom:18.0),
                     child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       Text("USD\$${widget.price}.00",
                                         style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           fontFamily: "Gilroy",
                                           fontSize: 12.sp,
                                           color: Color(0xff1A1A1A)
                                         ),),
                                         SizedBox(width: 4.w,)
                                     ],
                                   ),
                   )
                ],
              ),
            ),
    );
  }
}