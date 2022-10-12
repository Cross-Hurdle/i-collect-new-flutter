import 'package:dio/dio.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/AlltimeModle.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/yearmodle.dart';



abstract class SearchremoteDataSource{
  Future <TopAllTimeresponse> gettopcollection();

  Future <TopYearresponse> getThisyearResponse();

}
class SearchremotedataSourceImpl extends SearchremoteDataSource{
  @override
   Future <TopAllTimeresponse> gettopcollection()async{
    try {
     final response = await Dio().get("http://i-collekt.jksoftec.com:3001/api/product/all/time",
        );
   var topAllTimeresponse=TopAllTimeresponse.fromJson(response.data);
  // print(topAllTimeresponse.alltimeProduct[1].description);
     return topAllTimeresponse;
    } catch (e) {
      rethrow;
    }
   }
   @override
     Future <TopYearresponse> getThisyearResponse() async {
       
     try {
       final response = await Dio().get("http://i-collekt.jksoftec.com:3001/api/product/find/Byyear",
        );
var topYearresponse=TopYearresponse.fromJson(response.data);
  //print(commentViewModle);
     return topYearresponse; 
     } catch (e) {
       rethrow;
     }

  }
}