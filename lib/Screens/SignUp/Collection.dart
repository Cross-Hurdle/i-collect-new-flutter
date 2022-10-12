//import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/Collection_modle.dart';
import 'package:icollekt/Services/Provider.dart';

import 'hastagCollection.dart';

class Collection extends ConsumerStatefulWidget {
  final String? username;
  final String? email;
  final String? password;
  final int number;
 // final int userId;
  const Collection(
      {Key? key, this.username, this.email, required this.number, this.password})
      : super(key: key);

  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends ConsumerState<Collection> {
  

  int count = 3;

  TextEditingController textEditingController = new TextEditingController();
// late List<String> newDataList;
// List<String> newDataList =List.from(collection);
//List? collection = ["Street", "Jeans", "Suit", "Street", "Jeans", "Suit"];
// List fooList = ["Street", "Jeans", "Suit", "Street", "Jeans", "Suit"];

bool selectedItem = false;
   List selection=[];

 
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



 CollectionResponse? collectionResponse;

getCollectionData()async { 
     collectionResponse = await CollectionRepository().getCollectionData();
     
     setState(() {
       
     });
     collectionResponse!.data.forEach(
        (element) {
         
            filteredData.add(
              {
              
            "Id": element.id,
            "title": element.title,
            "image":  element.image,
            "status": element.status,
            "createdAt": element.createdAt,
            "updatedAt":element.updatedAt
    
              
              },
            );

        },
        
      );
      // print('sdsd${filteredData[0]['id']}');
        for (int i = 0; i < filteredData.length; i++) {
      selectionIndex.add(
        {"Index": i, "Id": filteredData[i]['Id'], "IsSelected": false,'title':filteredData[i]['title']},
      );
     // print(selectionIndex);
    }

    ref.read(collectionProv).selectedIndex = selectionIndex;
    setState(() {});

}
  // List< CollectionResponse>? category = [];
  //List<DataModel>? filteredList = [];
    List filteredData = [];
  List selectionIndex = [];
  void filter(String? val) {
    List sample=[];


    if (val!.isNotEmpty) {

      collectionResponse!.data.forEach(
        (element) {

          if (element.title.toLowerCase().contains(val)) {
            sample.add(
              {
           "Id": element.id,
            "title": element.title,
            "image":  element.image,
            "status": element.status,
            "createdAt": element.createdAt,
            "updatedAt":element.updatedAt
    
              
              },
            );
             
          } else {
            // print(filteredData);
          }
        },
      );
     
    } else {
      print('empty');
       collectionResponse!.data.forEach(
        (element) {
         
           sample.add(
              {
              
            "Id": element.id,
            "title": element.title,
            "image":  element.image,
            "status": element.status,
            "createdAt": element.createdAt,
            "updatedAt":element.updatedAt
    
              
              },
            );
       
        },
      );
    }
    filteredData=sample;

    setState(() {});

  }

getUpdateCollection(CollectionData provider)async{

if (provider.selected.isNotEmpty) {
  if(provider.selected.length <= 3  ){
    
    final updateResponse = await CollectionRepository().updateCollection(widget.number, provider.selected);
   
    if(updateResponse.result == false){ 
      // Fluttertoast.showToast(msg: updateResponse.message);
    //    showToast(updateResponse.message,
    //  textStyle: TextStyle(color: Colors.black),
    //  backgroundColor: Colors.grey[300],
    //                 context: context,
                    
    //                 borderRadius: BorderRadius.circular(10),
    //                 animation: StyledToastAnimation.size,
    //                 reverseAnimation: StyledToastAnimation.size,
    //                 axis: Axis.horizontal,
    //                 position: StyledToastPosition.center,
    //                 animDuration: Duration(milliseconds: 400),
    //                 duration: Duration(seconds: 2),
    //                 curve: Curves.linear,
    //                 reverseCurve: Curves.linear);
    //     Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => CollectionHastags(
    //     id: widget.number,
    //   )
      //  SignUpProfileImage(
      //   id: widget.number,
      // )
    //   ),
    // );
    }else { 
      print(widget.number);
     //   print(widget.number);
      print(updateResponse.message);
    //   showToast(updateResponse.message,
    //  textStyle: TextStyle(color: Colors.black),
    //  backgroundColor: Colors.grey[300],
    //                 context: context,
                    
    //                 borderRadius: BorderRadius.circular(10),
    //                 animation: StyledToastAnimation.size,
    //                 reverseAnimation: StyledToastAnimation.size,
    //                 axis: Axis.horizontal,
    //                 position: StyledToastPosition.center,
    //                 animDuration: Duration(milliseconds: 400),
    //                 duration: Duration(seconds: 2),
    //                 curve: Curves.linear,
    //                 reverseCurve: Curves.linear);
      // Fluttertoast.showToast(msg: updateResponse.message);
        Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CollectionHastags(
        id: widget.number,
      )
      //  SignUpProfileImage(
      //   id: widget.number,
      // )
      ),
    );
    }

} else {
  
  showToast('choose up to 3',
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
} else {
  showToast('choose up to 3',
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
// List selecteditems=[];
// List selectedindex=[];
//   bool reload =false;
  @override
  Widget build(BuildContext context) {
    //  final provider=ref.watch(collectionProv);
    //  final provider1=ref.watch(collectionProv1);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackground,
      appBar: buildAppBar(),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                displayInfo(),
                Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child:
         GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index){ 
            
         //  provider1.id=filteredData[index]['id'];
           return SelectedItems(

           

                  name: filteredData[index]['title'],
                  image:filteredData[index]['image'],
                  id: filteredData[index]['Id'],

           );

          },
          //  => _CollectionItem(
          //   item: filteredList[index],
          //   //collection![index],
          //   callBack: callBack,
          //   count: count,
          //   collection: filteredList,
          //   images: imageList[index],
          // ),
          itemCount: filteredData.length,
        ),
      ),
    ),
                
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

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kBackground,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.keyboard_arrow_left,
          size: 30.sp,
          color: kBlack,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Get Started',
        style: TextStyle(
          color: kBlack,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      elevation: 0,
    );
  }

