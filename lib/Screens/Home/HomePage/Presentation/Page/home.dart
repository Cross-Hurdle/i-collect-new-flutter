import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/Home/HomePage/Data/Model/HomePage_Modle.dart';
import 'package:icollekt/Screens/Home/HomePage/Presentation/Logic/Provider.dart';
import 'package:icollekt/Screens/Home/HomePage/Presentation/Widget/Toppick.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  bool isliked = false;
  int count = 0;
  @override
  void initState() {
    getProduct();
    // fetchdata.finaloutput();
    //    getProduct();
    // print(profiledata);
    //reset();
    //Future.microtask(() =>  ref.read(getHomeCollectionNotifier.notifier).gethomedata()
    //  );
    print('Id:${preferences.getInt('Userid')}');
    super.initState();
  }

  List carouselimages = [
    //'http://i-collekt.jksoftec.com:3001/group_images/group_image_1653604190503.jpg',
    // 'http://i-collekt.jksoftec.com:3001/group_images/group_banner_1653624905208.jpg',
    // 'http://i-collekt.jksoftec.com:3001/group_images/group_image_1653779075210.jpg',
    'http://i-collekt.jksoftec.com:3001/group_banner/group_banner_1657367829165.jpg',
     'http://i-collekt.jksoftec.com:3001/group_banner/group_banner_1657367877990.jpg',
      'http://i-collekt.jksoftec.com:3001/group_images/group_banner_1653779086126.jpg',
       
  ];
  int pageIndex = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  String emptyData = "HasData";

  bool status = false;
  HomePageresponse? productResponse;
  Future getProduct() async {
    productResponse =
        await AuthRepository().getProduct(userid: preferences.getInt('Userid'));
    status = true;
    setState(() {});
  }

  reset() {
    //data.finaloutput.clear();
    setState(() {});
  }
// onWillPop: ()async {

