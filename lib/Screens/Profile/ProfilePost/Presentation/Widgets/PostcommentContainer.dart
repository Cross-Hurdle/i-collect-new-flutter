import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

import '../../../../../Model/CommentUnlikeModle.dart';
import '../../../../../Model/CommentViewModle.dart';
import '../../../../../Model/CommentlikeModle.dart';
import '../../../../../Model/ProductComment.dart';
import '../../../../../Services/Provider.dart';

class ProfilePostCommentContainer extends ConsumerStatefulWidget {
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
  ProfilePostCommentContainer(
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
  _ProfilePostCommentContainerState createState() =>
      _ProfilePostCommentContainerState();
}

class _ProfilePostCommentContainerState
    extends ConsumerState<ProfilePostCommentContainer> {
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
                            //  Text('${widget.listcount} Likes',style: TextStyle(
                            //             fontFamily: 'Gilroy',
                            //             fontSize: 9.sp,
                            //             fontWeight: FontWeight.w500,
                            //             color: Colors.grey)),
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
                // Container(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: [
                //       Builder(builder: (context) {
                //         return Column(
                //           children: [
                //             Row(
                //               children: [
                //                 GestureDetector(
                //                     onTap: () {
                //                       // ontap();
                //                       print(isliked);
                //                       if (isliked) {
                //                         //  ref.read(viewgroupprov).postid=postresponse.userData[index];
                //                         //   ref.read(viewgroupprov).postid=widget.postid;
                //                         getallUnLikeresponse();
                //                       } else {
                //                         //    ref.read(viewgroupprov).postid=widget.postid;
                //                         getallLikeresponse();
                //                       }
                //                     },
                //                     child: Icon(
                //                       Icons.favorite,
                //                       color: isliked == true
                //                           ? Colors.red
                //                           : Colors.grey[500],
                //                       size: 26,
                //                     )),
                //               ],
                //             ),
                //           ],
                //         );
                //       })
                //     ],
                //   ),
                //   //child: Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