  Widget displayInfo() {
    return Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: kBackground,
        boxShadow: [
          BoxShadow(
            color: kShadow,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(
              'Step 7 of 7',
              style: TextStyle(
                color: kGoldText,
                fontSize: 16.sp,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "What do you collect?\nChoose $count",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
          ),
          collectionField(),
        ],
      ),
    );
  }

  Widget collectionField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
               onChanged: (text) {
              text = text.toLowerCase();
              filter(text);

            },
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  letterSpacing: .5,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.search_rounded,
              color: kPrimaryColor,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }

  callBack(int state) {
    setState(() {});
    count = count + state;
  }

  // Widget collections() {
  //   return 
  // }

  // onPressed() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => SignUpProfileImage()),
  //   );
  // }

  Widget next() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: MaterialButton(
        onPressed: () {
          getUpdateCollection(ref.watch(collectionProv));
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



class SelectedItems extends ConsumerStatefulWidget {
 final  id;
 final image;
 final name;

   
  // bool reload;
   SelectedItems({ Key? key, this.image,this.name,
   this.id,}) : super(key: key);

  @override
  _SelectedItemsState createState() => _SelectedItemsState();
}

class _SelectedItemsState extends ConsumerState<SelectedItems> {

bool isSelected = false;

  onSelect(CollectionData prov) {
    for (var i = 0; i < prov.selectedIndex.length; i++) {
      if (prov.selectedIndex[i]['Id'] == widget.id) {
        prov.selectedIndex[i]["IsSelected"] =
            !prov.selectedIndex[i]["IsSelected"];
       if(  prov.selectedIndex[i]["IsSelected"]){
         prov.selected.add(widget.name);
       }else{
         prov.selected.remove(widget.name);
       }
      }
    }
print(prov.selected);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider=ref.watch(collectionProv);
    // provider.id=widget.id;
    // provider.mapselected();
    return Container(
      child: InkWell(
        onTap: (){
           
          onSelect(provider);
           print(isSelected);
 
        },
        child: Card(
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                         height: 14.5.h,
                        width: double.infinity,
                         color: Colors.grey[600],
                         child:  CachedNetworkImage(
                            imageUrl:  '${widget.image}',
                                 imageBuilder: (context, imageProvider) =>Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                              opacity: .5
                             // colorFilter:
                                //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                  ),
                        ),
                      ),
                           // placeholder: (BuildContext, String)=>,  
                            progressIndicatorBuilder: (context, url, downloadProgress) => 
                                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                            errorWidget: (context, url, error) =>
                            Icon(Icons.error)
                              // Image.asset("Assets/Images/placeholder-image.png",fit: BoxFit.cover,),
                         ),
                          //  Image.network(
                          //   "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                          //  //"Assets/Images/bg.png",
                          // //width: double.infinity,
                        
                          // fit: BoxFit.fitWidth,),
                      ),
              // Container(
              // decoration: BoxDecoration(   
              // image: DecorationImage(
              //   image: NetworkImage(widget.image, 
                
              //   ),
              //   onError: (object,trace){ 
              //     print(object.toString());
              //   },
              //   //whatever image you can put here
              //   //fit: BoxFit.cover,
              // ),
              // ),
              //   // CachedNetworkImage(
              //   //   imageUrl: '${widget.images}',
              //   //   errorWidget: (context,error,trace){
              //   //     print('errror ${widget.images}'); 
              //   //     return Container( color:Colors.grey);
              //   //   },
              //   // )
              // ),
              Text(
                '${widget.name}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: kBackground,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                ),
              ),
               Builder(
            builder: (context) {
              for (var i = 0; i < provider.selectedIndex.length; i++) {
                if (provider.selectedIndex[i]['Id'] == widget.id) {
                  if (provider.selectedIndex[i]['IsSelected'])
                 
                 {
                    // print(provider.selectedIndex[i]['title']);
                    isSelected = true;
                 }
                  else
                  {
                    isSelected = false;
                  }
                }
              }
              if (isSelected){
                
              //  provider.selected.add(widget.name);
              //  print( provider.selected);
                // provider.selected.add(isSelected);
                return  Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.7),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 50,
                  ),
                );}
              else{
               // provider.selected.remove(widget.name);
               // print( provider.selected);
               // provider.selected.remove(isSelected);
                return Container();
              }
                
            },
          ),
              
            ],
          ),
        ),
      ),
      margin: EdgeInsets.all(10),
    );
  }
}


