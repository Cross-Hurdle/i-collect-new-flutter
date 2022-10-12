import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/Product%20FindoneModle.dart' as findone;
import 'package:icollekt/Screens/Home/HomePage/Data/Model/HomePage_Modle.dart';

import 'package:icollekt/Model/ProductlikeModle.dart';
import 'package:icollekt/Model/producatunlikeModle.dart';
import 'package:icollekt/Screens/Product%20cards/ProductComment.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Presentation/Widgets/Profilevideo.dart';
import 'package:icollekt/Services/Provider.dart';
import '../Profile/ProfilePost/Presentation/Widgets/PostcommentContainer.dart';
import '../cart/Service/CartRepository.dart';
import '../chat/yourOffers/OfferScreen.dart';

// ignore: must_be_immutable
class ProductCards extends ConsumerStatefulWidget {
  String? image;
  bool? boolstaus;
  String? price;
  String? title;
  String? hastag;
  String? description;
  bool? status;
  int? likecount;
  List? productlist;

  var producttype;
  var id;
  ProductCards(
      {Key? key,
      this.boolstaus,
      this.price,
      this.title,
      this.image,
      this.description,
      this.hastag,
      this.likecount,
      this.productlist,
      this.producttype,
      this.id})
      : super(key: key);

  @override
  _ProductCardsState createState() => _ProductCardsState();
}

class _ProductCardsState extends ConsumerState<ProductCards> {
  // bool isliked= false;
  //  int _current = 0;
  final List<String> images = [
    "Assets/Images/card.png",
    "Assets/Images/card.png",
    "Assets/Images/card.png",
    "Assets/Images/card.png",
  ];
  @override
  void initState() {
    getfindProduct();
    getProduct();
    // print( productResponse!.finaloutput[0].thumbnailImg);
    //ref.read(hastagproductcardprov).hastag='';
    // gethastagProduct(ref.read(hastagproductcardprov));
    super.initState();
  }

  ScrollController scrollController = ScrollController();
  TextEditingController offercontroller = TextEditingController();
  String emptyData = "HasData";
  reset() {}

  HomePageresponse? productResponse;
  bool isstatus = false;
  Future getProduct() async {
    productResponse =
        await AuthRepository().getProduct(userid: preferences.getInt('Userid'));
    isstatus = true;
//print( productResponse!.finaloutput[6].thumbnailImg);
    setState(() {});
  }

