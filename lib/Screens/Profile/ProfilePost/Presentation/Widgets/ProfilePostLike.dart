import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icollekt/Model/PostLikeModle.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Data/Model/ProfilePostModle.dart';
import 'package:icollekt/Services/Provider.dart';

import '../../../../../Exports/Exports.dart';
import '../../../../../Model/GoupPostModle.dart';
import '../../../../../Model/PostUnlikeModle.dart';
import '../../../../../Model/ProductlikeModle.dart';
import '../../../../../Model/producatunlikeModle.dart';
import '../../../../Product cards/ProductComment.dart';

class ProductLIke extends ConsumerStatefulWidget {
 // final int count;
  final bool islike;
  final int postid;
  final int index;
  final List<LikeProduct> likes;
  final String name;
  final String pic;
  final String subject;
  // final String time;
  ProductLIke(
      {Key? key,
      // required this.time,
      required this.name,
      required this.pic,
      required this.subject,
     // required this.count,
      this.islike = false,
      required this.postid,
      required this.index,
      required this.likes})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductLIkeState();
}

class _ProductLIkeState extends ConsumerState<ProductLIke> {
  @override
  void initState() {
    super.initState();
    //  ontaplike();
    // print('myyyyyyyyyyyyyyyyyyyy');
    // getallresponse();
  }

  bool isliked = false;
  ontaplike() {}

  int? postid;

  int count = 0;
//    ProductlikeModle? allproductlikeresponse;
//   getallLikeresponse() async {
//     allproductlikeresponse =
//         await AuthRepository().getproductlikeData(productid: widget.id);
//     //allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:ref.read(viewgroupprov).postid!.toInt());
// //  print( 'sdfsdsf${allpostlikeresponse!.likeData[0].status}');
// //  print( 'asdasdadasd${widget.commentid}');
// //  print(allpostlikeresponse!.likeData[0].likecount);
//     if (mounted) {
//       setState(() {
//         print('object');
//         //printAmber(allproductlikeresponse);
//         widget.boolstaus = true;
//         // allpostlikeresponse!.likeData.forEach((element) {
//         //   if (element.postId==widget.commentid) {
//         //     print(ref.read(viewgroupprov).postid!.toInt());
//         //     count=element.likecount;
//         //   }
//         // });
//       });
//     }
//   }

// //LikeDataResponse?
//   ProductUnlikeModle? allUnproductlikeresponse;
//   getallUnLikeresponse() async {
//     // postresponse!.userData.forEach((element) {
//     //     ref.read(viewgroupprov).postid=  element.id;
//     //   });
//     allUnproductlikeresponse =
//         await AuthRepository().getproductUnlikeData(productid: widget.id);
//     print(allUnproductlikeresponse);
//     // print( 'asdasdadasd${widget.commentid}');
//     if (mounted) {
//       setState(() {
//         widget.boolstaus = false;
//         //  allUnpostlikeresponse!.likeData.forEach((element) {
//         //    if (element.postId==widget.commentid) {
//         //     print(ref.read(viewgroupprov).postid!.toInt());
//         //     count=element.likecount;
//         //   }
//         // });
//       });
//     }
//   }
  ProductlikeModle? allpostlikeresponse;
  Future getallLikeresponse() async {
    allpostlikeresponse =
        await AuthRepository().getproductlikeData(productid:ref.read(productpostprov).productid);
    //allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:ref.read(viewgroupprov).postid!.toInt());
   print( 'sdfsdsf${allpostlikeresponse!.likeData[0].likes}');
    if (mounted) {
      setState(() {
        isliked = true;
        allpostlikeresponse!.likeData.forEach((element) {
           print( 'sdfsdsf${element.productId}');
          if (element.productId == widget.postid) {
            //  print(ref.read(viewgroupprov).postid!.toInt());
            count = element.likes;
          }
        });
      });
    }
  }

//LikeDataResponse?
  ProductUnlikeModle? allUnpostlikeresponse;
  Future getallUnLikeresponse() async {
    // postresponse!.userData.forEach((element) {
    //     ref.read(viewgroupprov).postid=  element.id;
    //   });
    allUnpostlikeresponse = await AuthRepository()
        .getproductUnlikeData(productid: ref.read(productpostprov).productid);
  //  print(allUnpostlikeresponse);
   
    //  print( 'asdasdadasd${allpostlikeresponse!.likeData[0].likeCount}');
    if (mounted) {
      setState(() {
        isliked = false;
        allUnpostlikeresponse!.likeData.forEach((element) {
          if (element.productId == widget.postid) {
            count = element.likes;
          }
          print(element.likes);
        });
      });
    }
     print( 's   ${allpostlikeresponse!.likeData[0].likes}');
  }

