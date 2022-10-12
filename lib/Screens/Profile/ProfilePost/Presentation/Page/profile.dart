import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Model/CommentUnlikeModle.dart';
import 'package:icollekt/Model/ProductComment.dart';
import 'package:icollekt/Screens/OtherProfile/Model/FollowCountModle.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Data/Model/ProfilePostModle.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Presentation/Widgets/PostcommentContainer.dart';
import 'package:icollekt/Screens/Profile/Service/ProfileRepositoryService.dart';
import 'package:icollekt/Services/ApiCall.Provider.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart'
    as htmltext;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../../Model/CommentViewModle.dart';
import '../../../../../Model/CommentlikeModle.dart';
import '../../../../Notification/Notification.dart';
import '../Widgets/ProfilePostLike.dart';
import '../Widgets/ProfileTopInfo.dart';

class Profile extends ConsumerStatefulWidget {
  final int? id;
  Profile({Key? key, this.id}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => getcount());
    print('1111');
    getcount();
    getprofileProduct();
    getprofilepic();
    // print(homedata);
  }

  ScrollController scrollController = ScrollController();
  getupdatestausview() async {
    final statusResponse = await ProfileRepository()
        .getnotificationUpdateResponse(
            ref.watch(notificationswitch).isSwitched!,
            ref.watch(notificationswitch).isSwitched1!,
            ref.watch(notificationswitch).isSwitched2!);
    print('d1${statusResponse.deliveryNotification}');
    print('d2${statusResponse.inboxNotification}');
    print('d3${statusResponse.groupNotification}');
    //print('object');

    setState(() {});
  }
  var count = 0;
    bool isliked = false;
  bool status = false;
  FocusNode focusNode = FocusNode();

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
        await AuthRepository().getprofile(id: preferences.getInt('Userid'));

    try {
      homedata = productResponse.profilePic;
      pic = productResponse.bannerImg;
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  Future<void> _loadData() async {
    getcount();
    getprofilepic();
    // print('123  ${followeCountModle?.followersCount}');
  }

  ProfilePostModle? profilePostModle;
  bool profilestatus1 = false;
  Future getprofileProduct() async {
    profilePostModle = await AuthRepository()
        .getProfilecollection(preferences.getInt('Userid'));
    profilestatus1 = true;
    setState(() {});
  }

  bool typestatus = false;
  gettype(var id, var type) async {
    // profilestatus1=false;
    //final statusResponse = await ProfileRepository().getProducttype( ref.read(producttype).id, ref.read(producttype).type);
    final statusResponse = await ProfileRepository().getProducttype(id, type);
    print(statusResponse.message);
    print(statusResponse.status);
    typestatus = true;

    // profilestatus1=statusResponse.status;

    setState(() {});
  }

  FolloweCountModle? followeCountModle;
  Future getcount() async {
    followeCountModle = await ProfileRepository().getcountResponse(
      preferences.getInt('Userid'),
      preferences.getInt('Userid'),
    );
// print(ref.read(otherprofile).id);
    print('123  ${followeCountModle!.followersCount}');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final typestate = ref.watch(getprofileproduct);
    //  final state = ref.watch(getprofileproduct);
    return Scaffold(
      appBar: buildappbar(context),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: Stack(
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  StreamBuilder(
                    stream: getcount().asStream(),
                    builder: (context, snapshot) {
                      return ProfileTopInfo(
                        status: followeCountModle?.followStatus ?? 0,
                        followcount: followeCountModle?.followersCount ?? 0,
                        followingcount: followeCountModle?.followingCount ?? 0,
                        postcount: followeCountModle?.productCount ?? 0,
                      );
                    }
                  ),
                  explore()
                ])),
              ],
            ),
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
            //   print('hii       ${profilestatus1}');

            return profilePostModle!.products.isNotEmpty
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // reverse: true,
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
                                      imageUrl: '$homedata',
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
                                            '${preferences.getString('Name')}',
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
                        Row(
                          children: [
                            profilePostModle!.products[index].productType == 0
                                ? IconButton(
                                    onPressed: () {
                                      option(
                                          context, 'Make an offer', 'Selling',
                                          () {
                                        ref.watch(producttype).id =
                                            profilePostModle!
                                                .products[index].id;
                                        ref.watch(producttype).type = 1;
                                        // gettype();
                                      }, () {
                                        ref.watch(producttype).id =
                                            profilePostModle!
                                                .products[index].id;
                                        ref.watch(producttype).type = 2;
                                        // gettype();
                                      }, index);
                                    },
                                    icon: Icon(Icons.more_horiz))
                                : Container(),
                            profilePostModle!.products[index].productType == 1
                                ? IconButton(
                                    onPressed: () {
                                      option(
                                          context, 'Make an offer', 'Show Case',
                                          () {
                                        ref.watch(producttype).id =
                                            profilePostModle!
                                                .products[index].id;
                                        ref.watch(producttype).type = 0;
                                        //  gettype();
                                      }, () {
                                        ref.watch(producttype).id =
                                            profilePostModle!
                                                .products[index].id;
                                        ref.watch(producttype).type = 2;
                                        //  gettype();
                                      }, index);
                                    },
                                    icon: Icon(Icons.more_horiz))
                                : Container(),
                            profilePostModle!.products[index].productType == 2
                                ? IconButton(
                                    onPressed: () {
                                      option(context, 'Selling', 'Show Case',
                                          () {
                                        ref.watch(producttype).id =
                                            profilePostModle!
                                                .products[index].id;
                                        ref.watch(producttype).type = 0;
                                        // gettype();
                                      }, () {
                                        ref.watch(producttype).id =
                                            profilePostModle!
                                                .products[index].id;
                                        ref.watch(producttype).type = 1;
                                        // gettype();
                                      }, index);
                                    },
                                    icon: Icon(Icons.more_horiz))
                                : Container(),
                          ],
                        )
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
                // ProductLIke(
                //   name: '${profilePostModle!.products[index].user.name}', 
                //   pic: '${profilePostModle!.products[index].user.profilePic}', 
                //   postid: profilePostModle!.products[index].id,
                //    subject: '${profilePostModle!.products[index].description}',
                //    likes: profilePostModle!.products[index].likeProducts, 
                //    index: index,
                  
                // )
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
            // carousel(index),
            //           Container(
            //                   // height: 18.h,
            //                   color: Colors.white,
            //                   child: Column(
            //                     children: [
            //                       Container(
            //                         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            //                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             Column(
            //                               children: [

            //                              Builder(
            //                                builder: (context) {
            //                                  int ?count;
            //                                  bool islike =false;
            // //                                 if(allpostlikeresponse!=null){
            // //                                     allpostlikeresponse?.likeData.forEach((element) {
            // // if (element.postId==ref.read(viewgroupprov).postid!.toInt()) {
            // //      count=element.likeCount;
            // //      islike=element.status==0?false:true;
            // // }else{
            // //  count=0;
            // //   }
            // //                                });
            // //                                 } else{
            // //                                   count=0;
            // //                                   islike=false;
            // //                                 }
            //                                  return ProfileLIke(
            //                                    time: date,
            //                                    name: postresponse!.userData[index].user.name,
            //                                    pic:postresponse!.userData[index].user.profilePic ,
            //                                    subject: postresponse!.userData[index].message,
            //                                    likes: postresponse!.userData[index].likes,
            //                                    index: index,
            //                                    count:count! ,islike: islike,
            //                                    postid: postresponse!.userData[index].id,
            //                                   );
            //                                }
            //                              )
            //                               ],
            //                             ),
            //                             // Container(
            //                             //  // color: Colors.red,

            //                             //   child: Row(mainAxisAlignment: MainAxisAlignment.center,
            //                             //     children: [
            //                             //       Padding(
            //                             //         padding:  EdgeInsets.only(right:12.0.sp),
            //                             //         child: Icon(Icons.more_horiz,size: 18.sp,),
            //                             //       )
            //                             //     // Text('data')
            //                             //   ],),
            //                             // ),
            //                               // Row(
            //                               //     children: [
            //                               //        Image.asset( "Assets/Images/chat.png",
            //                               //       fit: BoxFit.contain,width: 7.w,),
            //                               //     ],
            //                               //   ),
            //                           ],
            //                         ),
            //                       ),
            //         //               Row(
            //         //                 children: [
            //         //                   Container(
            //         //                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
            //         //                     width: 90.w,
            //         //                     child: Text('${postresponse!.userData[index].message}',
            //         //                      style: TextStyle(
            //         //                              fontWeight: FontWeight.w400,
            //         //                              fontFamily: 'Gilroy',
            //         //                              fontSize: 10.sp
            //         //                            ),
            //         //                     ),
            //         //                   )
            //         //                 ],
            //         //               ),

            //         //            commented(postresponse!.userData[index].comments),
            //         //                       GestureDetector(
            //         //                onTap: (){
            //         //                      setState(() {

            //         //                                  });
            //         //                                 comment.profile=postresponse!.userData[index].user.profilePic;
            //         //                                 comment.postname=postresponse!.userData[index].user.name;
            //         //                                 comment.subject= postresponse!.userData[index].message;
            //         //                                comment.dateandtime=date;
            //         //                                 comment.id= postresponse!.userData[index].id;
            //         //                                     Navigator.push(
            //         //                                    context,
            //         //                               MaterialPageRoute(builder: (context) => GroupComment()

            //         //                                      ),
            //         //                                    );
            //         //                  },
            //         //  child: Row(
            //         //       children: [
            //         //         Padding(
            //         //           padding: const EdgeInsets.all(8.0),
            //         //           child: Text('view all Comments',
            //         //           style: TextStyle(
            //         //             color: Color(0x77000000),
            //         //                                fontWeight: FontWeight.w400,
            //         //                                fontFamily: 'Gilroy',
            //         //                                fontSize: 11.sp
            //         //                              ),
            //         //           ),
            //         //         )
            //         //       ],
            //         //     ),
            //         //     ),

            //                     ],
            //                   ),
            //                 ),
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
                          '${profilePostModle!.products[index].description} ',
                          // '${profilePostModle!.products[index].hashtags}',
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
                          '${profilePostModle!.products[index].hashtags}',
                          // '#casinochip #chipcollection #caesarspalace',

                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy',
                              fontSize: 10.sp),
                        ),
                      )
                    ],
                  ),
                  commented(
                                        profilePostModle!.products[index].productsComments),