  validation() {
    if (offercontroller.text.contains(
          RegExp(r'[0-9]',
              unicode: true,
              dotAll: true,
              multiLine: true,
              caseSensitive: false),
        ) ==
        true) {
      makeoffer();
      Navigator.pop(context);
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

  Future makeoffer() async {
    // load=true;
    print(offercontroller.text);
    if (offercontroller.text.isEmpty) {
      final offerResponse = await AuthRepository().getMakeoffer(
          buyerid: preferences.getInt('Userid'),
          makeprice: 0,
          productid: oneproductResponse!.product.id);
      if (offerResponse['code'] == true) {
        makeanOffer(context);
        // Navigator.pop(context);
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
        makeanOffer(
          context,
        );
      }
    } else {
      final offerResponse = await AuthRepository().getMakeoffer(
          buyerid: preferences.getInt('Userid'),
          makeprice: offercontroller.text,
          productid: oneproductResponse!.product.id);
      if (offerResponse['code'] == true) {
        Navigator.pop(context);
        confirmation(context);

        // makeanOffer(context);
      } else {
        print('123hh');
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
    final cartResponse = await CartRepository().cart(
        userid: preferences.getInt('Userid'),
        productid: oneproductResponse!.product.id);
    pushNewScreen(
      context,
      screen: Cart(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
 print(cartResponse);
    setState(() {});
  }

  FocusNode focusNode = FocusNode();
// reset(){
//   productResponse!.finaloutput.clear();
//   setState(() {

//   });
// }
// bool  status=false;
// gethastagProduct(HastagproductcardData hastagprov)async{
//   final productResponse = await  CollectionRepository(). gethastagproductcard(widget.id);
//     hastagprov.hastag    =productResponse.hashtag;
//     status =true;
//   setState(() {

//   });
// //   if(productResponse.hashtag != null){
// //   //   homedata.addAll(productResponse.hashtag);
// // // productResponse.hashtag.forEach((element) {
// // //           setState(() {
// // //             productList.add(element.description);
// // //           });
// // //         //  print('$productList');
// // //     });
// //   }
// }
  int count = 0;
  ProductlikeModle? allproductlikeresponse;
  getallLikeresponse() async {
    allproductlikeresponse =
        await AuthRepository().getproductlikeData(productid: widget.id);
    //allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:ref.read(viewgroupprov).postid!.toInt());
//  print( 'sdfsdsf${allpostlikeresponse!.likeData[0].status}');
//  print( 'asdasdadasd${widget.commentid}');
//  print(allpostlikeresponse!.likeData[0].likecount);
    if (mounted) {
      setState(() {
        print('object');
        //printAmber(allproductlikeresponse);
        widget.boolstaus = true;
        // allpostlikeresponse!.likeData.forEach((element) {
        //   if (element.postId==widget.commentid) {
        //     print(ref.read(viewgroupprov).postid!.toInt());
        //     count=element.likecount;
        //   }
        // });
      });
    }
  }

  bool isliked = false;
  bool isonestatus = false;
  findone.ProductFindoneResponse? oneproductResponse;
  Future getfindProduct() async {
    oneproductResponse = await GroupAndChatRepository()
        .getfindoneproductResponse(productid: widget.id);
    isonestatus = true;
//print(oneproductResponse!.product.hashtags);
    setState(() {});
  }

//LikeDataResponse?
  ProductUnlikeModle? allUnproductlikeresponse;
  getallUnLikeresponse() async {
    // postresponse!.userData.forEach((element) {
    //     ref.read(viewgroupprov).postid=  element.id;
    //   });
    allUnproductlikeresponse =
        await AuthRepository().getproductUnlikeData(productid: widget.id);
    print(allUnproductlikeresponse);
    // print( 'asdasdadasd${widget.commentid}');
    if (mounted) {
      setState(() {
        widget.boolstaus = false;
        //  allUnpostlikeresponse!.likeData.forEach((element) {
        //    if (element.postId==widget.commentid) {
        //     print(ref.read(viewgroupprov).postid!.toInt());
        //     count=element.likecount;
        //   }
        // });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      //backgroundColor: ,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Builder(builder: (context) {
              if (!isonestatus) {
                return Container(
                    height: 50.h,
                    child: Center(child: CircularProgressIndicator()));
              } else
              // print( oneproductResponse!.product.likecount);
              // setState(() {

              // });
              if (oneproductResponse!.product.likeProducts.isNotEmpty) {
                count = oneproductResponse!.product.likecount;
                oneproductResponse!.product.likeProducts.forEach((element) {
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

              return StreamBuilder(
                  stream: getfindProduct().asStream(),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        Container(
                          //margin: EdgeInsets.all(10),
                          color: Colors.black,
                          width: double.infinity,
                          height: 380,
                          child: carousel(),
                        ),
                        content(ref.watch(profileproductdataprov),
                            ref.watch(hastagproductcardprov)),
                              commented(
                                        oneproductResponse!.product.productsComments),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    top: 15, bottom: 0, left: 20),
                                // width: 44.w,
                                child: Text(
                                  "Other pieces you may like",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Gilroy",
                                      fontSize: 14.sp,
                                      color: Color(0xff1A1A1A)),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 15),
                              child: Builder(builder: (context) {
                                if (!isstatus) {
                                  return Text("0 item");
                                } else
                                  return productResponse!.finaloutput.length !=
                                          0
                                      ? Text(
                                          "${productResponse!.finaloutput.length} items")
                                      : Text("0 item");
                              }),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 350,
                          // width: 300,
                          child: Builder(builder: (context) {
                            if (!isstatus) {
                              return Container(
                                  height: 50.h,
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            } else
                              return productResponse!.finaloutput.length != 0
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          productResponse!.finaloutput.length,
                                      itemBuilder: (context, index) {
                                        //   print(productResponse!.finaloutput[index].productType);
                                        return Suggestion(
                                            title: productResponse!
                                                .finaloutput[index].name,
                                            price: productResponse!
                                                .finaloutput[index].unitPrice
                                                .toString(),
                                            image: productResponse!
                                                .finaloutput[index]
                                                .thumbnailImg,
                                            description: productResponse!
                                                .finaloutput[index].description,
                                            hastags: productResponse!
                                                .finaloutput[index].tags,
                                            productlist:
                                                productResponse!.finaloutput,
                                            producttype: productResponse!
                                                .finaloutput[index].productType,
                                            id: productResponse!
                                                .finaloutput[index].id);
                                      })
                                  : Container(
                                      child: Center(child: Text('No data')));
                          }),
                        )
                      ],
                    );
                  });
            }),
          ),
          if (load)
            Container(
              color: Colors.black.withOpacity(0.5),
              height: double.infinity,
              width: double.infinity,
              child: Center(child: CircularProgressIndicator()),
            )
        ],
      ),
    );
  }

