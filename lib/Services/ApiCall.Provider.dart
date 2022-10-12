import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Screens/Profile/Service/ProfileRepositoryService.dart';
import '../Exports/Exports.dart';
import '../Screens/Home/HomePage/Data/Model/HomePage_Modle.dart';


final getproduct = ChangeNotifierProvider((ref)=>Getproduct());
class Getproduct extends ChangeNotifier{

HomePageresponse ? productResponse;
bool status =false;
 Stream getProduct()async*{  
 productResponse = await AuthRepository().getProduct(userid:  preferences.getInt('Userid'));
 notifyListeners();
status =true;

}


}
final getprofileproduct = ChangeNotifierProvider((ref)=>Getprofileproduct());
class Getprofileproduct extends ChangeNotifier{
// bool profilestatus1 =true;
gettype(var id,var type,bool profilestatus)async{  
    // profilestatus1=false;
  //final statusResponse = await ProfileRepository().getProducttype( ref.read(producttype).id, ref.read(producttype).type);
final statusResponse = await ProfileRepository().getProducttype(id ,type);
   print(statusResponse.message);
   print(statusResponse.status);

   // profilestatus1=statusResponse.status;

     notifyListeners();
 
}
productdelete(var id,BuildContext context )async{  
    // profilestatus1=false;
  //final statusResponse = await ProfileRepository().getProducttype( ref.read(producttype).id, ref.read(producttype).type);
final statusResponse = await ProfileRepository().getProductdelete(id );
   print(statusResponse["message"]);
   print(statusResponse["status"]);
//  showToast('Product Deleted',
//      textStyle: TextStyle(color: Colors.black),
//      backgroundColor: Colors.grey[300],
//                     context: context,
                    
//                     borderRadius: BorderRadius.circular(10),
//                     animation: StyledToastAnimation.size,
//                     reverseAnimation: StyledToastAnimation.size,
//                     axis: Axis.horizontal,
//                     position: StyledToastPosition.center,
//                     animDuration: Duration(milliseconds: 400),
//                     duration: Duration(seconds: 2),
//                     curve: Curves.linear,
//                     reverseCurve: Curves.linear);
   // profilestatus1=statusResponse.status;

     notifyListeners();
 
}
// ProfilePostModle ? profilePostModle;

//  Stream getprofileProduct()async*{  
//   // profilestatus1 =true;
//  profilePostModle = await AuthRepository().getProfilecollection();
//  notifyListeners();

// //profilestatus1 =false;
// }

}