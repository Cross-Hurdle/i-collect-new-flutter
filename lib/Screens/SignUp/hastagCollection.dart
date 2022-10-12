import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/GetHastag_response.dart';
import 'package:icollekt/Services/Provider.dart';

import 'ProfileImage.dart';

class CollectionHastags extends  ConsumerStatefulWidget {
  final int id;
  CollectionHastags({Key? key, required this.id}) : super(key: key);

  @override
  _CollectionHastagsState createState() => _CollectionHastagsState();
}

class _CollectionHastagsState extends ConsumerState<CollectionHastags> {
  bool selectedItem = false;
   List selection=[];
TextEditingController _searchcontroller= TextEditingController();
 
  @override
  void initState() {
    getCollectionData();
    super.initState();
  }
//  void filter(String inputString) {
//     filteredList =
//         fooList.where((i) => i.toLowerCase().contains(inputString)).toList();
//     setState(() {});
//   }



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

    ref.read(hastagProv).selectedhastagIndex = selectionIndex;
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

getUpdateCollection(HastagData provider)async{

if(provider.selected.length == 5 ){
    
    final updateResponse = await CollectionRepository().updateHastag(widget.id,provider.selected );
   
    if(updateResponse.result == true){ 
      print(updateResponse.result);
        print(updateResponse.message);
        print(widget.id);

        Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpProfileImage(id: widget.id))
    );
    }else { 
      print(updateResponse.message);
      showToast(updateResponse.message,
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
      // Fluttertoast.showToast(msg: updateResponse.message);
    //     Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SignUpProfileImage(id: widget.id)
    //   // CollectionHastags(
    //   //   id: widget.number,
    //   // )
    //   //  SignUpProfileImage(
    //   //   id: widget.number,
    //   // )
    //   ),
    // );
    }

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
 //Fluttertoast.showToast(msg: 'Please Select any 3 collections');
 return ;
}


 
  

}
 
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
        print(widget.id);

       
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
  //List? collection = ["Street", "Jeans", "Suit", "Jeans", "Suit",'Pullover','Metal','Classic','Formal','Shirt','Collar'];
  @override
  Widget build(BuildContext context) {
   // print(_searchcontroller.text);
  // final hastag =ref.watch(hastagProv);
    return Scaffold(
     // backgroundColor: Color(0xffF2F2F7),
      body: 
      Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
               // displayInfo(),
               Container(height: 150,),
                title(),
                SizedBox(height: 1.h,),
                 subtitle(),
                  SizedBox(height: 2.h,),
               textField(),
                SizedBox(height: 2.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Divider(thickness: 1,color: Colors.grey[300],),
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
             return SelectedItems1(
         
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
    // :Row(mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     Container(
    //   child: InkWell(
    //     onTap: (){
    //       //  onSelect(provider);
    //       // print(provider.selected);
    //       //  selectedItem = !selectedItem;
    //       //  widget.selectedItem(selectedItem);
    //      setState(() {
           
    //      });
    //     },
    //     child: Container(
    //        decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //        // color:Color(0xffF2F2F7),
    //          boxShadow: [
    //     BoxShadow(
    //       color: Colors.black12,
    //       spreadRadius: 1,
    //       blurRadius: 5,
    //       offset: Offset(2, 2), // changes position of shadow
    //     ),
    //       ],
    //       ),
    //       child: Text(
    //               '${_searchcontroller.text}',
    //               style: TextStyle(
    //                 fontSize: 13.sp,
    //                 color:Color(0xffF2F2F7),
                    
    //                 fontWeight: FontWeight.bold,
    //                 letterSpacing: .5,
    //               ),
    //             )
    //     ),
    //   ),
    //   margin: EdgeInsets.all(10),
    // )
    //   ],
    // )
                
                //next(),
              ],
            ),
            next(),
             BottomContainer()
          ],
        ),
      ),
    );
  }
     title() {
    return Text(
        'What do you collekt?',
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 17.sp,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w600,
          letterSpacing: .5,
        ),
      );
  }
       subtitle() {
    return Text(
        'Choose what you love',
        style: TextStyle(
          fontFamily: 'Gilroy',
          color: kPrimaryColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: .5,
        ),
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
 

 

  Widget next() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: MaterialButton(
        onPressed: () {
    //        Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) =>
    //    SignUpProfileImage(
    //     id: widget.id,
    //   )
    //   ),
    // );
         getUpdateCollection(ref.watch(hastagProv));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            'Continue',
            style: TextStyle(
              color: kBackground,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
            ),
          ),
        ),
        minWidth: 100.w,
        elevation: 5,
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
        ),
      ),
    );
  }
}
class SelectedItems1 extends  ConsumerStatefulWidget {
 final  image;
  final name;
   final id;
 final selectedItem;
   SelectedItems1({ Key? key, this.image,this.name,this.selectedItem,this.id }) : super(key: key);

  @override
  _SelectedItems1State createState() => _SelectedItems1State();
}

class _SelectedItems1State extends ConsumerState<SelectedItems1> {
  @override
  void initState() { 
    super.initState();
    
    setState(() {
      
    });
  }
 //bool isSelected = false;
  
  onSelect(HastagData prov) {
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
  } else {
    if (prov.selected.length<5) {
       prov.selected.add(widget.id);
    }
    
  }
    setState(() {});
  }
  bool selectedItem = false;
  @override
  Widget build(BuildContext context) {
    final provider=ref.watch(hastagProv);
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