  Widget content(ProfileproductData product, HastagproductcardData hastagprov) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    //  color: Colors.red,
                    margin: EdgeInsets.only(top: 10, bottom: 0, left: 20),
                    width: double.infinity,
                    child: Text(
                      "${oneproductResponse!.product.name}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Gilroy",
                          fontSize: 15.sp,
                          color: Color(0xff1A1A1A)),
                    )),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  //width: 60.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      oneproductResponse!.product.unitPrice == 0
                          ? Container()
                          : Text(
                              '\$ ${oneproductResponse!.product.unitPrice} USD',
                              // '#casinochip #chipcollection #caesarspalace',

                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Gilroy',
                                  color: Color(0xff591B4C),
                                  fontSize: 14.sp),
                            ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 5, bottom: 0, left: 12),
                  width: double.infinity,
                  child: Text(
                    '${oneproductResponse!.product.hashtags}',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Gilroy",
                        fontSize: 12.sp,
                        color: Color(0xff1A1A1A)),
                  )
                  //  Text(
                  //    "${widget.hastag}",
                  //  style: TextStyle(
                  //    fontWeight: FontWeight.w400,
                  //    fontFamily: "Gilroy",
                  //    fontSize: 13.sp,
                  //    color: Color(0xff1A1A1A)
                  //  ),
                  //  )
                  ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Container(
                    margin: EdgeInsets.only(top: 5, left: 12),
                    width: double.infinity,
                    child: HtmlWidget(
                      "${oneproductResponse!.product.description}",
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Gilroy",
                          fontSize: 12.sp,
                          color: Color(0xff1A1A1A)),
                    )),
              ),
            ),
            //  HtmlWidget('${widget.description}'),
          ],
        ),
        Builder(builder: (context) {
          if (oneproductResponse!.product.userId !=
              preferences.getInt('Userid')) {
            return Row(
              children: [
                oneproductResponse!.product.productType == 2
                    ? button(context)
                    : Container(),

                //   product.producttype==2?
                //  button():Container()
              ],
            );
          } else {
            return Container();
          }
        }),
        Builder(builder: (context) {
          if (oneproductResponse!.product.userId !=
              preferences.getInt('Userid')) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                oneproductResponse!.product.productType == 1
                    ? button1()
                    : Container(),
              ],
            );
          } else {
            return Container();
          }
        })
      ],
    );
  }
