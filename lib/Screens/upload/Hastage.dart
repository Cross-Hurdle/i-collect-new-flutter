import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/GetHastag_response.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:path/path.dart';

import '../../Model/ProductUploadModle.dart';


class Hashtags extends ConsumerStatefulWidget {
  const Hashtags({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HashtagsState();
}

class _HashtagsState extends ConsumerState<Hashtags> {
   bool selectedItem = false;
   List selection=[];
TextEditingController _searchcontroller= TextEditingController();
 
  @override
  void initState() {
    ref.read(hastagProductProv).selected.clear();
    getCollectionData();
    super.initState();
  }
//  void filter(String inputString) {
//     filteredList =
//         fooList.where((i) => i.toLowerCase().contains(inputString)).toList();
//     setState(() {});
//   }
validation(context){
   if ( ref.read(hastagProductProv).selected.length==5) {
     if (ref.read(uploadquestion).option=='post') {
       uploadImageToDB(context);
     }else if(ref.read(uploadquestion).option=='offer') {
                               pushNewScreen(
          context,
          screen:MakeOffer() ,
          withNavBar:false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
     }else if( ref.read(uploadquestion).option=='sale'){
 pushNewScreen(
          context,
          screen:ForSale() ,
          withNavBar:false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      }
     print('${ref.read(uploadquestion).option}');
      //                       pushNewScreen(
      //     context,
      //     screen:UploadQuestion() ,
      //     withNavBar:false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
               } else {
                   showToast('Please choose 5 hashtags',
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

               }
}
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
             await  MultipartFile.fromFile(ref.read(productupload).productimage[i].path, filename:basename(ref.read( productupload).productimage[i].path)),  
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
        "unit_price":'0',
        "min_qty":'0',
        "added_by":"User",
        "weight":"0",
        "height":"0",
        "width":"0",
        "lenght":"0",
        "seller_address":'0',
        "photos":added,
        "hashtags":ref.read(hastagProductProv).selectedname.join(','),
        "end_date":'0'  
});  
print(formData.files);

print(formData.fields);
  final response = await Dio().post("$url",
 data: formData);
 
  print('hello${response.statusCode}');
   // ignore: unused_local_variable
   ProductUploadResponse  upload;
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
      ref.read(hastagProductProv).selectedname.clear();
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

Hastaggetresponse ? hastaggetresponse;
getCollectionData()async { 
     hastaggetresponse = await CollectionRepository().getHastagData();
     
     setState(() {
       
     });
     
   hastaggetresponse!.data.reversed.forEach(
        (element) {
         if (!filteredData.contains(element)) {
          filteredData.add(
           element
            );
         }
           

        },
        
      );
       print(filteredData.length);
      // print('sdsd${filteredData[0]['id']}');
        for (int i = 0; i < filteredData.length; i++) {
      selectionIndex.add(
        {"Index": i, "Id": filteredData[i].id, "IsSelected": false},
      );
    }

    ref.read(hastagProductProv).selectedhastagIndex = selectionIndex;
    setState(() {});

}
  // List< CollectionResponse>? category = [];
  //List<DataModel>? filteredList = [];
    List <Datum>filteredData = [];
  List selectionIndex = [];
  void filter(String? val) {
    List <Datum>sample=[];


    if (val!.isNotEmpty) {

     hastaggetresponse!.data.reversed.forEach(
        (element) {

          if (element.name.toLowerCase().contains(val)) {
            sample.add(
            element
            );
             
          } else {
            
            // print(filteredData);
          }
        },
      );
     
    } else {
      print('empty');
      hastaggetresponse!.data.reversed.forEach(
        (element) {
         
           sample.add(
             element
            );
       
        },
      );
    }
    filteredData=sample;

     setState(() {});
    //  for (int i = 0; i < filteredData.length; i++) {
    //   selectionIndex.add(
    //     {"Index": i, "Id":filteredData[i]['Id'], "IsSelected": false},
    //   );
    // }

    // ref.read(hastagProv).selectedhastagIndex = selectionIndex;
    // setState(() {});
  }

//Update

// getUpdateCollection(HastagData provider)async{

// if(provider.selected.length == 5 ){
    
//     final updateResponse = await CollectionRepository().updateHastag(widget.id,provider.selected );
   
//     if(updateResponse.result == true){ 
//       print(updateResponse.result);
//         print(updateResponse.message);
//     //     print(widget.id);

//     //     Navigator.push(
//     //   context,
//     //   MaterialPageRoute(builder: (context) => SignUpProfileImage(id: widget.id))
//     // );
//     }else { 
//       print(updateResponse.message);
//       showToast(updateResponse.message,
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
//       // Fluttertoast.showToast(msg: updateResponse.message);
//     //     Navigator.push(
//     //   context,
//     //   MaterialPageRoute(builder: (context) => SignUpProfileImage(id: widget.id)
//     //   // CollectionHastags(
//     //   //   id: widget.number,
//     //   // )
//     //   //  SignUpProfileImage(
//     //   //   id: widget.number,
//     //   // )
//     //   ),
//     // );
//     }

// } else {
  
//   showToast('Please choose 5 hashtags',
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
//  //Fluttertoast.showToast(msg: 'Please Select any 3 collections');
//  return ;
// }


 
  

// }
 
 //Hastag Already Exist
 gethastagexistCollection()async{

 final updateResponse = await AuthRepository().getexisthastag( hastag: '#${_searchcontroller.text.toString()}' );
 // _searchcontroller.text ='';
  // print(updateResponse.name);

 
  //getCollectionData();
  
    if(updateResponse.result == true){ 
      getaddhastagUpdateCollection();
      print(updateResponse.result);
        print(updateResponse.message);
       // print(widget.id);

       
    }else { 
      print(updateResponse.message);
     
    }


}
//Hastag Added
getaddhastagUpdateCollection()async{

 final updateResponse = await CollectionRepository().addupdateHastag('#${_searchcontroller.text.toString()}' );
  _searchcontroller.text ='';
   print(updateResponse.name);

 
  getCollectionData();
  
    // if(updateResponse. == true){ 
    //   print(updateResponse.result);
    //     print(updateResponse.message);
    //     print(widget.id);

    //     Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SignUpProfileImage(id: widget.id))
    // );
    // }else { 
    //   print(updateResponse.message);
     
    // }


}
  Widget build(BuildContext context) {
  
    return Stack(
      children: 
        [Scaffold(
          appBar: topappbar(context),
         // backgroundColor: Colors.red,
         body: Column(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:48.0,),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Container(
                          width: 100.w,
                          child: Text('Choose 5 hashtags that best fit your item',
                          textAlign: TextAlign.center,
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
                    SizedBox(height: 40,),
                    textField(),
                    // Container(
                    //   // margin: EdgeInsets.symmetric(horizontal: 20),
                    //   child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //      camera(),
                    //      fileupload()
                    //     ],
                    //   ),
                    // ),
                      Padding(
                      padding: const EdgeInsets.only(top:38.0,left: 20,bottom: 20),
                      child: Row(
                        children: [
                        Text('Suggested',
                style: TextStyle(
                  color: Color(0xff1A1A1A),
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                  fontFamily: 'Gilroy'
                ),
                ),
                        ],
                      ),
                    ),
                    _searchcontroller.text.isNotEmpty?   Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 15,
              //maxHeight: MediaQuery.of(context).size.height - 5,
            ),
            
                            child: Card(
                             // color:Color(0xffF2F2F7),
                              child: Padding(
                                padding: const EdgeInsets.only(top:8.0,left: 10,right: 10),
                                child: Container(
                                  
                                  height: 30,
                                  child: Text(
                                   '#${_searchcontroller.text.toString()}',
                                    style: TextStyle(
                                       fontSize: 14,
                       fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        GestureDetector(child: Padding(
                             padding: EdgeInsets.symmetric(horizontal: 10.sp),
                           child: GestureDetector(
                             onTap: (){
                                gethastagexistCollection();
                              // getaddhastagUpdateCollection();
                              // _searchcontroller.text ='';
                              // hastag.selected.clear();
                               // getCollectionData();
                             },
                             child: Container(
                               child: CircleAvatar(
                                 maxRadius: 15,
                                   backgroundColor: Color(0xff591B4C),
                               child: Icon(Icons.add,size: 20,color: Colors.white,),
                                ),
                             ),
                           ),
                         ),
                         
                      onTap: (){
             
                
                          }
                          )
                        ],
                      ),
                    ):Container(),
                 Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
             RefreshIndicator(
               onRefresh: ()async{
                  // getCollectionData();
                  // ref.watch(hastagProv).selected.clear()
               },
               child: GridView.builder(
                 padding: EdgeInsets.all(0),
               // reverse: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 9,
                   childAspectRatio: 2.5,
                   mainAxisSpacing: 13,
                   mainAxisExtent: 70
                ),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index){ 
                 // print(filteredData[index]['title']);
                 return SelectedItems2(
             
                   id: filteredData[index].id,
                   name:filteredData[index].name, 
                   
                 );
                 //:Container(height: 100,width: 100,color: Colors.red,);
             
                },
                     
                itemCount:filteredData.length,
                     ),
             ),
          ),
        )
                   // suggestion()
                  ],
                ),
              ),
               InkWell(
                 onTap: (){
                   print(ref.read(hastagProductProv).selectedname.join(','));
                  validation(context);
          //           pushNewScreen(
          //     context,
          //     screen:UploadQuestion() ,
          //     withNavBar:false, // OPTIONAL VALUE. True by default.
          //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
          // );
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
           //   CustomButton(title: 'Next', ontapped:()=> UploadQuestion(),nav: false,)
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
           height: 14.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
             boxShadow: [
        BoxShadow(
          color: Colors.black26,
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(3, 3), // changes position of shadow
        ),
          ],
          ),
      child: TextField(
         onChanged: (text) {
               // ref.read(collectionProv).mapselected();
              text = text.toLowerCase();
              filter(text);

            },
       controller: _searchcontroller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Color(0xffCCCCCC),fontSize: 13.sp),
          contentPadding: EdgeInsets.only(left: 10,top: 18),
          suffixIcon:  Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: GestureDetector(
              onTap: (){
                // ref.read(hastagProv).selectedhastagIndex.clear();
                //    ref.read(hastagProv).selectedhastagIndex = 
                // selectionIndex.clear();
                //  filteredData.clear();
               //  getCollectionData();
              },
              child: Image.asset("Assets/Images/searchright.png",
                    ),
            ),
          ),
      )));
  }
 AppBar topappbar(context){
    return AppBar(
      title: Text('Tags',
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
class SelectedItems2 extends  ConsumerStatefulWidget {
 final  image;
  final name;
   final id;
 final selectedItem;
   SelectedItems2({ Key? key, this.image,this.name,this.selectedItem,this.id }) : super(key: key);

  @override
  _SelectedItems2State createState() => _SelectedItems2State();
}

class _SelectedItems2State extends ConsumerState<SelectedItems2> {
  @override
  void initState() { 
    super.initState();
    
    setState(() {
      
    });
  }
 //bool isSelected = false;
  
  onSelect(HastagProductData prov) {
    // for (var i = 0; i < prov.selected.length; i++) {
    //   if (prov.selected[i] == widget.id) {
    //      if (prov.selected.length<5) {
    //              // prov.selected.add(widget.id);

    //       prov.selectedhastagIndex[i]["IsSelected"] =
    //         !prov.selectedhastagIndex[i]["IsSelected"];
    //          if(  prov.selectedhastagIndex[i]["IsSelected"]){
               
    //      prov.selected.add(widget.id);
    //    }else{
    //      prov.selected.remove(widget.id);
    //    }
    //              }else{
    //                 prov.selected.remove(widget.id);
    //              }
    //     // prov.selectedhastagIndex[i]["IsSelected"] =
    //     //     !prov.selectedhastagIndex[i]["IsSelected"];
    //   //        if(  prov.selectedhastagIndex[i]["IsSelected"]){
               
    //   //    prov.selected.add(widget.id);
    //   //  }else{
    //   //    prov.selected.remove(widget.id);
    //   //  }
        
    //   }
    // }
  if (prov.selected.contains(widget.id)) {
    prov.selected.remove(widget.id);
    prov.selectedname.remove(widget.name);
  } else {
    if (prov.selected.length<5) {
       prov.selected.add(widget.id);
       prov.selectedname.add(widget.name);
    }
    
  }
    setState(() {});
  }
  bool selectedItem = false;
  @override
  Widget build(BuildContext context) {
    final provider=ref.watch(hastagProductProv);
    // for (var i = 0; i < ref.read(hastagProv).selected.length ; i++) {
    //  // print(ref.read(hastagProv).selected[i]);
    //      if (ref.read(hastagProv).selected.contains(widget.id)) {
    //   //  print(widget.id);
    //     isSelected=true;
    //   } else {
    //     isSelected=false;
    //   }
    // }
    // ref.read(hastagProv).selected.forEach((element) {
    //   print(ref.read(hastagProv).selected);
    //   if (widget.id==element) {
    //     print(widget.id);
    //     isSelected=true;
    //   } else {
    //     isSelected=false;
    //   }
    // });
    // print(isSelected);
    return InkWell(
      onTap: (){
         onSelect(provider);
        print(provider.selected);
        //  selectedItem = !selectedItem;
        //  widget.selectedItem(selectedItem);
       setState(() {
         
       });
      },
      child: Container(
       // margin: EdgeInsets.all(10),
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        // color:Color(0xffF2F2F7),
         
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
          
            Builder(
          builder: (context) {
            // for (var i = 0; i < provider.selectedhastagIndex.length; i++) {
            //   if (provider.selectedhastagIndex[i]['Id'] == widget.id) {
            //     if (provider.selectedhastagIndex[i]['IsSelected'])
            //      if (provider.selected.length<=5) {
            //         isSelected = true;
            //      }else{
            //         isSelected = false;
            //      }
            //     //  isSelected = true;
            //     else
            //       isSelected = false;
            //   }
            // }
            if (provider.selected.contains(widget.id)){
             // provider.selected.add(isSelected);
              return  Container(
                 decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // color:Color(0xff591B4C),
           border: Border.all(
                  color:Color(0xff591B4C),
                  width: 1.5,
                ),
           boxShadow: [
      // BoxShadow(
      //   color: Colors.black12,
      //   spreadRadius: 1,
      //   blurRadius: 5,
      //   offset: Offset(2, 2), // changes position of shadow
      // ),
        ],
        ),
              );}
            else{
             // provider.selected.remove(isSelected);
              return Container(
           decoration: BoxDecoration(
             border: Border.all(
                  color:Colors.grey.shade400,
                  width: 1,
                ),
          borderRadius: BorderRadius.circular(5),
      //  color:Color(0xffF2F2F7),
      //      boxShadow: [
      // BoxShadow(
      //   color: Colors.black12,
      //   // spreadRadius: 1,
      //   // blurRadius: 5,
      //   // offset: Offset(2, 2), // changes position of shadow
      // ),
      //   ],
        ),
      //             decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(100),
      //     color:selectedItem == true? Color(0xff591B4C):Color(0xffF2F2F7),
      //      boxShadow: [
      // BoxShadow(
      //   color: Colors.black12,
      //   spreadRadius: 1,
      //   blurRadius: 5,
      //   offset: Offset(2, 2), // changes position of shadow
      // ),
      //   ],
      //   ),
              );
            }
              
          },
        ),
         Builder(
             builder:(context) {
            // for (var i = 0; i < provider.selectedhastagIndex.length; i++) {
            //   if (provider.selectedhastagIndex[i]['Id'] == widget.id) {
            //     if (provider.selectedhastagIndex[i]['IsSelected'])
            //       isSelected = true;
            //     else
            //       isSelected = false;
            //   }
            // }
            if (provider.selected.contains(widget.id)){
            
              return  Text(
                '${widget.name}',
                style: TextStyle(
                  fontSize: 14,
                 // color:Color(0xffF2F2F7),
                  fontFamily: 'Gilroy',
                   fontWeight: FontWeight.w500,
                  letterSpacing: .5,
                ),
              );}
            else{
             
              return  Text(
                '${widget.name}',
                style: TextStyle(
                  fontSize: 14,
                 fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  letterSpacing: .5,
                ),
              );
              
          }
             }  
           ),
          ],
        ),
      ),
    );
  }
}
