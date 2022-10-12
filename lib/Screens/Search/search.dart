import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Provider/provider%20helper.dart';
import 'package:icollekt/Screens/Search/All%20Time/Presentation/Pages/AllTime.dart';
import 'package:icollekt/Screens/Search/TopWeek.dart';
import 'package:icollekt/Screens/Search/Topmonth.dart';
import 'package:icollekt/Screens/Search/All%20Time/Presentation/Pages/Topyear.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart'as htmltext;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../Home/HomePage/Data/Model/HomePage_Modle.dart';
import '../Notification/Notification.dart';
import 'All Time/Data/Modle/AlltimeModle.dart';
import 'All Time/Presentation/Logic/Provider.dart';
import 'Search Profile/Presentation/Page/SearchScreen.dart';

class Search extends ConsumerStatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  ConsumerState<Search> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> with TickerProviderStateMixin {
  late TabController _tabController;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    getProduct() ;
    Future.microtask(() =>
        ref.read(getAllTimeCollectionNotifier.notifier).getalltimefunction());
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();
  List carouselimages = [
    //'http://i-collekt.jksoftec.com:3001/group_images/group_image_1653604190503.jpg',
    // 'http://i-collekt.jksoftec.com:3001/group_images/group_banner_1653624905208.jpg',
    // 'http://i-collekt.jksoftec.com:3001/group_images/group_image_1653779075210.jpg',
    'http://i-collekt.jksoftec.com:3001/group_banner/group_banner_1657367829165.jpg',
    'http://i-collekt.jksoftec.com:3001/group_banner/group_banner_1657367877990.jpg',
    'http://i-collekt.jksoftec.com:3001/group_images/group_banner_1653779086126.jpg',
  ];
  List images = [
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg',
    'https://media.nature.com/w1248/magazine-assets/d41586-017-08492-y/d41586-017-08492-y_15320844.jpg',
    'https://image.shutterstock.com/image-illustration/elephant-zebra-skin-studio-concept-600w-1459474760.jpg'
  ];
 bool status = false;
  HomePageresponse? productResponse;
  Future getProduct() async {
    productResponse =
        await AuthRepository().getProduct(userid: preferences.getInt('Userid'));
    status = true;
    setState(() {});
  }
  Future getProductbanneer() async {
    productResponse =
        await AuthRepository().getBanner(userid: preferences.getInt('Userid'));
    status = true;
    setState(() {});
  }
  FocusNode focusNode = FocusNode();
  onPressed({@required String? function}) {
    Widget? routeNavigation;

    if (function == "week") {
      routeNavigation = TopWeekcollekt(
        filter: 'week',
      );
    } else if (function == "month") {
      routeNavigation = TopMonthcollekt(
        filter: 'month',
      );
    } else if (function == "year") {
      routeNavigation = TopYearcollekt(
        filter: 'year',
      );
    } else if (function == "alltime") {
      routeNavigation = AllTimecollekt(
        filter: 'all time',
      );
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => routeNavigation!),
    );
  }

  String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365)
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    if (diff.inDays > 30)
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    if (diff.inDays > 7)
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    if (diff.inDays > 0)
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    if (diff.inHours > 0)
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    if (diff.inMinutes > 0)
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "min" : "minutes"} ago";
    return "just now";
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildappbar(),
        backgroundColor: Color(0xffF9F2FF),
        body: RefreshIndicator(
          onRefresh: () async{  
             getProduct() ;
    Future.microtask(() =>
        ref.read(getAllTimeCollectionNotifier.notifier).getalltimefunction());
    _tabController = TabController(length: 2, vsync: this);
          },
          child: ListView(
            controller:
                //scrollController,
                ref.watch(scrollProvider).scrollController,
            // primary: true,
            //  shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              textField(),
              carousel(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: carouselimages.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              title(),
              filter(),
              SizedBox(
                height: 30,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 18.0, bottom: 20, left: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Container(
              //         // width: 100.w,
              //         child: Text(
              //           "Explore",
              //           textAlign: TextAlign.start,
              //           style: TextStyle(
              //               color: Color(0xff1A1A1A),
              //               fontWeight: FontWeight.w700,
              //               fontSize: 15.sp,
              //               fontFamily: 'Gilroy'),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              TabBar(
                onTap: (int i) {
                  index = i;
                  setState(() {});
                },
                padding: EdgeInsets.only(bottom: 0),
                //  labelColor: Colors.red,
                indicatorColor: Color(0xff591B4C),
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Explore',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          fontFamily: 'Gilroy'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'My Feed',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          fontFamily: 'Gilroy'),
                    ),
                  ),
                ],
              ),
              if (index == 0) explore(),
              // Container(
              //   color: Colors.red,
              //   height: 100,
              // ),
              // explore(),
              if (index == 1) myfeed(),
              // TabBarView(
              //   // physics: NeverScrollableScrollPhysics(),
              //   controller: _tabController,
              //   children: [
              //     explore(),
              //     // Container(
              //     //   color: Colors.red,
        
              //     // ),
              //     myfeed(),
              //     //                 Container(
              //     // color: Colors.green,
        
              //     //                 )
              //   ],
              // ),
            ],
          ),
        ));
  }

  Widget filter() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 4.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              week(context),
              SizedBox(
                width: 10.w,
              ),
              month(context)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 4.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              year(context),
              SizedBox(
                width: 10.w,
              ),
              alltime(context)
            ],
          ),
        ),
      ],
    );
  }

  Widget myfeed() {
    final state = ref.watch(getAllTimeCollectionNotifier);
    return state.when(initial: () {
      return Container(
          height: 50.h, child: Center(child: CircularProgressIndicator()));
    }, loading: () {
      return Container(
          height: 50.h, child: Center(child: CircularProgressIndicator()));
    }, error: () {
      return Container(
          height: 50.h, child: Center(child: Text('No Collection')));
    }, nodata: () {
      return Container(
          height: 50.h, child: Center(child: Text('No  Collection')));
    }, data: (data) {
      return GridView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.alltimeProduct.length,
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            QuiltedGridTile(2, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 2),
          ],
        ),
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            pushNewScreen(
              context,
              screen: ProductCards(
                id: data.alltimeProduct[index].id,
              ),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          child: Container(
            child: CachedNetworkImage(
              imageUrl: '${data.alltimeProduct[index].thumbnailImg}',
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                  height: 35.5.h,
                  width: double.infinity,
                  color: Colors.grey,
                  //  child: Center(child: new CircularProgressIndicator())
                ),
              errorWidget: (context, url, error) => Image.asset(
                "Assets/Images/Portrait_Placeholder.png",
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget explore() {
    // final state = ref.watch(getAllTimeCollectionNotifier);
    // return state.when(initial: () {
    //   return Container(
    //       height: 50.h, child: Center(child: CircularProgressIndicator()));
    // }, loading: () {
    //   return Container(
    //       height: 50.h, child: Center(child: CircularProgressIndicator()));
    // }, error: () {
    //   return Container(
    //       height: 50.h, child: Center(child: Text('No Collection')));
    // }, nodata: () {
    //   return Container(
    //       height: 50.h, child: Center(child: Text('No  Collection')));
    // }, data: (data) {
      if (!status) {
        return Container(
         height: 50.h,
          child: Center(child: CircularProgressIndicator())
              );
               }else{
                if (productResponse!.finaloutput.length!=0){          
            return GridView.custom(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            QuiltedGridTile(2, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => GestureDetector(
            onTap: () {
              pushNewScreen(
                context,
                screen: ProductCards(
                  id: productResponse!.finaloutput[index].id,
                ),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: Container(
              child: CachedNetworkImage(
                imageUrl: '${productResponse!.finaloutput[index].thumbnailImg}',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 35.5.h,
                  width: double.infinity,
                  color: Colors.grey,
                  //  child: Center(child: new CircularProgressIndicator())
                ),
                errorWidget: (context, url, error) => Image.asset(
                  "Assets/Images/Portrait_Placeholder.png",
                ),
              ),
            ),
          ),
          childCount: productResponse!.finaloutput.length,
        ),
      );
                }else{
                  return Container(
                    height: 50.h,
                    child: Center(child: Text('No Collections')),
                  );
                }
                }
     
   // }
    
  }

  Widget post(context, int index, TopAllTimeresponse data) {
    return GestureDetector(
      onTap: () {
        //  print('month');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0.sp, horizontal: 1.sp),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  //SizedBox(height: 10,),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 2.5.w,
                                ),
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          '${data.alltimeProduct[index].user.profilePic}',
                                      width: 9.5.h,
                                      height: 9.5.h,
                                      fit: BoxFit.cover,
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                        radius: 33.sp,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        "Assets/Images/Portrait_Placeholder.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                          height: 40,
                                          child: Text(
                                            '${data.alltimeProduct[index].user.name}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'SF Pro Text',
                                                fontSize: 12.sp),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //  height: 18.h,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        data.alltimeProduct[index].productType == 0
                            ? Container(
                                width: 17.w,
                                child: Text(''),
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Price \$ ${data.alltimeProduct[index].unitPrice}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'SF Pro Text',
                                            fontSize: 11.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Container(
                          // color: Colors.red,

                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 12.0.sp),
                                child:
                                    data.alltimeProduct[index].photos.length >=
                                            1
                                        ? Icon(
                                            Icons.more_horiz,
                                            size: 18.sp,
                                          )
                                        : Container(),
                              )
                              // Text('data')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        width: 90.w,
                        child: Text(
                          '${data.alltimeProduct[index].name}',
                          // '#casinochip #chipcollection #caesarspalace',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy',
                              fontSize: 10.sp),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        width: 90.w,
                        child: htmltext.HtmlWidget(
                          '${data.alltimeProduct[index].description} ',
                          // '${data.alltimeProduct[index].hashtags}',
                          //'#casinochip #chipcollection #caesarspalace',
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy',
                              fontSize: 10.sp),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        width: 90.w,
                        child: Text(
                          '${data.alltimeProduct[index].tags}',
                          // '#casinochip #chipcollection #caesarspalace',

                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy',
                              fontSize: 10.sp),
                        ),
                      )
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     data.alltimeProduct[index].productType == 2
                  //         ? button(context, index, data)
                  //         : Container(),

                  //     //   product.producttype==2?
                  //     //  button():Container()
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     data.alltimeProduct[index].productType == 1
                  //         ? button1(context)
                  //         : Container(),
                  //   ],
                  // ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          timeAgo(data.alltimeProduct[index].createdAt),
                          style: TextStyle(
                              color: Color(0x77000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy',
                              fontSize: 11.sp),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget carousel(int index, TopAllTimeresponse data) {
  //   // final state = ref.watch(getprofileproduct);
  //   return Builder(
  //     builder: (context) {
  //       return Stack(
  //         alignment: AlignmentDirectional.topEnd,
  //         children: [
  //           CarouselSlider(
  //             options: CarouselOptions(
  //               // height: height,
  //               enableInfiniteScroll: false,
  //               viewportFraction: 1.0,
  //               enlargeCenterPage: false,
  //               autoPlay: false,
  //             ),
  //             items:
  //                 //media
  //                 data.alltimeProduct[index].photos.map((item) {
  //               return Container(
  //                 child: Center(
  //                   child: Builder(builder: (context) {
  //                     // print('object');
  //                     if (item.split('.').last == "png" ||
  //                         item.split('.').last == "jpg" ||
  //                         item.split('.').last == "jpeg" ||
  //                         item.split('.').last == "web") {
  //                       return CachedNetworkImage(
  //                         imageUrl: item,
  //                         //"http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
  //                         // "${widget.image}",
  //                         fit: BoxFit.fill,
  //                         imageBuilder: (context, imageProvider) => Container(
  //                           decoration: BoxDecoration(
  //                             // color: Colors.black12.withOpacity(10),
  //                             image: DecorationImage(
  //                               image: imageProvider,
  //                               fit: BoxFit.cover,
  //                               // colorFilter:
  //                               //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
  //                             ),
  //                           ),
  //                         ),

  //                         progressIndicatorBuilder:
  //                             (context, url, downloadProgress) =>
  //                                 CircularProgressIndicator(
  //                                     value: downloadProgress.progress),
  //                         errorWidget: (context, url, error) =>
  //                             Icon(Icons.error),
  //                       );
  //                     }
  //                     // else if(item.split('.').last=="png"){
  //                     //   return Container();
  //                     // }
  //                     else {
  //                       return Container(
  //                           color: Colors.black,
  //                           child: ProfileVideoPlayerScreen(
  //                               url: item, scrollController: scrollController));
  //                     }
  //                   }),
  //                 ),
  //               );
  //             }).toList(),
  //           ),
  //           data.alltimeProduct[index].productType == 0
  //               ? Container()
  //               : Container(
  //                   margin: EdgeInsets.only(top: 10, right: 10),
  //                   decoration: BoxDecoration(
  //                       color: Color(0xff591B4C),
  //                       borderRadius: BorderRadiusDirectional.circular(100)),
  //                   height: 50,
  //                   width: 50,
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         'Price',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.w400,
  //                             fontFamily: 'Gilroy',
  //                             fontSize: 8.sp),
  //                       ),
  //                       Center(
  //                         child: Text(
  //                           '\$ ${data.alltimeProduct[index].unitPrice}',
  //                           style: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.w400,
  //                               fontFamily: 'Gilroy',
  //                               fontSize: 8.sp),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //         ],
  //       );
  //     },
  //   );
  // }

  // Widget button(BuildContext context, int index, TopAllTimeresponse data) {
  //   return GestureDetector(
  //     onTap: () {
  //       focusNode.requestFocus();
  //       makeanOffer(context, index, data);
  //     },
  //     child: Container(
  //       margin: EdgeInsets.only(left: 19, top: 10),
  //       width: 90.w,
  //       height: 50,
  //       // width: 37.w,
  //       //height: 39,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(5), color: Color(0xff591B4C)),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //         child: Center(
  //           child: Text(
  //             "Make an Offer",
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w600,
  //                 fontFamily: "Gilroy",
  //                 fontSize: 12.sp,
  //                 color: Color(0xffffffff)),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget button1(context) {
  //   return InkWell(
  //     onTap: () {
  //       pushNewScreen(
  //         context,
  //         screen: Cart(),
  //         withNavBar: false, // OPTIONAL VALUE. True by default.
  //         pageTransitionAnimation: PageTransitionAnimation.cupertino,
  //       );
  //       //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
  //       // onPressed(function: onpressedtitle);
  //     },
  //     child: Container(
  //       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //       width: 90.w,
  //       height: 50,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadiusDirectional.circular(5),
  //           color: Color(0xff591B4C)),
  //       child: Center(
  //           child: Text(
  //         'ADD TO CART',
  //         style: TextStyle(
  //             color: Colors.white,
  //             fontWeight: FontWeight.w600,
  //             fontFamily: "Gilroy",
  //             fontSize: 16),
  //       )),
  //     ),
  //   );
  // }

  Widget carousel() {
  //  final double height = MediaQuery.of(context).size.height;
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
      }).toList(),
    );
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // width: 100.w,
            // child: Text('${preferences.getString('Name')}')
            child: Text(
              "Top Ranked Collections",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  fontFamily: 'Gilroy'),
            ),
          ),
        ],
      ),
    );
  }

  buildappbar() {
    return AppBar(
      backgroundColor: kBackground,
      centerTitle: true,
      title: Image.asset(
        "Assets/Images/Icollekt.png",
        height: 11.h,
      ),
      actions: [
        // IconButton(
        //   icon: Icon(
        //     Icons.notifications,
        //     size: 29,
        //   ),
        //   color: Color(0xff591B4C),
        //   onPressed: () {
        //     pushNewScreen(
        //       context,
        //       screen: NotificationScreen(),
        //       withNavBar: false, // OPTIONAL VALUE. True by default.
        //       pageTransitionAnimation: PageTransitionAnimation.cupertino,
        //     );
        //   },
        // ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            pushNewScreen(
              context,
              screen: Cart(),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          child: SvgPicture.asset(
            "Assets/Images/shop.svg",
            width: 7.w,
          ),
        ),
        SizedBox(
          width: 3.w,
        )
      ],
      elevation: 0,
    );
  }

  Widget week(context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onPressed(function: 'week');
          print('week');
        },
        child: Container(
          width: double.infinity,
          height: 6.h,
          // width: 47.w,
          //   margin: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 4.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffFFCFCF),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(
              "Week",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gilroy',
                  fontSize: 12.sp,
                  color: Color(0xff1A1A1A)),
            ),
          ),
        ),
      ),
    );
  }

  Widget month(context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onPressed(function: 'month');
          print('month');
        },
        child: Container(
          height: 6.h,
          // height: 8.h,
          width: double.infinity,
          // margin: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 4.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffC5F1FF),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(
              "Month",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gilroy',
                  fontSize: 12.sp,
                  color: Color(0xff1A1A1A)),
            ),
          ),
        ),
      ),
    );
  }

  Widget year(context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onPressed(function: 'year');
          print('year');
        },
        child: Container(
          height: 6.h,
          // height: 8.h,
          width: double.infinity,
          // margin: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 4.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffC1BFFF),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(
              "Year",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gilroy',
                  fontSize: 12.sp,
                  color: Color(0xff1A1A1A)),
            ),
          ),
        ),
      ),
    );
  }

  Widget alltime(context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onPressed(function: 'alltime');
          // print('alltime');
          String alltime = 'alltime';
          setState(() {
            // alltime;
            print(alltime);
          });
        },
        child: Container(
          height: 6.h,
          // height: 8.h,
          width: double.infinity,
          // margin: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 4.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffF0B4FF),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(
              "All time",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gilroy',
                  fontSize: 12.sp,
                  color: Color(0xff1A1A1A)),
            ),
          ),
        ),
      ),
    );
  }

  Widget textField() {
    return GestureDetector(
      onTap: () {
        pushNewScreen(
          context,
          screen: SearchScreen(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.fade,
        );
      },
      child: Container(
          //  margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            // width: 51.w,
            height: 14.w,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(9),
              color: Color(0xffFAF7F7),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Search',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ),
                Image.asset(
                  "Assets/Images/searchright.png",
                ),
              ],
            ),
          )),
    );
  }

  // makeanOffer(BuildContext context, int index, TopAllTimeresponse data) {
  //   //  final typestate = ref.watch(getprofileproduct);
  //   return showCupertinoModalBottomSheet(
  //     enableDrag: true,
  //     expand: false,
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => Container(
  //       //  margin: EdgeInsets.symmetric(horizontal: 10),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(20.0),
  //           topRight: Radius.circular(20.0),
  //           bottomLeft: Radius.zero,
  //           bottomRight: Radius.zero,
  //         ),
  //       ),

  //       // height: 65.h,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Container(
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.black,
  //                     ),
  //                     height: 5,
  //                     width: 10.w,

  //                     margin: EdgeInsets.symmetric(vertical: 12.sp),
  //                     //child:
  //                   ),
  //                 ],
  //               ),
  //               Container(
  //                 margin: EdgeInsets.symmetric(vertical: 10.sp),
  //                 child: Text('Make an Offer',
  //                     style: TextStyle(
  //                         fontFamily: 'Gilroy',
  //                         fontSize: 16.sp,
  //                         fontWeight: FontWeight.w600,
  //                         color: Color(0xff591B4C))),
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Container(
  //                         child: CachedNetworkImage(
  //                           imageUrl:
  //                               '${data.alltimeProduct[index].thumbnailImg}',
  //                           width: 9.5.h,
  //                           height: 9.5.h,
  //                           fit: BoxFit.cover,
  //                           imageBuilder: (context, imageProvider) => Container(
  //                             margin: EdgeInsets.all(10),
  //                             decoration: BoxDecoration(
  //                               image: DecorationImage(
  //                                 image: imageProvider,
  //                                 fit: BoxFit.cover,
  //                                 // colorFilter:
  //                                 //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
  //                               ),
  //                             ),
  //                           ),
  //                           progressIndicatorBuilder:
  //                               (context, url, downloadProgress) =>
  //                                   CircularProgressIndicator(
  //                                       value: downloadProgress.progress),
  //                           errorWidget: (context, url, error) => Image.asset(
  //                             "Assets/Images/Portrait_Placeholder.png",
  //                             fit: BoxFit.cover,
  //                           ),
  //                         ),
  //                       ),
  //                       Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         children: [
  //                           Container(
  //                             width: 60.w,
  //                             child: Text(
  //                               '${data.alltimeProduct[index].name}',
  //                               // '#casinochip #chipcollection #caesarspalace',

  //                               style: TextStyle(
  //                                   overflow: TextOverflow.ellipsis,
  //                                   fontWeight: FontWeight.w700,
  //                                   fontFamily: 'Gilroy',
  //                                   fontSize: 12.sp),
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 2,
  //                           ),
  //                           Container(
  //                             width: 60.w,
  //                             child: Text(
  //                               '${data.alltimeProduct[index].description}',
  //                               // '#casinochip #chipcollection #caesarspalace',

  //                               style: TextStyle(
  //                                   overflow: TextOverflow.ellipsis,
  //                                   fontWeight: FontWeight.w400,
  //                                   fontFamily: 'Gilroy',
  //                                   fontSize: 11.sp),
  //                             ),
  //                           ),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                   Column(
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Text(
  //                           '\$ ${data.alltimeProduct[index].unitPrice}',
  //                           // '#casinochip #chipcollection #caesarspalace',
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.w700,
  //                               fontFamily: 'Gilroy',
  //                               fontSize: 10.sp),
  //                         ),
  //                       ),
  //                       // Text('data')
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Container(
  //                     width: 90.w,
  //                     decoration: BoxDecoration(
  //                         color: Colors.grey[300],
  //                         borderRadius: BorderRadius.circular(10)),
  //                     child: Row(
  //                       children: [
  //                         SizedBox(
  //                           width: 20,
  //                         ),
  //                         Container(
  //                           child: Icon(
  //                             Icons.restore,
  //                             size: 30,
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           width: 20,
  //                         ),
  //                         Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             SizedBox(
  //                               height: 10,
  //                             ),
  //                             Row(
  //                               children: [
  //                                 Text(
  //                                   'Heads up, offering isn\'t buying ',
  //                                   // '#casinochip #chipcollection #caesarspalace',
  //                                   style: TextStyle(
  //                                       fontWeight: FontWeight.w700,
  //                                       fontFamily: 'Gilroy',
  //                                       letterSpacing: 1,
  //                                       fontSize: 13.sp),
  //                                 ),
  //                               ],
  //                             ),
  //                             SizedBox(
  //                               height: 6,
  //                             ),
  //                             Container(
  //                               width: 70.w,
  //                               child: Text(
  //                                 'If the seller accepts, you\'ll have 24 hours to buy the iterm at your offer price',
  //                                 // '#casinochip #chipcollection #caesarspalace',
  //                                 style: TextStyle(
  //                                     fontWeight: FontWeight.w400,
  //                                     fontFamily: 'Gilroy',
  //                                     fontSize: 11.sp),
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               height: 10,
  //                             ),
  //                           ],
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               Row(
  //                 children: [
  //                   SizedBox(
  //                     width: 20,
  //                   ),
  //                   Text(
  //                     'Your offer',
  //                     // '#casinochip #chipcollection #caesarspalace',
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.w700,
  //                         fontFamily: 'Gilroy',
  //                         letterSpacing: 1,
  //                         fontSize: 13.sp),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               Container(
  //                   margin: EdgeInsets.symmetric(
  //                     horizontal: 19,
  //                   ),
  //                   child: TextField(focusNode: focusNode, autofocus: true)),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               Row(
  //                 children: [
  //                   Container(
  //                     margin: EdgeInsets.all(10),
  //                     width: 95.w,
  //                     child: RichText(
  //                       text: TextSpan(
  //                         text: ' ',
  //                         style: DefaultTextStyle.of(context).style,
  //                         children: <TextSpan>[
  //                           TextSpan(
  //                             text: 'Tips: ',
  //                             // '#casinochip #chipcollection #caesarspalace',\
  //                             // textAlign: T,
  //                             style: TextStyle(
  //                                 fontWeight: FontWeight.w700,
  //                                 fontFamily: 'Gilroy',
  //                                 letterSpacing: 1,
  //                                 fontSize: 13.sp),
  //                           ),
  //                           TextSpan(
  //                             text:
  //                                 'Try an offer of 5-30% off the current item price',
  //                             // '#casinochip #chipcollection #caesarspalace',\
  //                             // textAlign: T,
  //                             style: TextStyle(
  //                                 fontWeight: FontWeight.w500,
  //                                 fontFamily: 'Gilroy',
  //                                 letterSpacing: 1,
  //                                 fontSize: 11.sp),
  //                           ),
  //                           // TextSpan(text: ' world!'),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           Row(
  //             children: [
  //               GestureDetector(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                   //  makeanOffer( context );
  //                 },
  //                 child: Container(
  //                   margin: EdgeInsets.only(left: 19, top: 10),
  //                   width: 90.w,
  //                   height: 50,
  //                   // width: 37.w,
  //                   //height: 39,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(5),
  //                       color: Color(0xff591B4C)),
  //                   child: Padding(
  //                     padding: const EdgeInsets.symmetric(
  //                         horizontal: 20, vertical: 10),
  //                     child: Center(
  //                       child: Text(
  //                         "Send Offer",
  //                         style: TextStyle(
  //                             fontWeight: FontWeight.w600,
  //                             fontFamily: "Gilroy",
  //                             fontSize: 12.sp,
  //                             color: Color(0xffffffff)),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