Widget commented(List<findone.ProductsComment> commentes) {
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
            child: Container(
              height: 100,
              child: Center(child: Text('No Comments'))),
          );
  }
  Widget button(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // confirmation(context);
        //  print('123');
        makeoffer();
        setState(() {});

        //makeanOffer(context);
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

  Widget button1() {
    return InkWell(
      onTap: () {
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

  Widget carousel() {
    try {
      if (oneproductResponse!.product.likeProducts.isNotEmpty) {
        count = oneproductResponse!.product.likeProducts[0].likes;
        oneproductResponse!.product.likeProducts.forEach((element) {
          if (element.userId == preferences.getInt('Userid') &&
              element.status == 1) {
            isliked = true;
            //  print('111100${      element.status}');
          } else {
            // print('1111${      element.status}');
            isliked = false;
          }
        });
        // print('object1');
      } else {
        count = 0;
        isliked = false;
        //    print('object2');
      }
    } catch (e) {
      print(e);
    }
    return Builder(
      builder: (context) {
        final double height = MediaQuery.of(context).size.height;
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,

                enableInfiniteScroll: false,
                //autoPlay: true,
              ),
              items:
                  // images
                  oneproductResponse!.product.photos.map((item) {
                //  FlickManager flickManager;

                // print(item.split('.').last);
                return Container(
                  child: Center(
                    child: Builder(builder: (context) {
                      if (item.split('.').last == "png" ||
                          item.split('.').last == "jpg" ||
                          item.split('.').last == "jpeg" ||
                          item.split('.').last == "web") {
                        return CachedNetworkImage(
                          imageUrl: item,
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

                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        );
                      }
                      // else if(item.split('.').last=="png"){
                      //   return Container();
                      // }
                      else {
                        return Container(
                            color: Colors.black,
                            child: ProfileVideoPlayerScreen(
                                url: item, scrollController: scrollController));
                      }
                    }),
                  ),
                );
              }).toList(),
            ),
            Column(children: [
              GestureDetector(
                onTap: () {
                  setState(() {});

                  //print(isliked);
                  if (isliked) {
                    getallUnLikeresponse();
                    // isliked=false;
                  } else {
                    // isliked=true;
                    getallLikeresponse();
                    //    ref.read(viewgroupprov).postid=widget.postid;
                    //  getallLikeresponse();
                  }
                },
                child: isliked == true
                    ? Padding(
                        padding: EdgeInsets.only(top: 13.0, right: 4),
                        child: SvgPicture.asset(
                          "Assets/Images/Tag.svg",
                          width: 12.w,
                        ),
                      )
                    : Padding(
                        padding:
                            EdgeInsets.only(top: 13.0, right: 4, bottom: 4),
                        child: CircleAvatar(
                            backgroundColor: Colors.grey[900],
                            radius: 18,
                            child: Image.asset(
                              "Assets/Images/Layer 1.png",
                            )),
                        // CircleAvatar(
                        //  backgroundColor: Colors.grey[900],radius: 17,),
                      ),
              ),
              //  Container(
              //    margin: EdgeInsets.only(top: 2.h,right: 2.w,bottom: 1.h),
              //    child: CircleAvatar(
              //      backgroundColor: Colors.white,
              //      child: Center(
              //        child: IconButton(
              //                            onPressed: (){
              //                            setState(() {

              //                             });
              //                      print(widget.boolstaus);
              //                       if(widget.boolstaus!){
              //                             getallUnLikeresponse();
              //                            // isliked=false;
              //                        }else{
              //                            // isliked=true;
              //                              getallLikeresponse();
              //                                           //    ref.read(viewgroupprov).postid=widget.postid;
              //                                               //  getallLikeresponse();
              //                           }
              //                            },
              //                            icon: Icon(Icons.favorite),color:widget.boolstaus==true?Colors.red: Colors.grey,iconSize: 24,),
              //      ),
              //    ),
              //  ),

              Text(
                '$count',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                    fontSize: 16,
                    color: Colors.white),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      final comment = ref.watch(commentinfo);
         comment.postname=oneproductResponse!.product.name;
         comment.id=oneproductResponse!.product.id;
          comment.subject=oneproductResponse!.product.description;
           comment.profile=oneproductResponse!.product.thumbnailImg;
          // comment.dateandtime=oneproductResponse!.product.
                      setState(() {});
                      pushNewScreen(
                        context,
                        screen: ProductComment(id:oneproductResponse!.product.id ,),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    // child: isliked == true
                    //     ? Padding(
                    //         padding: EdgeInsets.only(top: 13.0, right: 4),
                    //         child: SvgPicture.asset(
                    //           "Assets/Images/Tag.svg",
                    //           width: 12.w,
                    //         ),
                    //       )
                    //     :
                    child: Padding(
                      padding: EdgeInsets.only(top: 13.0, right: 4, bottom: 4),
                      child: CircleAvatar(
                          backgroundColor: Colors.grey[900],
                          //  radius: 18,
                          child: Icon(Icons.comment)
                          //  Image.asset(
                          //   "Assets/Images/Layer 1.png",
                          // )
                          ),
                      // CircleAvatar(
                      //  backgroundColor: Colors.grey[900],radius: 17,),
                    ),
                  ),
                 
                ],
              ),
              // Positioned(
              //                // bottom: 295,
              //                 right: 4,
              //                 top: 18,
              //                 child: Image.asset("Assets/Images/inactive.png",),
              //              ),_
            ])
          ],
        );
      },
    );
  }

  makeanOffer(
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
                                        '${oneproductResponse!.product.thumbnailImg}',
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 60.w,
                                      child: Text(
                                        '${oneproductResponse!.product.name}',
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
                                        '${oneproductResponse!.product.description}',
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
                                    '\$ ${oneproductResponse!.product.unitPrice}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  text: ' ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Tips: ',
                                      // '#casinochip #chipcollection #caesarspalace',\
                                      // textAlign: T,
                                      style: TextStyle(
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

                            validation();
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
            ));
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

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kBackground,
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Color(0xff1A1A1A)),
        onPressed: () => Navigator.of(context).pop(),
      ),
      centerTitle: true,
      //   title: Text("Short dress",
      //    style: TextStyle(
      //     fontWeight: FontWeight.w600,
      //      fontFamily: "Gilroy",
      // fontSize: 15.6.sp,
      //  color: Color(0xff1A1A1A)
      //   ),),
      actions: [
        //     Image.asset("Assets/Images/Share.png",
        //  width: 12.w,
        //   ),
      ],
      elevation: 1,
    );
  }
}

