// import 'package:dio/dio.dart';
// import 'package:icollekt/Exports/Exports.dart';
// import 'package:icollekt/Model/GoupPostModle.dart';
// enum Poststate{
//   Initital,
//   Loading,
//   Loaded,
//   Error
// }




// class PostModle extends ChangeNotifier{
//  Poststate _poststate = Poststate.Initital;
//  Poststate get poststate => _poststate;
//  //GroupPostedDataResponse? postresponse;
//  Future <void>getpostedresponse(int id)async{
//   //  print(ref.read(viewgroupprov).groupid!);
//   try {
//      final postresponse = await Grouppost._instance!.getAllGroupPostedData(id:id );
//  print('12345');
//   print(postresponse.userData.length);
//   _poststate =Poststate.Loaded;
//   } catch (e) {
//     _poststate =Poststate.Error;
//   }
//   notifyListeners();
//  //postresponse!.userData.reversed;
//   //status=true;
 
//  // print( postresponse!.userData[0].likes.length);

//   }
// }








// class Grouppost{
//    late GroupPostedDataResponse groupPostedDataResponse;
//  static Grouppost ?_instance;
//   Grouppost._();
//    static Grouppost get instance{
//     if (_instance ==null) {
//        _instance =  Grouppost._();
//     }
//     return _instance!;
//    }

//        Future<GroupPostedDataResponse> getAllGroupPostedData({required int id})async{ 

//    final response = await Dio().get('http://$baseurl/api/conversation/conservation_view/view/$id');
//   //print(response);
//  groupPostedDataResponse =GroupPostedDataResponse.fromJson(response.data);
//   return groupPostedDataResponse;

//    }
  
// }