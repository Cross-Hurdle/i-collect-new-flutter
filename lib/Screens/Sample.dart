// import 'package:flutter/material.dart';

// class Sample1 extends StatefulWidget {
//   const Sample1({Key? key}) : super(key: key);

//   @override
//   _Sample1State createState() => _Sample1State();
// }

// class _Sample1State extends State<Sample1> {
//   List<DataModel>? category = [];
//   List<DataModel>? filteredList = [];

//   @override
//   void initState() {
//     mapCategory();
//     super.initState();
//   }

//   void mapCategory() {
//     category = data!.map((json) => DataModel.fromJson(json)).toList();

//     setState(() {});
//   }

//   void filter(String? val) {
//     List filteredData = [];

//     if (val!.isNotEmpty) {
//       data!.forEach(
//         (element) {
//           if (element["Title"].toLowerCase().contains(val)) {
//             filteredData.add(
//               {
//                 "Id": element["Id"],
//                 "Title": element["Title"],
//                 "Image": element["Image"],
//               },
//             );
//           } else {}
//         },
//       );
//     } else {
//       filteredData = data!;
//     }

//     category = filteredData.map((json) => DataModel.fromJson(json)).toList();

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(),
//       body: Container(
//         padding: EdgeInsets.all(15),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search ',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (val) => filter(val.toLowerCase()),
//             ),
//             SizedBox(height: 15),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 15,
//                   crossAxisSpacing: 15,
//                 ),
//                 itemBuilder: (_, i) => item(
//                   id: category![i].id,
//                   title: category![i].title,
//                   image: category![i].image,
//                 ),
//                 itemCount: category!.length,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget item({int? id, String? image, String? title}) {
//     return InkWell(
//       onTap: () {
//         print("$id  $title  $image");
//       },
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: Image.network(image!, fit: BoxFit.cover),
//           ),
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             color: Colors.black.withOpacity(0.7),
//             alignment: Alignment.center,
//             child: Text(
//               title!,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//                 letterSpacing: 1,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List? data = [
//     {
//       "Id": 1,
//       "Title": "Jean",
//       "Image":
//           "https://thumbs.dreamstime.com/b/rainbow-love-heart-background-red-wood-60045149.jpg"
//     },
//     {
//       "Id": 2,
//       "Title": "Jacket",
//       "Image":
//           "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
//     },
//     {
//       "Id": 3,
//       "Title": "Shirt",
//       "Image":
//           "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg"
//     },
//     {
//       "Id": 4,
//       "Title": "T-Shirt",
//       "Image":
//           "https://images.unsplash.com/photo-1471879832106-c7ab9e0cee23?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
//     },
//     {
//       "Id": 5,
//       "Title": "Track",
//       "Image":
//           "https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__480.jpg"
//     },
//     {
//       "Id": 6,
//       "Title": "Shorts",
//       "Image":
//           "https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747?b=1&k=20&m=1297349747&s=170667a&w=0&h=oH31fJty_4xWl_JQ4OIQWZKP8C6ji9Mz7L4XmEnbqRU="
//     },
//   ];
// }

// class DataModel {
//   int? id;
//   String? title;
//   String? image;

//   DataModel({this.id, this.title, this.image});

//   DataModel.fromJson(Map<String, dynamic> json) {
//     id = json["Id"];
//     title = json['Title'];
//     image = json['Image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.id;
//     data['Title'] = this.title;
//     data['Image'] = this.image;
//     return data;
//   }
// }
import 'package:icollekt/Exports/Exports.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {
  @override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
late  VideoPlayerController _controller;
late  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.blue,
              ),
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(_controller.value.isPlaying){
              _controller.pause();
            }else{
              _controller.play();
            }
          });
        },
        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      ),
    ),
    );
  }
}