class Suggestion extends ConsumerStatefulWidget {
  final List? productlist;
  final String? image;
  final String? price;
  final String? title;
  final String? hastags;
  final String? description;
  final bool? status;
  final List<LikeProduct>? likelist;
  final int? likecount;
  final producttype;
  final id;
  Suggestion(
      {Key? key,
      this.price,
      this.likecount,
      this.likelist,
      this.status,
      this.title,
      this.image,
      this.hastags,
      this.description,
      this.productlist,
      this.producttype,
      this.id})
      : super(key: key);
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends ConsumerState<Suggestion> {
  @override
  void initState() {
    super.initState();
    //  mapproduct() ;

    // print("123asdsadsad${widget.productlist}");
  }

  bool isliked = false;
  int count = 0;
  ProductlikeModle? allproductlikeresponse;
  getallLikeresponse() async {
    allproductlikeresponse =
        await AuthRepository().getproductlikeData(productid: widget.id);

    if (mounted) {
      setState(() {
        //   print('object');
        // printAmber(allproductlikeresponse);
        isliked = true;
      });
    }
  }

//LikeDataResponse?
  ProductUnlikeModle? allUnproductlikeresponse;
  getallUnLikeresponse() async {
    allUnproductlikeresponse =
        await AuthRepository().getproductUnlikeData(productid: widget.id);
    //print(allUnproductlikeresponse);
    // print( 'asdasdadasd${widget.commentid}');
    if (mounted) {
      setState(() {
        isliked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (widget.likelist!.isNotEmpty) {
        count = widget.likelist![0].likes;
        widget.likelist!.forEach((element) {
          if (element.userId == preferences.getInt('Userid') &&
              element.status == 1) {
            isliked = true;
            //  print('111100${      element.status}');
          } else {
            // print('1111${      element.status}');
            isliked = false;
          }
        });
        print('object1');
      } else {
        count = 0;
        isliked = false;
        print('object2');
      }
    } catch (e) {
      print(e);
    }
    // var hastagprov =ref.watch(hastagproductcardprov);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductCards(
                    boolstaus: isliked,
                    title: widget.title,
                    price: widget.price,
                    image: widget.image,
                    description: widget.description,
                    hastag: widget.hastags,
                    productlist: widget.productlist,
                    producttype: widget.producttype,
                    id: widget.id,
                    likecount: count)));
      },
      child: Container(
        // height:10.h ,
        width: 48.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
        child: Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisSize: MainAxisSize.min,
              // verticalDirection: VerticalDirection.down,
              children: <Widget>[
                // Container(
                //    height: 26.h,
                //   width: double.infinity,
                //   child: Image.asset("Assets/Images/chips.png",fit: BoxFit.fill,
                //   // height: 215.0,
                //     ),
                // ),
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 26.h,
                      decoration: BoxDecoration(
                          //  borderRadius: BorderRadius.circular(20),

                          ),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero,
                        ),
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
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {});
                          //   print(isliked);
                          if (isliked) {
                            getallUnLikeresponse();
                            // isliked=false;
                          } else {
                            // isliked=true;
                            getallLikeresponse();
                            //    ref.read(viewgroupprov).postid=widget.postid;
                            //  getallLikeresponse();
                          }
                        },
                        child: isliked == true
                            ? Padding(
                                padding: EdgeInsets.only(top: 13.0, right: 11),
                                child: SvgPicture.asset(
                                  "Assets/Images/Tag.svg",
                                  width: 12.w,
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(top: 13.0, right: 11),
                                child: Image.asset(
                                  "Assets/Images/inactive.png",
                                ),
                                // CircleAvatar(
                                //  backgroundColor: Colors.grey[900],radius: 17,),
                              ),
                      );
                      //  IconButton(
                      //    onPressed: (){
                      //       setState(() {

                      //           });
                      //    print(isliked);
                      //     if(isliked){
                      //           getallUnLikeresponse();
                      //          // isliked=false;
                      //      }else{
                      //          // isliked=true;
                      //            getallLikeresponse();
                      //                         //    ref.read(viewgroupprov).postid=widget.postid;
                      //                             //  getallLikeresponse();
                      //         }
                      //    },
                      //    icon: Icon(Icons.favorite),color:isliked==true?Colors.red: Colors.white,iconSize: 26,);
                    }),
                    // Builder(
                    //      builder: (context) {
                    //        return
                    //        IconButton(
                    //          onPressed: (){
                    //             setState(() {

                    //                 });
                    //          print(isliked);
                    //           if(isliked){
                    //                 getallUnLikeresponse();
                    //                // isliked=false;
                    //            }else{
                    //                // isliked=true;
                    //                  getallLikeresponse();
                    //                               //    ref.read(viewgroupprov).postid=widget.postid;
                    //                                   //  getallLikeresponse();
                    //               }
                    //          },
                    //          icon: Icon(Icons.favorite),color:isliked==true?Colors.red: Colors.white,iconSize: 26,);
                    //      }
                    //    ),
                  ],
                ),

                new Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 44.w,
                              child: Text(
                                "${widget.title}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Gilroy",
                                    fontSize: 16,
                                    color: Color(0xff1A1A1A)),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "USD\$ ${widget.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Gilroy",
                                fontSize: 16,
                                color: Color(0xff1A1A1A)),
                          ),
                          SizedBox(
                            width: 19,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            //  Positioned(
            //           bottom: 200.sp,
            //           right: 1.sp,
            //           top: 2,
            //           child: Image.asset("Assets/Images/inactive.png",),
            //         ),
            //  Positioned(
            //           top: 22.5.h,
            //           right: 1.50,
            //           child: CircleAvatar(
            //             radius: 25,
            //             backgroundColor: Color(0xff2A2C36),
            //             child:  Column(mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 SizedBox(height: 6,),
            //                 Image.asset("Assets/Images/Tag.png",),
            //               ],
            //             ),
            //           ),
            //         )
          ],
        ),
      ),
    );
  }
}
