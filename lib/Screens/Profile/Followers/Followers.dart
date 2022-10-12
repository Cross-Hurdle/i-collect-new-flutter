
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/exports.dart';
import 'package:icollekt/Screens/Profile/Followig/Widgets/FollowingContainer.dart';

import '../Model/FollowersModle.dart';
import '../Service/ProfileRepositoryService.dart';


class Followers extends ConsumerStatefulWidget {
  final id;
  const Followers({Key? key, this.id}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FollowersState();
}

class _FollowersState extends ConsumerState<Followers> {
  @override
  void initState() {
    super.initState();
    getfollowers();
  }

  FollowersModle? followersresponse;
  bool status = false;
  Future getfollowers() async {
    followersresponse =
        await ProfileRepository().getfollowersResponse(widget.id);
    print(followersresponse?.finalFollower[0].followers.length);
    status = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context),
      backgroundColor: Color(0xffF9F2FF),
      body: SingleChildScrollView(
        child: Column(
          children: [followerlist()],
        ),
      ),
    );
  }

  followerlist() {
    if (!status) {
      return Container(
          height: 50.h, child: Center(child: CircularProgressIndicator()));
    } else {
      if (followersresponse?.finalFollower.length != 0) {
        return ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                followersresponse?.finalFollower[0].followers.length ?? 0,
            itemBuilder: (context, index) {
              return FollowingContainer(
                id: followersresponse?.finalFollower[0].followers[index].id,
                name: followersresponse?.finalFollower[0].followers[index].name,
                photo: followersresponse
                    ?.finalFollower[0].followers[index].profilePic,
              );
            });
      }
    }
  }

  buildappbar(context) {
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
      // centerTitle: true,
      title: Text(
        'Following',
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Color(0xff1A1A1A),
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
            fontFamily: 'Gilroy'),
      ),
      //   title: Image.asset("Assets/Images/Icollekt.png",
      //   height: 11.h,
      //   ),
      //   actions: [
      //     Image.asset("Assets/Images/shop.png",
      //  width: 12.w,
      //   ),
      //   ],
      elevation: 1,
    );
  }
}

// {
// Datas:[
// {
// Name:"Jagadish ",
// Price:"$100",
// Profile picture :""
// Data:[
//   {
//     "id":12
//  "product image":"",
//  "product name":""
//    }
//     {
//     "id":13
//  "product image":"",
//  "product name":""
//    }
   
//      ]
//   }
//   {
//     Name:"Jagadish ",
//   Price:"$100",
//    Profile picture :""
//    Data:[
//     {
//        "id":11
//  "product image":"",
//  "product name":""
//      }
//     ]
//   }
//      ]
//     }