//                       Row(
//                     children: [
//                    profilePostModle!.products[index].productType==2?
//                      button(context,index):Container(),

//                     //   product.producttype==2?
//                     //  button():Container()
//                     ],
//                   ) ,
//                   Row(mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
// profilePostModle!.products[index].productType==1?
//                      button1(context):Container(),
//                     ],
//                   ),

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
//   Widget button(BuildContext context,int index){
//   return  GestureDetector(
//     onTap: (){
//        focusNode.requestFocus();
//       makeanOffer( context ,index);

//     },
//     child: Container(
//                           margin: EdgeInsets.only(left: 19,top: 10),
//                            width:90.w,
//               height: 50,
//                          // width: 37.w,
//                           //height: 39,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xff591B4C)
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 20,
//                               vertical: 10
//                             ),
//                             child: Center(
//                               child: Text("Make an Offer",
//                                style: TextStyle(
//                                                fontWeight: FontWeight.w600,
//                                                fontFamily: "Gilroy",
//                                                fontSize: 12.sp,
//                                                color: Color(0xffffffff)
//                                              ),
//                               ),
//                             ),
//                           ),
//                         ),
//   );
// }
// Widget button1( context){
//   return  InkWell(
//              onTap: (){
//                  pushNewScreen(
//           context,
//           screen: Cart() ,
//           withNavBar: false, // OPTIONAL VALUE. True by default.
//           pageTransitionAnimation: PageTransitionAnimation.cupertino,
//       );
//          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
//             // onPressed(function: onpressedtitle);
//           },
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//               width:90.w,
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadiusDirectional.circular(5),
//                 color: Color(0xff591B4C)
//               ),
//               child: Center(child: Text('ADD TO CART',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: "Gilroy",
//                 fontSize: 16
//               ),
//               )),
//             ),
//           );
// }
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
            //     aspectRatio: 3 / 2,

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
            //                     fit: BoxFit.contain,
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
      centerTitle: true,
      title: Image.asset(
        "Assets/Images/Icollekt.png",
        height: 11.h,
      ),
      actions: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: Settings(id: widget.id),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ).then((value) => getupdatestausview());
              },
              child: Image.asset(
                "Assets/Images/settings.png",
                width: 10.w,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                size: 29,
              ),
              color: Color(0xff591B4C),
              onPressed: () {
                pushNewScreen(
                  context,
                  screen: NotificationScreen(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
            SizedBox(
              width: 1.w,
            )
          ],
        ),
      ],
      elevation: 1,
    );
  }

  option(BuildContext context, String option1, String option, Function ontap,
      Function ontap1, int index) {
    return showCupertinoModalBottomSheet(
      enableDrag: true,
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
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
        height: 40.h,
        child: Column(
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
              child: Text('Options',
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff591B4C))),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                ontap();
                gettype(
                  ref.read(producttype).id,
                  ref.read(producttype).type,
                );
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text(option,
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A))),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                ontap1();
                gettype(
                  ref.read(producttype).id,
                  ref.read(producttype).type,
                );
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text(option1,
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A))),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                ref.watch(producttype).id =
                    profilePostModle!.products[index].id;
                ref.read(getprofileproduct).productdelete(
                    profilePostModle!.products[index].id, context);

                // getdeletedpprofilepic();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Delete',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A))),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6.sp),
                child: Text('Cancel',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  makeanOffer(BuildContext context, int index) {
    //  final typestate = ref.watch(getprofileproduct);
    return showCupertinoModalBottomSheet(
      enableDrag: true,
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
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
                            imageBuilder: (context, imageProvider) => Container(
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
                                    width: 9.5.h,
                                    height: 9.5.h,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress))),
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
                    offersent(context);
                    Navigator.pop(context);
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
    );
  }
}

