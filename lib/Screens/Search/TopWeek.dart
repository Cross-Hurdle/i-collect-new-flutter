import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/weekmodle.dart';


// ignore: must_be_immutable
class TopWeekcollekt extends StatefulWidget {
  String? filter;
   TopWeekcollekt({ Key? key,required this.filter }) : super(key: key);

  @override
  State<TopWeekcollekt> createState() => _TopWeekcollektState();
}

class _TopWeekcollektState extends State<TopWeekcollekt> {
    @override
  void initState() { 
    super.initState();
    topcollection();
  }
  bool status= false;
  TopWeekresponse? collectionResponse;
  topcollection() async {
     
   collectionResponse = await GroupAndChatRepository().getWeekResponse();
   status=true;
  print(collectionResponse);
     //  print('hiiiiiiiiiii   ${ref.read(commentinfo).id!}');
   // print(commentResponse!.userData.length);
     setState(() {
       
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context),
      backgroundColor: Color(0xffF9F2FF),
      body: Column(
        children: [
          title(),
          collections(),
          Container()
        ],
      ),
     // bottomNavigationBar: bar()
      //bottomNavBar(),
    );
  }

    Widget title(){
    return Padding(
                   padding: const EdgeInsets.only(top:28.0,bottom: 20,left: 20),
                   child: Row(mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                     Container(
                       width: 90.w,
                    child:Text("Top ranked collections this ${widget.filter}",
                       textAlign: TextAlign.start,
             style: TextStyle(
               color: Color(0xff1A1A1A),
               fontWeight: FontWeight.w700,
               fontSize: 15.sp,
               fontFamily: 'Gilroy'
                   ),
                  ),
                      // width: 100.w,
                      
                     ),
                     ],
                   ),
                 );
  }
collections() {
  if (!status) {
                 return Container(
                    height: 50.h,
                   child: Center(child: CircularProgressIndicator()));
               }else
    return
  collectionResponse!.topweek.length!=0?  Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 1.sp),

      child:  GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 45.h,
            crossAxisCount: 2,
          ),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>  TopCollectionTopWeek(
            id:collectionResponse!.topweek[index].id ,
            title: collectionResponse!.topweek[index].name,
            description: collectionResponse!.topweek[index].description,
            image: collectionResponse!.topweek[index].thumbnailImg,
            price: collectionResponse!.topweek[index].unitPrice,
          ),
         itemCount:  collectionResponse!.topweek.length,
        ),
      ),
    ):Container(
              height: 50.h,
              child: Center(child: Text('No TopWeek Collection')));
  }

    buildappbar(context){
    return AppBar(
      backgroundColor: kBackground,
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
        Image.asset("Assets/Images/shop.png",
     width: 12.w,
      ),
      ],
      elevation: 1,
    );
  }
}

class TopCollectionTopWeek extends StatefulWidget {
   final String? image;
  final String ?title;
  final String? description;
  final int? price;
  final int? id;
  const TopCollectionTopWeek({ Key? key,this.description,this.image,this.price,this.title,this.id }) : super(key: key);

  @override
  State<TopCollectionTopWeek> createState() => _TopCollectionTopWeekState();
}

class _TopCollectionTopWeekState extends State<TopCollectionTopWeek> {
 
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
                                         errorWidget: (context, url, error) => Icon(Icons.error),
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
                                         fontSize: 10.sp,
                                         color: Color(0xff1A1A1A)
                                       ),
                                       )),
                                   ],
                                 ),
                                   SizedBox(height: 0.90.sp,),
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
                                               fontSize: 12.sp<=12.sp?12.sp:11.sp,
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