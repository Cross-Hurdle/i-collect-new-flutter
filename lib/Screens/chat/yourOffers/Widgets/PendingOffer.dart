import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/exports.dart';

import '../Model/YourOfferModle/AcceptOfferModel.dart';
import '../Model/YourOfferModle/OtherOfferModel.dart';
import '../Model/YourOfferModle/PendingOfferModel.dart';
import '../service/MakeanOfferRepository.dart';
import 'Accepted Offer.dart';
import 'otherOffer.dart';

class PendingOffer extends ConsumerStatefulWidget {
  const PendingOffer({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PendingOfferState();
}

class _PendingOfferState extends ConsumerState<PendingOffer> {
  bool status = false;

  @override
  void initState() {
    // status=true;
    getpendingoffer();
    getacceptOffer();
    getotherOffers();
    super.initState();
  }

  PendingOfferModle? pendingoffer;
  Future getpendingoffer() async {
    pendingoffer = await MakeAnRepository().getpendingOffer();
    status = true;

    print('object');
    print(pendingoffer?.pending.length);
    setState(() {});
  }

  OtherOfferModle? otherOffer;
  Future getotherOffers() async {
    otherOffer = await MakeAnRepository().getOtherOffer();
    status = true;
    print(otherOffer!.reject.length);
// print(pendingoffer!.cartData.length);
    setState(() {});
  }

  AcceptOfferModle? acceptOffer;
  Future getacceptOffer() async {
    acceptOffer = await MakeAnRepository().getAcceptedOffer();
    status = true;
    print('object');
// print(pendingoffer!.cartData.length);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          acceptedoffer(),
          pendingOffer(),
          otheroffer(),
          SizedBox(height: 10),
        ]));
  }

  Widget title(String title) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          // height: 70,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          //  color: Colors.red,
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: .5,
                color: Color(0xff1A1A1A),
                fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

  Widget acceptedoffer() {
    if (!status) {
      return Container(
          height: 50.h, child: Center(child: CircularProgressIndicator()));
    } else {
      if (acceptOffer?.accept.length != 0) {
        return Column(
          children: [
            title("Accepted Offers"),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: acceptOffer?.accept.length ?? 0,
                scrollDirection: Axis.vertical,
                // cacheExtent: 0,
                itemBuilder: (context, index) {
                  return AcceptedOffer(
                    offerprice: acceptOffer!.accept[index].makePrice,
                    price: acceptOffer!.accept[index].originalPrice,
                    thumbnail: acceptOffer!.accept[index].product.thumbnailImg,
                    enddate: acceptOffer!.accept[index].product.endDate,
                    id: acceptOffer!.accept[index].id,
                    profilepic: acceptOffer!.accept[index].user.profilePic,
                    title: acceptOffer!.accept[index].user.name,
                  );
                }),
          ],
        );
      } else {
        return Container();
      }
    }
  }

  Widget otheroffer() {
    if (!status) {
      return Container(
          height: 50.h, child: Center(child: CircularProgressIndicator()));
    } else {
      if (otherOffer?.reject.length != 0) {
        return Column(
          children: [
            title("Other Offers"),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: otherOffer?.reject.length ?? 0,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return OtherOffer(
                    offerprice: otherOffer!.reject[index].makePrice,
                    price: otherOffer!.reject[index].originalPrice,
                    thumbnail: otherOffer!.reject[index].product.thumbnailImg,
                    enddate: otherOffer!.reject[index].product.endDate,
                    id: otherOffer!.reject[index].productId,
                    profilepic: otherOffer!.reject[index].user.profilePic,
                    title: otherOffer!.reject[index].user.name,
                  );
                }),
          ],
        );
      } else {
        return Container();
      }
    }
  }

  Widget pendingOffer() {
    if (!status) {
      return Container(
          height: 50.h, child: Center(child: CircularProgressIndicator()));
    } else {
      if (pendingoffer?.pending.length != 0) {
        return Column(
          children: [
            title("Pending Offers"),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: pendingoffer?.pending.length ?? 0,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(2, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          //color: Colors.red,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: pendingoffer!
                                        .pending[index].user.profilePic,
                                    width: 9.h,
                                    height: 9.h,
                                    fit: BoxFit.cover,
                                    imageBuilder: (context, imageProvider) =>
                                        CircleAvatar(
                                      radius: 30.sp,
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
                                        Center(
                                            child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress)),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      "Assets/Images/Portrait_Placeholder.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  width: 180,
                                  child: Text(
                                    pendingoffer!.pending[index].user.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .5,
                                      fontSize: 16,
                                      // color: Color.fromARGB(255, 21, 106, 25),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: 130,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 0,
                                          blurRadius: 5,
                                          offset: Offset(2,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    width: 130,
                                    child: CachedNetworkImage(
                                      imageUrl: pendingoffer!
                                          .pending[index].product.thumbnailImg,
                                      width: 7.h,
                                      //  height: 9.h,
                                      fit: BoxFit.cover,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(2,
                                                  2), // changes position of shadow
                                            ),
                                          ],
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    spreadRadius: 1,
                                                    blurRadius: 5,
                                                    offset: Offset(2,
                                                        2), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress))),
                                      errorWidget: (context, url, error) =>
                                          //  Icon(Icons.error)
                                          Image.asset(
                                        "Assets/Images/Portrait_Placeholder.png",
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(width: 20),
                            Container(
                              width: 50.w,
                              //    color:Colors.red,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Your offer: \$${pendingoffer!.pending[index].makePrice}',
                                      style: TextStyle(
                                        fontFamily: "Gilroy",
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: .5,
                                        fontSize: 14,
                                        // color: Color.fromARGB(255, 21, 106, 25),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Current offer: \$${pendingoffer!.pending[index].originalPrice}',
                                      style: TextStyle(
                                        fontFamily: "Gilroy",
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: .5,
                                        color: Colors.grey,
                                        fontSize: 13,
                                        // color: Color.fromARGB(255, 21, 106, 25),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Icon(
                                            Icons.restore,
                                            size: 22,
                                            color: Color.fromARGB(
                                                255, 108, 108, 108),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Pending',
                                          style: TextStyle(
                                            fontFamily: "Gilroy",
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            fontSize: 13,
                                            color: Color.fromARGB(
                                                255, 108, 108, 108),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Seller has until ${pendingoffer!.pending[index].product.endDate} at 4PM to Accept or reject',
                                      style: TextStyle(
                                        fontFamily: "Gilroy",
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: .5,
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
                }),
          ],
        );
      } else {
        return Container();
      }
    }
  }
}
