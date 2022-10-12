import 'package:dio/dio.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Data/Model/ProfilePostModle.dart';



abstract class ProfileremoteDataSource{
  Future <ProfilePostModle> getProfilecollection(int id);



}
class ProfileremotedataSourceImpl extends ProfileremoteDataSource{
  @override
   Future <ProfilePostModle> getProfilecollection(int id)async{
    try {
     // print(preferences.getInt('Userid'));
     final response = await Dio().get("http://i-collekt.jksoftec.com:3001/api/product/user/users/$id",
        );
   var topAllTimeresponse=ProfilePostModle.fromJson(response.data);
  print(topAllTimeresponse.products.length);
    print(topAllTimeresponse.products);
     return topAllTimeresponse;
    } catch (e) {
      rethrow;
    }
   }
  
}