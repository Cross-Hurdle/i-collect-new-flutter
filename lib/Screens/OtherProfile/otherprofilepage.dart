import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/OtherProfile/Widget/otherFollowersFollowing.dart';
import 'package:icollekt/Screens/chat/yourOffers/OfferScreen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart'
    as htmltext;
import '../../Services/Provider.dart';
import '../Profile/ProfilePost/Data/Model/ProfilePostModle.dart';
import '../Profile/ProfilePost/Presentation/Page/ProfilePhotos.dart';
import '../Profile/ProfilePost/Presentation/Widgets/PostcommentContainer.dart';
import '../Profile/ProfilePost/Presentation/Widgets/ProfilePostLike.dart';
import '../Profile/Service/ProfileRepositoryService.dart';
import '../cart/Service/CartRepository.dart';
import 'Model/FollowCountModle.dart';
import 'Widget/OtherProfileTopInfo.dart';

class Otherprofilepage extends ConsumerStatefulWidget {
  final List? name;
  const Otherprofilepage({Key? key, this.name}) : super(key: key);

  @override
  ConsumerState<Otherprofilepage> createState() => _OtherprofilepageState();
}

class _OtherprofilepageState extends ConsumerState<Otherprofilepage> {
  @override
  void initState() {
    super.initState();
    // print(ref.read(otherprofile).id);
    getprofileProduct();
    getcount();
    //getprofilepic();sxz
    // print(homedata);
  }

  ScrollController scrollController = ScrollController();
  TextEditingController offercontroller = TextEditingController();
  FocusNode focusNode = FocusNode();
  var count = 0;
    bool isliked = false;
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