offersent(BuildContext context) {
  print('object333');
  return showCupertinoModalBottomSheet(
      enableDrag: true,
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: 400,
          width: 200,
          color: Colors.red,
          child: Column(
            children: [
              //  AppBar()
            ],
          ),
        );
      });
}
class PostCommentContainer extends ConsumerStatefulWidget {
  final bool status;
  final int index;
  final bool commentcolor;
  final String profilename;
  final String profilepic;
  final String comment;
  final int commentid;
  final List<ProductsLikeComment> likelist;
  final int listcount;
  final DateTime time;
  PostCommentContainer(
      {Key? key,
      required this.index,
      required this.commentid,
      required this.listcount,
      required this.status,
      required this.commentcolor,
      required this.comment,
      required this.likelist,
      required this.profilename,
      required this.profilepic,
      required this.time})
      : super(key: key);

  @override
  _PostCommentContainerState createState() => _PostCommentContainerState();
}

class _PostCommentContainerState extends ConsumerState<PostCommentContainer> {
  bool isliked = false;
  int count = 0;
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

  CommentLikeModle? allpostlikeresponse;
  getallLikeresponse() async {
    allpostlikeresponse = await AuthRepository().getCommentlikeData(
      commentid: widget.commentid,
      postid: ref.read(commentinfo).id!,
      groupid: ref.read(viewgroupprov).groupid!,
    );
    //allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:ref.read(viewgroupprov).postid!.toInt());
    print('sdfsdsf${allpostlikeresponse!.likeData[0].status}');
    print('asdasdadasd${widget.commentid}');
    print(allpostlikeresponse!.likeData[0].likecount);
    if (mounted) {
      setState(() {
        isliked = true;
        // allpostlikeresponse!.likeData.forEach((element) {
        //   if (element.postId==widget.commentid) {
        //     print(ref.read(viewgroupprov).postid!.toInt());
        //     count=element.likecount;
        //   }
        // });
      });
    }
  }

//LikeDataResponse?
  CommentUnLikeModle? allUnpostlikeresponse;
  getallUnLikeresponse() async {
    // postresponse!.userData.forEach((element) {
    //     ref.read(viewgroupprov).postid=  element.id;
    //   });
    allUnpostlikeresponse = await AuthRepository().getCommentUnlikeData(
      commentid: widget.commentid,
      postid: ref.read(commentinfo).id!,
    );
    print(allUnpostlikeresponse);
    print('asdasdadasd${widget.commentid}');
    if (mounted) {
      setState(() {
        isliked = false;
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
    try {
      if (widget.likelist.isNotEmpty) {
        count = widget.likelist[0].likecount;
        widget.likelist.forEach((element) {
          if (element.userId == preferences.getInt('Userid') &&
              element.status == 1) {
            isliked = true;
          } else {
            isliked = false;
          }
        });
        print('111111111111111111');
      } else {
        count = 0;
        isliked = false;
      }
    } catch (e) {
      print(e);
    }
    return Container(
      color:
          widget.commentcolor == true ? Colors.blueAccent[100] : Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        color:
            widget.commentcolor == true ? Colors.blueAccent[100] : Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15.sp,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: '${widget.profilepic}',

                      ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                      width: 9.5.h,
                      height: 9.5.h,
                      fit: BoxFit.cover,

                      imageBuilder: (context, imageProvider) => CircleAvatar(
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

                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Image.asset(
                        "Assets/Images/Portrait_Placeholder.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    //color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '${widget.profilename}',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1A1A1A))),

                              TextSpan(
                                  text: '  ${widget.comment}',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff1A1A1A))),
                              //  TextSpan(text: ' world!'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Text(timeAgo(widget.time),
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                            SizedBox(
                              width: 1.h,
                            ),
                            Text('${widget.listcount} Likes',
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    //child: Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Builder(builder: (context) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      // ontap();
                                      print(isliked);
                                      if (isliked) {
                                        //  ref.read(viewgroupprov).postid=postresponse.userData[index];
                                        //   ref.read(viewgroupprov).postid=widget.postid;
                                        getallUnLikeresponse();
                                      } else {
                                        //    ref.read(viewgroupprov).postid=widget.postid;
                                        getallLikeresponse();
                                      }
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: isliked == true
                                          ? Colors.red
                                          : Colors.grey[500],
                                      size: 26,
                                    )),
                              ],
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                  //child: Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