  // Future getallresponse() async {
  //   allUnpostlikeresponse = await AuthRepository()
  //       .getproductUnlikeData(productid: ref.read(productpostprov).productid);
  //   print(allUnpostlikeresponse);
  //   //  print( 'asdasdadasd${allpostlikeresponse!.likeData[0].likeCount}');
  //   setState(() {
  //     // postresponse!.userData.forEach((element) {
  //     //     ref.read(viewgroupprov).postid=  element.id;
  //     //   });
  //     allUnpostlikeresponse!.likeData.forEach((element) {
  //       if (element.productId == widget.postid) {
  //         count = element.likes;
  //       }
  //       print('likkkkkkkkkkkkkkkkk    ${element.likes}');
  //     });
  //   });
  // }

  // ontap() {
  //   ref.read(viewgroupprov).postid = widget.postid;
  // }

  @override
  Widget build(BuildContext context) {
   
if (widget.likes.isNotEmpty) {
      count = widget.likes[0].likes;
      widget.likes.forEach((element) {
        if (element.userId == preferences.getInt('Userid') &&
            element.status == 1) {
          isliked = true;
        } else if(element.userId == preferences.getInt('Userid') &&
            element.status == 0) {
          isliked = false;
        }
      });
    } else {
      count = 0;
      isliked = false;
    }
    return Builder(builder: (context) {
      // ontap();

      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                
              });
            //  ontap();
              print(isliked);
              if (isliked) {
                print('unlike');
                //  ref.read(viewgroupprov).postid=postresponse.userData[index];
                ref.read(productpostprov).productid = widget.postid;
                getallUnLikeresponse();
              } else {
                print('like');
                ref.read(productpostprov).productid = widget.postid;
                getallLikeresponse();
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
                    padding: EdgeInsets.only(top: 13.0, right: 4, bottom: 4),
                    child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        radius: 18,
                        child: Image.asset(
                          "Assets/Images/Layer 1.png",
                        )),
                    // CircleAvatar(
                    //  backgroundColor: Colors.grey[900],radius: 17,),
                  ),
            // child: Icon(
            //   Icons.favorite,
            //   color: isliked == true ? Colors.red : Colors.grey[500],
            //   size: 26,
            // )
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            '$count',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'SF Pro Text',
                color: Colors.white,
                fontSize: 11.sp),
          ),
          GestureDetector(
            onTap: () {
              setState(() {});
              final comment = ref.watch(commentinfo);
              comment.postname = widget.name;
              comment.id = widget.postid;
              comment.subject = widget.subject;
              comment.profile = widget.pic;
              // comment.dateandtime=oneproductResponse!.product.
              setState(() {});
              pushNewScreen(
                context,
                screen: ProductComment(
                  id: widget.postid,
                ),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
              // comment.profile = widget.pic;
              // comment.postname = widget.name;
              // comment.subject = widget.subject;
              // comment.dateandtime = widget.time;
              // comment.id = widget.postid;
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => GroupComment()),
              // );
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
          // IconButton(
          //   icon: Icon(Icons.comment_sharp),
          //   onPressed: () {
          //     setState(() {});
          //     comment.profile = widget.pic;
          //     comment.postname = widget.name;
          //     comment.subject = widget.subject;
          //     comment.dateandtime = widget.time;
          //     comment.id = widget.postid;
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => GroupComment()),
          //     );
          //   },
          // )
        ],
      );
    });
  }
}