  //Profileimage View
  var homedata = '';
  var pic = '';
  getprofilepic() async {
    final productResponse =
        await AuthRepository().getprofile(id: ref.read(otherprofile).id
            // preferences.getInt('Userid')
            );

    try {
      homedata = productResponse.profilePic;
      pic = productResponse.bannerImg;
    } catch (e) {
      print(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

  validation(int index) {
    if (offercontroller.text.contains(
          RegExp(r'[0-9]',
              unicode: true,
              dotAll: true,
              multiLine: true,
              caseSensitive: false),
        ) ==
        true) {
      makeoffer(index);
//  Navigator.pop(context);
      //print('object11');
    } else {
      showToast('Please Enter Offer Price',
          textStyle: TextStyle(color: Colors.black),
          backgroundColor: Colors.grey[300],
          context: context,
          borderRadius: BorderRadius.circular(10),
          animation: StyledToastAnimation.size,
          reverseAnimation: StyledToastAnimation.size,
          axis: Axis.horizontal,
          position: StyledToastPosition.center,
          animDuration: Duration(milliseconds: 300),
          duration: Duration(seconds: 2),
          curve: Curves.linear,
          reverseCurve: Curves.linear);
      print('object1122');
    }
  }

  bool load = false;
  int? postid;
  Future makeoffer(int i) async {
    // load=true;
    print(offercontroller.text);
    if (offercontroller.text.isEmpty) {
      final offerResponse = await AuthRepository().getMakeoffer(
          buyerid: preferences.getInt('Userid'),
          makeprice: 0,
          productid: postid);
      print(postid);
      if (offerResponse['code'] == true) {
        makeanOffer(context, i);
      } else if (offerResponse['code'] == false &&
          offerResponse['message'] ==
              "you already applied to bargain this product") {
        print('123hh');
        pushNewScreen(
          context,
          screen: OfferScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      } else {
        makeanOffer(context, i);
      }
    } else {
      final offerResponse = await AuthRepository().getMakeoffer(
          buyerid: preferences.getInt('Userid'),
          makeprice: offercontroller.text,
          productid: postid);
      if (offerResponse['code'] == true) {
        Navigator.pop(context);
        confirmation(context);
        // Navigator.pop(context);
        // makeanOffer(context);
      } else {
        pushNewScreen(
          context,
          screen: OfferScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      }
    }

//isstatus=true;
//print( productResponse!.finaloutput[6].thumbnailImg);
    setState(() {});
  }

  Future addtocart() async {
    final cartResponse = await CartRepository()
        .cart(userid: preferences.getInt('Userid'), productid: postid);
    pushNewScreen(
      context,
      screen: Cart(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
    print(cartResponse);
    setState(() {});
  }

  Future<void> _loadData() async {
    print(homedata);
    print(pic);
    print(ref.read(otherprofile).id);
    getprofileProduct();
    getprofilepic();
  }

  ProfilePostModle? profilePostModle;
  bool profilestatus1 = false;
  Future getprofileProduct() async {
    profilePostModle =
        await AuthRepository().getProfilecollection(ref.read(otherprofile).id);

    profilestatus1 = true;
    setState(() {});

//profilestatus1 =false;
  }

  FolloweCountModle? followeCountModle;
  Future getcount() async {
    followeCountModle = await ProfileRepository().getcountResponse(
      preferences.getInt('Userid'),
      ref.read(otherprofile).id,
    );
    print('status  count ${ref.read(otherprofile).id}');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              OtherProfileTopInfo(),
              //  profiletop(context),
              //  SizedBox(height: 1.h,),
              //  profilename(),
              // // Text('${ preferences.getInt('Userid')}'),
              //    SizedBox(height: 2.h,),
              StreamBuilder(
                  stream: getcount().asStream(),
                  builder: (context, snapshot) {
                    return OtherfollowerFollowing(
                      statusbool: followeCountModle?.message,
                      status: followeCountModle?.followStatus ?? 0,
                      followcount: followeCountModle?.followersCount ?? 0,
                      followingcount: followeCountModle?.followingCount ?? 0,
                      postcount: followeCountModle?.productCount ?? 0,
                      id: ref.read(otherprofile).id,
                    );
                  }),
              //  SizedBox(height: 2.h,),
              //  CustomButton(title: 'Edit Profile', ontapped: ()=>About(feature: 'feature',), nav: false),
              SizedBox(
                height: 2.h,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 1, left: 20),
                  child: Row(
                    children: [
                      Text(
                        'My Products',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff1A1A1A),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            fontFamily: 'Gilroy'),
                      ),
                    ],
                  ),
                  //child: Icon( Icons.vertical_split_outlined, ),
                  width: double.infinity,
                  height: 50,
                  color: Colors.white),
              Container(
                  margin: EdgeInsets.only(bottom: 1, left: 10, top: 0),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            InkWell(
                              //minWidth: 30.w,
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: ProfilePhotos(
                                    id: ref.read(otherprofile).id,
                                  ),
                                  withNavBar:
                                      true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },

                              child: Container(
                                width: 30.w,
                                //  height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Text(
                                    'Photos',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff1A1A1A),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                        fontFamily: 'Gilroy'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              //minWidth: 30.w,
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: About(),
                                  withNavBar:
                                      true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },

                              child: Container(
                                width: 30.w,
                                //  height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Text(
                                    'About',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff1A1A1A),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                        fontFamily: 'Gilroy'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                  //child: Icon( Icons.vertical_split_outlined, ),
                  width: double.infinity,
                  height: 35,
                  color: Colors.white),
              // ProfilePost()
              explore()
              //profilepost()
            ])),
          ],
        ),
      ),
    );
  }

  Widget explore() {
    if (!profilestatus1) {
      return Container(
          height: 50.h, child: Center(child: CircularProgressIndicator()));
    } else {
      return StreamBuilder(
          stream: getprofileProduct().asStream(),
          builder: (context, snapshot) {
            return profilePostModle!.products.isNotEmpty
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: profilePostModle!.products.length,
                    itemBuilder: (context, index) {
                      return post(context, index);
                    },
                  )
                : Container(height: 200, child: Center(child: Text('No Post')));
          });
    }
  }

  Widget post(context, int index) {
    //   final state = ref.watch(getprofileproduct);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductCards(
                    //  likecount: widget.likecount,
                    //    title: widget.title,
                    //       price: widget.price,
                    //      image: widget.image,
                    //      description: widget.description,
                    //      hastag: widget.hastags,
                    //      productlist: widget.productlist,
                    //      producttype:widget.producttype,
                    id: profilePostModle!.products[index].id)));
        //  print('month');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0.sp, horizontal: 1.sp),
        child: Column(
          children: [
            Container(
              // height: 50.h,
              // color: Colors.yellow,
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
                                      imageUrl: '${ref.watch(otherprofile).dp}',

                                      ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
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
                                              // colorFilter:
                                              //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
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
                                //  CircleAvatar(
                                //    radius: 5.5.w,
                                //    child: Image.asset( "Assets/Images/pic.png",fit: BoxFit.contain,width: 12.w,),
                                //  ),

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
                                            '${ref.watch(otherprofile).name}',
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
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                CachedNetworkImage(
                  imageUrl: '${profilePostModle!.products[index].thumbnailImg}',
                  placeholder: (context, url) => Container(
                      height: 35.5.h,
                      width: double.infinity,
                      child: Center(child: new CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Image.asset(
                    "Assets/Images/Portrait_Placeholder.png",
                  ),
                ),
               Builder(builder: (context) {
                                        int? count;
                                        bool islike = false;
                                        if (profilePostModle != null) {
                                          profilePostModle?.products[index].likeProducts
                                              .forEach((element) {
                                            if (element.id ==
                                               ref.watch(productpostprov).productid ) {
                                              count = element.likes;
                                              islike = element.status == 0
                                                  ? false
                                                  : true;
                                            } else {
                                              count = 0;
                                            }
                                          });
                                        } else {
                                          count = 0;
                                          islike = false;
                                        }
                                       return
                                         ProductLIke(
                  name: '${profilePostModle!.products[index].user.name}', 
                  pic: '${profilePostModle!.products[index].user.profilePic}', 
                  postid: profilePostModle!.products[index].id,
                   subject: '${profilePostModle!.products[index].description}',
                   likes: profilePostModle!.products[index].likeProducts, 
                   index: index, 
                  // count: count!,
                   islike: islike,
                  
                );
                                    })
                // profilePostModle!.products[index].productType == 0
                //     ? Container()
                //     : Container(
                //         margin: EdgeInsets.only(top: 10, right: 10),
                //         decoration: BoxDecoration(
                //             color: Color(0xff591B4C),
                //             borderRadius:
                //                 BorderRadiusDirectional.circular(100)),
                //         height: 50,
                //         width: 50,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               'Price',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.w400,
                //                   fontFamily: 'Gilroy',
                //                   fontSize: 8.sp),
                //             ),
                //             Center(
                //               child: Text(
                //                 '\$ ${profilePostModle!.products[index].unitPrice}',
                //                 style: TextStyle(
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.w400,
                //                     fontFamily: 'Gilroy',
                //                     fontSize: 8.sp),
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
              ],
            ),
            // carousel(
            //   index,
            // ),
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
                        profilePostModle!.products[index].productType == 0
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
                                        'Price \$ ${profilePostModle!.products[index].unitPrice}',
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
                                child: profilePostModle!
                                            .products[index].photos.length >=
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
                          '${profilePostModle!.products[index].name}',
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
                          '${profilePostModle!.products[index].description} '
                          '${profilePostModle!.products[index].hashtags}',
                          //'#casinochip #chipcollection #caesarspalace',
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy',
                              fontSize: 10.sp),
                        ),
                      )
                    ],
                  ),
                   commented(
                                        profilePostModle!.products[index].productsComments),

                  // Row(
                  //   children: [
                  //     profilePostModle!.products[index].productType == 2
                  //         ? button(context, index)
                  //         : Container(),

                  //     //   product.producttype==2?
                  //     //  button():Container()
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     profilePostModle!.products[index].productType == 1
                  //         ? button1(context, index)
                  //         : Container(),
                  //   ],
                  // ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          timeAgo(profilePostModle!.products[index].createdAt),
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
 Widget commented(List<ProductsComment> commentes) {
    return commentes.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: commentes.length,
            itemBuilder: (context, index) {
              if (commentes[index].productsLikeComments.isNotEmpty) {
                count = commentes[index].productsLikeComments[0].likecount;
                commentes[index].productsLikeComments.forEach((element) {
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
              return ProfilePostCommentContainer(
                index: index,
                commentid: commentes[index].id,
                status: isliked,
                listcount: count,
                //commentes[index].likeComments[0].likecount,
                commentcolor: false,
                profilename: commentes[index].user.name,
                profilepic: commentes[index].user.profilePic,
                comment: commentes[index].comment,
                likelist:[],
                time: commentes[index].createdAt,
              );
            })
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Center(child: Text('No Comments'))),
          );
  }
  Widget button(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        postid = profilePostModle!.products[index].id;
        makeoffer(index);
        setState(() {});
        // focusNode.requestFocus();
        // makeanOffer( context ,index);
      },
      child: Container(
        margin: EdgeInsets.only(left: 19, top: 10),
        width: 90.w,
        height: 50,
        // width: 37.w,
        //height: 39,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Color(0xff591B4C)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Text(
              "Make an Offer",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Gilroy",
                  fontSize: 12.sp,
                  color: Color(0xffffffff)),
            ),
          ),
        ),
      ),
    );
  }

  Widget button1(context, int index) {
    return InkWell(
      onTap: () {
        postid = profilePostModle!.products[index].id;
        addtocart();

        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
        // onPressed(function: onpressedtitle);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 90.w,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(5),
            color: Color(0xff591B4C)),
        child: Center(
            child: Text(
          'ADD TO CART',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Gilroy",
              fontSize: 16),
        )),
      ),
    );
  }

  Widget carousel(int index) {
    // final state = ref.watch(getprofileproduct);
    return Builder(
      builder: (context) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            CachedNetworkImage(
              imageUrl: profilePostModle!.products[index].thumbnailImg,
              //"http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
              // "${widget.image}",
              fit: BoxFit.fill,
              imageBuilder: (context, imageProvider) => Container(
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

              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // CarouselSlider(
            //   options: CarouselOptions(
            //     // height: height,
            //     enableInfiniteScroll: false,
            //     viewportFraction: 1.0,
            //     enlargeCenterPage: false,
            //     autoPlay: false,
            //   ),
            //   items:
            //       //media
            //       profilePostModle!.products[index].photos.map((item) {
            //     return Container(
            //       child: Center(
            //         child: Builder(builder: (context) {
            //           // print('object');
            //           if (item.split('.').last == "png" ||
            //               item.split('.').last == "jpg" ||
            //               item.split('.').last == "jpeg" ||
            //               item.split('.').last == "web") {
            //             return CachedNetworkImage(
            //               imageUrl: item,
            //               //"http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
            //               // "${widget.image}",
            //               fit: BoxFit.fill,
            //               imageBuilder: (context, imageProvider) => Container(
            //                 decoration: BoxDecoration(
            //                   // color: Colors.black12.withOpacity(10),
            //                   image: DecorationImage(
            //                     image: imageProvider,
            //                     fit: BoxFit.cover,
            //                     // colorFilter:
            //                     //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
            //                   ),
            //                 ),
            //               ),

            //               progressIndicatorBuilder:
            //                   (context, url, downloadProgress) =>
            //                       CircularProgressIndicator(
            //                           value: downloadProgress.progress),
            //               errorWidget: (context, url, error) =>
            //                   Icon(Icons.error),
            //             );
            //           }
            //           // else if(item.split('.').last=="png"){
            //           //   return Container();
            //           // }
            //           else {
            //             return Container(
            //                 width: double.infinity,
            //                 color: Colors.black,
            //                 child: ProfileVideoPlayerScreen(
            //                     url: item, scrollController: scrollController));
            //           }
            //         }),
            //       ),
            //     );
            //   }).toList(),
            // ),
            profilePostModle!.products[index].productType == 0
                ? Container()
                : Container(
                    margin: EdgeInsets.only(top: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Color(0xff591B4C),
                        borderRadius: BorderRadiusDirectional.circular(100)),
                    height: 50,
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy',
                              fontSize: 8.sp),
                        ),
                        Center(
                          child: Text(
                            '\$ ${profilePostModle!.products[index].unitPrice}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Gilroy',
                                fontSize: 8.sp),
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        );
      },
    );
  }

  AppBar buildappbar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackground,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
      centerTitle: true,
      title: Image.asset(
        "Assets/Images/Icollekt.png",
        height: 11.h,
      ),
      elevation: 1,
    );
  }

  makeanOffer(BuildContext context, int index) {
    //  final typestate = ref.watch(getprofileproduct);
    return showModalBottomSheet(
      isScrollControlled: true,
      //   enableDrag: true,
      //   expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          //  margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
            ),
          ),

          // height: 65.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        height: 5,
                        width: 10.w,

                        margin: EdgeInsets.symmetric(vertical: 12.sp),
                        //child:
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.sp),
                    child: Text('Make an Offer',
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff591B4C))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${profilePostModle!.products[index].thumbnailImg}',
                              width: 9.5.h,
                              height: 9.5.h,
                              fit: BoxFit.cover,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    // colorFilter:
                                    //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                  ),
                                ),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Container(
                                      child: Center(
                                          child: CircularProgressIndicator(
                                              value:
                                                  downloadProgress.progress))),
                              errorWidget: (context, url, error) => Image.asset(
                                "Assets/Images/Portrait_Placeholder.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 60.w,
                                child: Text(
                                  '${profilePostModle!.products[index].name}',
                                  // '#casinochip #chipcollection #caesarspalace',

                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Gilroy',
                                      fontSize: 12.sp),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Container(
                                width: 60.w,
                                child: Text(
                                  '${profilePostModle!.products[index].description}',
                                  // '#casinochip #chipcollection #caesarspalace',

                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Gilroy',
                                      fontSize: 11.sp),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '\$ ${profilePostModle!.products[index].unitPrice}',
                              // '#casinochip #chipcollection #caesarspalace',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Gilroy',
                                  fontSize: 10.sp),
                            ),
                          ),
                          // Text('data')
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 90.w,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: Icon(
                                Icons.restore,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Heads up, offering isn\'t buying ',
                                      // '#casinochip #chipcollection #caesarspalace',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Gilroy',
                                          letterSpacing: 1,
                                          fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  width: 70.w,
                                  child: Text(
                                    'If the seller accepts, you\'ll have 24 hours to buy the iterm at your offer price',
                                    // '#casinochip #chipcollection #caesarspalace',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Gilroy',
                                        fontSize: 11.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Your offer',
                        // '#casinochip #chipcollection #caesarspalace',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Gilroy',
                            letterSpacing: 1,
                            fontSize: 13.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 19,
                      ),
                      child: TextField(
                          controller: offercontroller,
                          keyboardType: TextInputType.number,
                          focusNode: focusNode,
                          autofocus: true)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 95.w,
                        child: RichText(
                          text: TextSpan(
                            text: '',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Tips: ',
                                // '#casinochip #chipcollection #caesarspalace',\
                                // textAlign: T,
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Gilroy',
                                    letterSpacing: 1,
                                    fontSize: 13.sp),
                              ),
                              TextSpan(
                                text:
                                    'Try an offer of 5-30% off the current item price',
                                // '#casinochip #chipcollection #caesarspalace',\
                                // textAlign: T,
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Gilroy',
                                    letterSpacing: 1,
                                    fontSize: 11.sp),
                              ),
                              // TextSpan(text: ' world!'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);

                      validation(index);
                      //   makeoffer();
                      //  confirmation( context );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 19, top: 10),
                      width: 90.w,
                      height: 50,
                      // width: 37.w,
                      //height: 39,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff591B4C)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Center(
                          child: Text(
                            "Send Offer",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Gilroy",
                                fontSize: 12.sp,
                                color: Color(0xffffffff)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  confirmation(
    BuildContext context,
  ) {
    //  final typestate = ref.watch(getprofileproduct);
    return showModalBottomSheet(
        isScrollControlled: true,
        //   enableDrag: true,
        //   expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                //  margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),

                //height: 75.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              height: 5,
                              width: 10.w,

                              margin: EdgeInsets.symmetric(vertical: 12.sp),
                              //child:
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          // height: 80,
                          //  color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Make an Offer',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Gilroy",
                                  fontSize: 18.sp,
                                  //color: Color(0xffffffff)
                                ),
                              )
                              //  Container(
                              //    margin: EdgeInsets.all(10),
                              //    width: 95.w,
                              //    child:
                              //  ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'Offer Sent!',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Gilroy",
                                  fontSize: 17.sp,
                                  letterSpacing: 1,
                                  color: Color.fromARGB(255, 20, 93, 24)
                                  //color: Color(0xffffffff)
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'We\'ve let the seller know  about your offer.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Gilroy",
                                fontSize: 12.sp,
                                //color: Color(0xffffffff)
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              // color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.mail, color: Color(0xff591B4C)),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80.w,
                                  child: Text(
                                    'Hold tight for the seller\'s response',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Gilroy",
                                      fontSize: 13.sp,
                                      //color: Color(0xffffffff)
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 80.w,
                                  child: Text(
                                    'The Seller has 24 hours from now to accept or reject your offer . we\'ll let youn know what they decide',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Gilroy",
                                      letterSpacing: 1,
                                      wordSpacing: .5,
                                      fontSize: 11.sp,
                                      //color: Color(0xffffffff)
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //    Row(mainAxisAlignment: MainAxisAlignment.start,
                        //    crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //        Container(
                        //         width: 60,
                        //         height: 60,
                        //        // color: Colors.red,
                        //         child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        //    crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //            SvgPicture.asset("Assets/Images/shop.svg",
                        //  width: 7.w,
                        //   ),
                        //           ],
                        //         ),
                        //        ),
                        //        Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //          children: [
                        //            Container(
                        //              width: 80.w,
                        //              child: Text('Hold tight for the seller\'s respons ddddsssssssssssss sssssss ssssssssssssdddddddddddddddddddddddd sssssssssssssddddddddddd',
                        //               textAlign: TextAlign.start,
                        //               style: TextStyle(
                        //                fontWeight: FontWeight.w500,
                        //               fontFamily: "Gilroy",
                        //                  fontSize: 13.sp,
                        //                   //color: Color(0xffffffff)
                        //                 ),
                        //               ),
                        //            ),
                        //             SizedBox(height: 10,),
                        //            Container(
                        //              width: 80.w,
                        //              child: Text('Hold tight for the seller\'s response',
                        //               textAlign: TextAlign.start,
                        //               style: TextStyle(
                        //                fontWeight: FontWeight.w400,
                        //               fontFamily: "Gilroy",
                        //                  fontSize: 11.sp,
                        //                   //color: Color(0xffffffff)
                        //                 ),
                        //               ),
                        //            ),
                        //          ],
                        //        )
                        //     ],
                        //    ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'You can  See all the offers you\'ve made in the messages tab',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Gilroy",
                                fontSize: 12.sp,
                                //color: Color(0xffffffff)
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            pushNewScreen(
                              context,
                              screen: OfferScreen(),
                              withNavBar:
                                  true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                            //  makeanOffer( context );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 19, top: 10),
                            width: 90.w,
                            height: 50,
                            // width: 37.w,
                            //height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff591B4C)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Center(
                                child: Text(
                                  "See my Offers",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Gilroy",
                                      fontSize: 12.sp,
                                      color: Color(0xffffffff)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ));
  }
}
