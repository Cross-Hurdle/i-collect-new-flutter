import 'package:expandable/expandable.dart';

import 'package:icollekt/Exports/Exports.dart';

const loremIpsum ='sdasdasdadsdsds';
class FAQ extends StatefulWidget {
  final int ?id;
  FAQ({Key? key,this.id}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
@override
void initState() { 
  super.initState();
  getfaq();
}
List faqdata=[];
var productList =[];
getfaq()async{  
  final faqResponse = await AuthRepository().getfaq();
  if(faqResponse.data.isNotEmpty){ 
    faqdata.addAll(faqResponse.data); 
    faqResponse.data.forEach((element) {
          setState(() {
            productList.add(element.answer);
          });
          print('$productList');
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: buildappbar(context),
       body: CustomScrollView(
        physics:  BouncingScrollPhysics(),
        slivers: 
          [
            SliverList(delegate: SliverChildListDelegate(
              [
                faqlist(),
                 
              ]
            )
            ),
          
            //  SliverList(delegate: SliverChildListDelegate(
            //   [
            //      profiletop(),
            //   ]
            // )
            // ),
         
         
        ],
      ),
        
    );
  }
   Widget faqlist(){
     return Column(
       children: [
         Container(
           height:faqdata.length+120.h,
          // height: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
           child: ListView.builder(
                     itemCount:
                     // 2,
                     faqdata.length,
                     itemBuilder: (context,index){
                     return Expandedlist(title:
                     // 'd',
                     faqdata[index].question,
                     content: 
                     //'1'
                     faqdata[index].answer,
                      );
                   }),
         ),
       ],
     );
   }
  AppBar buildappbar(context){
    return AppBar(
      backgroundColor: kBackground,
        leading: GestureDetector(
        onTap: (){
         Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      centerTitle: true,
      title: Text('FAQ',style: TextStyle(
        color: Color(0xff1A1A1A),
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w700
      ),),
      // actions: [
      //   GestureDetector(
      //     onTap: (){

      //     },
      //     child: Image.asset("Assets/Images/search.png",
      //        width: 6.w,
      //         ),
      //   ),
      //   SizedBox(width: 4.w,)
      // ],
      elevation: 1,
    );
  }
}

class Expandedlist extends StatelessWidget {
 final String? title;
 final String? content;
 Expandedlist({
    Key? key,
    this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 2),
           width: double.infinity,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
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
          child: Column(
            children: <Widget>[
             
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                      padding: EdgeInsets.only(left:15.sp,top: 5.sp,bottom: 5.sp),
                      child: Text(
                       '$title',
                        style: TextStyle(
                          color: Color(0xff2E2E2E),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp
                        ),
                      )),
                  collapsed: Container(),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (var _ in Iterable.generate(1))
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              '$content',
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