//             final difference = DateTime.now().difference(timeBackpressed);
//             final isExitwarning = difference>= Duration(seconds: 2);
//             timeBackpressed =DateTime.now();
//             if (isExitwarning) {
//               final message ='Press back again to exit';
//               Fluttertoast.showToast(msg: message,fontSize: 18);
//             } else{
// Fluttertoast.cancel();
//             return true;
//             }
//               return true;
//            },
  Future<void> _loadData() async {
    setState(() {});
    getProduct();
    Future.microtask(
        () => ref.read(getHomeCollectionNotifier.notifier).gethomedata());
    // getProduct();
    reset();
    //   print(profiledata);
    //fetchdata.finaloutput();
  }

  DateTime timeBackpressed = DateTime.now();
  @override
  Widget build(BuildContext context) {
   // final state = ref.watch(getHomeCollectionNotifier);
    return Scaffold(
      appBar: appbar(context),
      backgroundColor: Color(0xffF9F2FF),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            //carousel(),
            // collections(),
            SingleChildScrollView(
              child: Column(
                children: [
                  title(),
                  carousel(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: carouselimages.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 8.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),

                  // RefreshIndicator(
                  //   onRefresh: _loadData,
                  // child:
                  GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 43.h,
                      crossAxisCount: 2,
                    ),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (productResponse!
                          .finaloutput[index].likeProducts.isNotEmpty) {
                        count = productResponse!.finaloutput[index].likecount;
                        productResponse!.finaloutput[index].likeProducts
                            .forEach((element) {
                          if (element.userId == preferences.getInt('Userid') &&
                              element.status == 1) {
                            // print('222222222222222222222222222222');
                            isliked = true;
                          } else {
                            //print('1111111111111111111111111');
                            isliked = false;
                          }
                        });
                      } else {
                        count = 0;
                        isliked = false;
                      }
                      print(isliked);
                      return Toppicks(
                        
                          status: isliked,
                          likecount: count,
                          likelist:
                              productResponse!.finaloutput[index].likeProducts,
                          title: productResponse!.finaloutput[index].name
                              .toString(),
                          price: productResponse!.finaloutput[index].unitPrice
                              .toString(),
                          image: productResponse!
                              .finaloutput[index].thumbnailImg
                              .toString(),
                          description: productResponse!
                              .finaloutput[index].description
                              .toString(),
                          hastags: productResponse!.finaloutput[index].tags
                              .toString(),
                          productlist: productResponse!.finaloutput,
                          producttype:
                              productResponse!.finaloutput[index].productType,
                          id: productResponse!.finaloutput[index].id);
                    },
                    itemCount: productResponse?.finaloutput.length ?? 0,
                  )
                  //   state.when(
                  //      initial: (){
                  //                   return Container(
                  //               height: 50.h,
                  //              child: Center(child: CircularProgressIndicator()));
                  //      },
                  //      loading: (){
                  //             return Container(
                  //               height: 50.h,
                  //              child: Center(child: CircularProgressIndicator()));
                  //      }, error: (){
                  //        return
                  //     Container(
                  //         height: 50.h,
                  //         child: Center(child: Text('Error')));
                  //      },
                  //      nodata: (){
                  //        return
                  //        Container(
                  //         height: 50.h,
                  //         child: Center(child: Text('No Collection')));
                  //      },
                  //       data: (data,){

                  //         var productResponse! = HomePageresponse.fromJson(snapshot.data!.data);
                  //        return
                  //         Expanded(
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 1.sp),

                  //   child:  RefreshIndicator(
                  //     onRefresh: _loadData,
                  //     child:  GridView.builder(
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           mainAxisExtent: 46.h,
                  //           crossAxisCount: 2,
                  //         ),
                  //         physics: BouncingScrollPhysics(),
                  //         itemBuilder: (context, index) {
                  //             if (productResponse!.finaloutput[index].likeProducts.isNotEmpty) {
                  //       count=productResponse!.finaloutput[index].likecount;
                  //     productResponse!.finaloutput[index].likeProducts.forEach((element) {
                  //     if (element.userId==preferences.getInt('Userid')&&element.status==1) {
                  //      // print('222222222222222222222222222222');
                  //       isliked=true;
                  //     }else{
                  //       //print('1111111111111111111111111');
                  //       isliked=false;
                  //     }
                  //       });
                  //     }else{
                  //       count=0;
                  //       isliked=false;
                  //     }
                  //     print( isliked);
                  //           return Toppicks(
                  //           status: isliked,
                  //           likecount:count ,
                  //           likelist:productResponse!.finaloutput[index].likeProducts ,
                  //           title:productResponse!.finaloutput[index].name.toString(),
                  //         price:productResponse!.finaloutput[index].unitPrice.toString(),
                  //         image:productResponse!.finaloutput[index].thumbnailImg.toString(),
                  //        description  :productResponse!.finaloutput[index].description.toString(),
                  //        hastags:productResponse!.finaloutput[index].tags.toString(),
                  //         productlist:productResponse!.finaloutput,
                  //         producttype:productResponse!.finaloutput[index].productType,
                  //         id:productResponse!.finaloutput[index].id
                  //         );
                  //         },
                  //       itemCount:productResponse!.finaloutput.length,
                  //       )
                  //   //    StreamBuilder<Response>(
                  //   // stream:data ,
                  //   // builder: (context, snapshot) {
                  //   //   if (!snapshot.hasData)
                  //   //     return Container(
                  //   //             height: 50.h,
                  //   //            child: Center(child: CircularProgressIndicator()));

                  //   // var productResponse! = HomePageresponse.fromJson(snapshot.data!.data);

                  //   //   return GridView.builder(
                  //   //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   //         mainAxisExtent: 46.h,
                  //   //         crossAxisCount: 2,
                  //   //       ),
                  //   //       physics: BouncingScrollPhysics(),
                  //   //       itemBuilder: (context, index) {
                  //   //           if (productResponse!.finaloutput[index].likeProducts.isNotEmpty) {
                  //   //     count=productResponse!.finaloutput[index].likecount;
                  //   //   productResponse!.finaloutput[index].likeProducts.forEach((element) {
                  //   //   if (element.userId==preferences.getInt('Userid')&&element.status==1) {
                  //   //    // print('222222222222222222222222222222');
                  //   //     isliked=true;
                  //   //   }else{
                  //   //     //print('1111111111111111111111111');
                  //   //     isliked=false;
                  //   //   }
                  //   //     });
                  //   //   }else{
                  //   //     count=0;
                  //   //     isliked=false;
                  //   //   }
                  //   //   print( isliked);
                  //   //         return Toppicks(
                  //   //         status: isliked,
                  //   //         likecount:count ,
                  //   //         likelist:productResponse!.finaloutput[index].likeProducts ,
                  //   //         title:productResponse!.finaloutput[index].name.toString(),
                  //   //       price:productResponse!.finaloutput[index].unitPrice.toString(),
                  //   //       image:productResponse!.finaloutput[index].thumbnailImg.toString(),
                  //   //      description  :productResponse!.finaloutput[index].description.toString(),
                  //   //      hastags:productResponse!.finaloutput[index].tags.toString(),
                  //   //       productlist:productResponse!.finaloutput,
                  //   //       producttype:productResponse!.finaloutput[index].productType,
                  //   //       id:productResponse!.finaloutput[index].id
                  //   //       );
                  //   //       },
                  //   //     itemCount:productResponse!.finaloutput.length,
                  //   //     );
                  //   // }
                  //   //   ),
                  //   ),
                  //   ),
                  // );

                  //      }),
                  //        )
                ],
              ),
            )
            // Container()
          ],
        ),
      ),
      // bottomNavigationBar: bar()
      //bottomNavBar(),
    );
  }

  Widget title() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h, left: 5.w, bottom: 3.h),
      child: Row(
        children: [
          Text(
            "Todays top picks",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xff1A1A1A),
                fontSize: 16.sp),
          ),
        ],
      ),
    );
  }

  Widget carousel() {
   // final double height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: ((index, reason) {
          setState(() {
            _current = index;
           // print(_current);
          });
        }),
        height: 180,
        viewportFraction: 1.0,
        enlargeCenterPage: true,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
      items: carouselimages.map((item) {
        return CachedNetworkImage(
          imageUrl: item,
          //"http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
          // "${widget.image}",
          fit: BoxFit.contain,
          imageBuilder: (context, imageProvider) => ClipRRect(
               borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                // color: Colors.black12.withOpacity(10),
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
              Container(
            width: 50,
            child: Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
          ),
          errorWidget: (context, url, error) => Container(
              width: double.infinity,
              height: 200,
              color: Colors.white,
              child: Icon(Icons.error)),
        );
        //  FlickManager flickManager;

        // print(item.split('.').last);
        // return Container(
        //   child: Center(
        //     child: Builder(builder: (context) {
        //       if (item.split('.').last == "png" ||
        //           item.split('.').last == "jpg" ||
        //           item.split('.').last == "jpeg" ||
        //           item.split('.').last == "web") {
        //         return CachedNetworkImage(
        //           imageUrl: item,
        //           //"http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
        //           // "${widget.image}",
        //           fit: BoxFit.fill,
        //           imageBuilder: (context, imageProvider) => Container(
        //             decoration: BoxDecoration(
        //               // color: Colors.black12.withOpacity(10),
        //               image: DecorationImage(
        //                 image: imageProvider,
        //                 fit: BoxFit.cover,
        //                 // colorFilter:
        //                 //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
        //               ),
        //             ),
        //           ),

        //           progressIndicatorBuilder:
        //               (context, url, downloadProgress) =>
        //                   CircularProgressIndicator(
        //                       value: downloadProgress.progress),
        //           errorWidget: (context, url, error) =>
        //               Icon(Icons.error),
        //         );
        //       }
        //       // else if(item.split('.').last=="png"){
        //       //   return Container();
        //       // }
        //       else {
        //         // return Container(
        //         //     color: Colors.black,
        //         //     child: ProfileVideoPlayerScreen(
        //         //         url: item, scrollController: scrollController));
        //       }
        //     }),
        //   ),
        // );
      }).toList(),
    );
  }
}
