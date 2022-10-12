import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';

// class Sample extends ConsumerStatefulWidget {
//   const Sample({Key? key}) : super(key: key);

//   @override
//   State<Sample> createState() => _SampleState();
// }

// class _SampleState extends ConsumerState<Sample> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: topappbar(context),
//       body:Column(
//         children: [
//           Image.file(),
//         ],
//       )
         
//     );
//   }

//   AppBar topappbar(context){
//     return AppBar(
     
//       centerTitle: true,
//       backgroundColor: Colors.white,
//       elevation: 1,
//         leading: GestureDetector(
//         onTap: (){
//         Navigator.pop(context);
//         },
//         child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
//     );
//   }
// }
class Sample extends ConsumerStatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SampleState();
}

class _SampleState extends ConsumerState<Sample> {

  @override
  Widget build(BuildContext context) {
    final data= ref.watch(grouppostprov);
    print('122${data.photodata}');
    return Scaffold(
      appBar: topappbar(context),
      body:Column(
        children: [
          //Image.file(data.photodata!)==null?Container(): Image.file(data.photodata!),
        ],
      )
         
    );
  }
   AppBar topappbar(context){
    return AppBar(
     
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