import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:path/path.dart';

import '../../Exports/Exports.dart';
import '../../Model/ProductUploadModle.dart';

class ShowCaseMinPrice extends ConsumerStatefulWidget {
  const ShowCaseMinPrice({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowCaseMinPriceState();
}

class _ShowCaseMinPriceState extends ConsumerState<ShowCaseMinPrice> {
TextEditingController _searchcontroller= TextEditingController();
  bool loader=false;
// @override
// void initState() { 
//   super.initState();
//   loader=true;
// }
 uploadImageToDB(context) async {  
    String url='http://i-collekt.jksoftec.com:3001/api/product/product/upload/product';
 setState(() {
   
 });

 final List added=[];
  var image;
  // for (var i = 0; i < ref.read(productupload).productimage!.length; i++) {
    
  //     String filename1= basename(ref.read( productupload).productimage![i].path);
  //      multiimage= await MultipartFile.fromFile(ref.read(productupload).productimage![i].path, filename:filename1);
      
  // //  print('hello');
  // }
          for (var i = 0; i < ref.read(productupload).productimage.length; i++) {
             String filename0= basename(ref.read( productupload).tumbnail!.path);
              image = MultipartFile.fromFile(ref.read(productupload).tumbnail!.path, filename: filename0);
          added.add( 
             await  MultipartFile.fromFile(ref.read(productupload).productimage[i].path,
              filename:basename(ref.read( productupload).productimage[i].path)),  
          );
           }
      try{
        loader=true;
      var formData = FormData.fromMap({
       "name":ref.read(productupload).productname.toString(),
       "product_type":0,
        "user_id":preferences.getInt('Userid'),
        "tags":ref.read(hastagProductProv).selected.join(','),
        "thumbnail_img":await image,
        "description":ref.read(productupload).description,
        "unit_price":_searchcontroller.text,
        "min_qty":_searchcontroller.text,
        "added_by":"User",
        "seller_address":ref.watch(productupload).id,
        "photos":added,
         "hashtags":ref.read(hastagProductProv).selectedname.join(','),
          "weight": ref.read(productupload).weight,
        "height": ref.read(productupload).height,
        "width": ref.read(productupload).width,
        "lenght": ref.read(productupload).length,
        "end_date":'0'  
});  
print(formData.files);

print(formData.fields);
  final response = await Dio().post("$url",
 data: formData);
 
  print('hello${response.statusCode}');
   ProductUploadResponse?  upload;
   print(upload!.data.name);
    if(response.statusCode == 200 ){
  loader=false;
  print('successfully uploaded');

 showToast('Product Uploaded',
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,
                    
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);
  Navigator.of(context).popUntil((route) => route.isFirst); 
      ref.read(hastagProductProv).selected.clear();
   ref.read(productupload).productimage.clear();
      upload=ProductUploadResponse .fromJson( response.data);
     setState(() {
   });
    }else{ 
     
      print('could not be uploaded');
    }
      }catch(e){
loader=false;
      }
   if (mounted) {
      setState(() {});
   }
  }
   validation(context){
     if ( _searchcontroller.text.isEmpty) {
      showToast('Enter the Product Price',
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,
                    
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);
      print('hii');
    }else if (_searchcontroller.text.contains(RegExp(r'[0-9]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false) {
         print('hiiname');
       showToast('Enter the Product Price',
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,
                    
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);
    }else{
         
                     //loader=true;
                     setState(() {
                       
                     });       
                 uploadImageToDB(context);
// showToast('Product Added',
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
               //  Navigator.of(context).popUntil((route) => route.isFirst);
    //  uploadImageToDB(context);
       //    Navigator.of(context).popUntil((route) => route.isFirst);   
    }
  }
  @override
 Widget build(BuildContext context) {
  
    return Stack(
      children: 
        [Scaffold(
          appBar: topappbar(context),
         // backgroundColor: Colors.red,
         body:Column(
               children: [
                 Expanded(
                   child: SingleChildScrollView(
                     child: Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top:38.0,bottom: 20,left: 20),
                           child: Row(mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                             Container(
                              // width: 100.w,
                               child: Text('Price:',
                               textAlign: TextAlign.start,
                     style: TextStyle(
                       color: Color(0xff1A1A1A),
                       fontWeight: FontWeight.w700,
                       fontSize: 15.sp,
                       fontFamily: 'Gilroy'
                     ),
                     ),
                             ),
                             ],
                           ),
                         ),
                         textField()
                        // CustomButton(title: 'Showcase only', ontapped:()=> ForSale()),
                        //  CustomButton(title: 'For sale', ontapped:()=> ForSale()),
                        //   CustomButton(title: 'Make an offer', ontapped:()=> ForSale())
                       ],
                     ),
                   ),
                 ),
                  InkWell(
                     onTap: (){
                       validation(context);
                      //  Navigator.of(context).popUntil((route) => route.isFirst);
                    // onPressed(function: onpressedtitle);
                  },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      width:95.w,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(5),
                        color: Color(0xff591B4C)
                      ),
                      child: Center(child: Text('Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Gilroy",
                        fontSize: 16
                      ),
                      )),
                    ),
                  ),
                //  Navigator.of(context).popUntil((route) => route.isFirst);
                  //  CustomButton(title: 'Next', ontapped:()=> MakeOffer(),nav: false,),
                    SizedBox(height: 50,)
              
                //  Navigator.of(context).popUntil((route) => route.isFirst);
                  
               ],
             ),
            
           
        ),
         if (loader)  Container(
            color: Colors.black.withOpacity(0.5),
            height: double.infinity,
            width: double.infinity,
            child: Center(child: CircularProgressIndicator()),
          )
      ],
    );
  }

  Widget textField(){
   
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
          // width: 51.w,
           height: 15.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.white,
             boxShadow: [
        BoxShadow(
          color: Colors.black12,
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(2, 2), // changes position of shadow
        ),
          ],
          ),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: _searchcontroller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'USD\$',
          hintStyle: TextStyle(
            color: Color(0xffABB4BD),
            fontFamily: 'Gilroy',
            fontSize: 18,
            fontWeight: FontWeight.w700
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 18),
        
      )));
  }

 AppBar topappbar(context){
    return AppBar(
      title: Text('Min Price',
      style: TextStyle(
        color: Color(0xff1A1A1A),
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        fontFamily: 'Gilroy'
      ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
        leading: GestureDetector(
        onTap: (){
        Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
    );
  }
}