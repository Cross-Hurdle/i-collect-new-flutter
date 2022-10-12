// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:icollekt/Services/Provider.dart';

// // class Exp1 extends ConsumerStatefulWidget {
// //   const Exp1({Key? key}) : super(key: key);

// //   @override
// //   _Exp1State createState() => _Exp1State();
// // }

// // class _Exp1State extends ConsumerState<Exp1> {
// //   List<DataModel>? category = [];
// //   List<DataModel>? filteredList = [];
// //   List selectionIndex = [];

// //   @override
// //   void initState() {
// //     mapCategory();
// //     super.initState();
// //   }

// //   void mapCategory() {
// //     category = data!.map((json) => DataModel.fromJson(json)).toList();

// //     for (int i = 0; i < category!.length; i++) {
// //       selectionIndex.add(
// //         {"Index": i, "Id": category![i].id, "IsSelected": false},
// //       );
// //     }

// //     ref.read(collectionProv).selectedIndex = selectionIndex;
// //     setState(() {});
// //   }

// //   void filter(String? val) {
// //     List filteredData = [];

// //     if (val!.isNotEmpty) {
// //       data!.forEach(
// //         (element) {
// //           if (element["Title"].toLowerCase().contains(val)) {
// //             filteredData.add(
// //               {
// //                 "Id": element["Id"],
// //                 "Title": element["Title"],
// //                 "Image": element["Image"],
// //               },
// //             );
// //           } else {}
// //         },
// //       );
// //     } else {
// //       filteredData = data!;
// //     }

// //     category = filteredData.map((json) => DataModel.fromJson(json)).toList();

// //     setState(() {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(),
// //       body: Container(
// //         padding: EdgeInsets.all(15),
// //         child: Column(
// //           children: [
// //             TextField(
// //               decoration: InputDecoration(
// //                 hintText: 'Search ',
// //                 border: OutlineInputBorder(),
// //               ),
// //               onChanged: (val) => filter(val.toLowerCase()),
// //             ),
// //             SizedBox(height: 15),
// //             Expanded(
// //               child: GridView.builder(
// //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 2,
// //                   mainAxisSpacing: 15,
// //                   crossAxisSpacing: 15,
// //                 ),
// //                 itemBuilder: (_, i) => Items(
// //                   index: i,
// //                   id: category![i].id,
// //                   title: category![i].title,
// //                   image: category![i].image,
// //                 ),
// //                 itemCount: category!.length,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   List? data = [
// //     {
// //       "Id": 1,
// //       "Title": "Jean",
// //       "Image":
// //           "https://thumbs.dreamstime.com/b/rainbow-love-heart-background-red-wood-60045149.jpg"
// //     },
// //     {
// //       "Id": 2,
// //       "Title": "Jacket",
// //       "Image":
// //           "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
// //     },
// //     {
// //       "Id": 3,
// //       "Title": "Shirt",
// //       "Image":
// //           "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510__480.jpg"
// //     },
// //     {
// //       "Id": 4,
// //       "Title": "T-Shirt",
// //       "Image":
// //           "https://images.unsplash.com/photo-1471879832106-c7ab9e0cee23?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"
// //     },
// //     {
// //       "Id": 5,
// //       "Title": "Track",
// //       "Image":
// //           "https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__480.jpg"
// //     },
// //     {
// //       "Id": 6,
// //       "Title": "Shorts",
// //       "Image":
// //           "https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747?b=1&k=20&m=1297349747&s=170667a&w=0&h=oH31fJty_4xWl_JQ4OIQWZKP8C6ji9Mz7L4XmEnbqRU="
// //     },
// //   ];
// // }

// // class Items extends ConsumerStatefulWidget {
// //   final int? index;
// //   final int? id;
// //   final String? image;
// //   final String? title;

// //   const Items({Key? key, this.id, this.image, this.title, this.index})
// //       : super(key: key);

// //   @override
// //   _ItemsState createState() => _ItemsState();
// // }

// // class _ItemsState extends ConsumerState<Items> {
// //   bool isSelected = false;

// //   onSelect(CollectionData prov) {
// //     for (var i = 0; i < prov.selectedIndex.length; i++) {
// //       if (prov.selectedIndex[i]['Id'] == widget.id) {
// //         prov.selectedIndex[i]["IsSelected"] =
// //             !prov.selectedIndex[i]["IsSelected"];
// //       }
// //     }

// //     setState(() {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final prov = ref.watch(collectionProv);

// //     return InkWell(
// //       onTap: () {
// //         onSelect(prov);

// //         print(prov.selectedIndex);
// //       },
// //       child: Stack(
// //         alignment: Alignment.center,
// //         children: [
// //           Container(
// //             height: double.infinity,
// //             width: double.infinity,
// //             child: Image.network(widget.image!, fit: BoxFit.cover),
// //           ),
// //           Container(
// //             height: double.infinity,
// //             width: double.infinity,
// //             color: Colors.black.withOpacity(0.5),
// //             alignment: Alignment.center,
// //             child: Text(
// //               widget.title!,
// //               style: TextStyle(
// //                 fontWeight: FontWeight.bold,
// //                 fontSize: 20,
// //                 letterSpacing: 1,
// //                 color: Colors.white,
// //               ),
// //             ),
// //           ),
// //           Builder(
// //             builder: (context) {
// //               for (var i = 0; i < prov.selectedIndex.length; i++) {
// //                 if (prov.selectedIndex[i]['Id'] == widget.id) {
// //                   if (prov.selectedIndex[i]['IsSelected'])
// //                     isSelected = true;
// //                   else
// //                     isSelected = false;
// //                 }
// //               }
// //               if (isSelected)
// //                 return Container(
// //                   height: double.infinity,
// //                   width: double.infinity,
// //                   color: Colors.black.withOpacity(0.7),
// //                   alignment: Alignment.center,
// //                   child: Icon(
// //                     Icons.favorite,
// //                     color: Colors.white,
// //                     size: 50,
// //                   ),
// //                 );
// //               else
// //                 return Container();
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class DataModel {
// //   int? id;
// //   String? title;
// //   String? image;

// //   DataModel({this.id, this.title, this.image});

// //   DataModel.fromJson(Map<String, dynamic> json) {
// //     id = json["Id"];
// //     title = json['Title'];
// //     image = json['Image'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['Id'] = this.id;
// //     data['Title'] = this.title;
// //     data['Image'] = this.image;
// //     return data;
// //   }
// // }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:helpers/helpers.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_editor/video_editor.dart';
// import 'package:video_player/video_player.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         brightness: Brightness.dark,
//         textTheme: TextTheme(
//           bodyText1: TextStyle(),
//           bodyText2: TextStyle(),
//         ).apply(
//           bodyColor: Colors.white,
//           displayColor: Colors.white,
//         ),
//       ),
//       home: VideoPickerPage(),
//     );
//   }
// }

// //-------------------//
// //PICKUP VIDEO SCREEN//
// //-------------------//
// class VideoPickerPage extends StatefulWidget {
//   @override
//   _VideoPickerPageState createState() => _VideoPickerPageState();
// }

// class _VideoPickerPageState extends State<VideoPickerPage> {
//   final ImagePicker _picker = ImagePicker();

//   void _pickVideo() async {
//     final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
//     if (file != null)
//       context.navigator.push(MaterialPageRoute<void>(
//           builder: (BuildContext context) =>
//               VideoEditor(file: File(file.path))));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           backgroundColor: Colors.blue, title: Text("Image / Video Picker")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Click on Pick Video to select video",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18.0,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _pickVideo,
//               child: Text("Pick Video From Gallery"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //-------------------//
// //VIDEO EDITOR SCREEN//
// //-------------------//
// class VideoEditor extends StatefulWidget {
//   VideoEditor({Key? key, required this.file}) : super(key: key);

//   final File file;

//   @override
//   _VideoEditorState createState() => _VideoEditorState();
// }

// class _VideoEditorState extends State<VideoEditor> {
//   final _exportingProgress = ValueNotifier<double>(0.0);
//   final _isExporting = ValueNotifier<bool>(false);
//   final double height = 60;

//   bool _exported = false;
//   String _exportText = "";
//   late VideoEditorController _controller;

//   @override
//   void initState() {
//     _controller = VideoEditorController.file(widget.file,
//         maxDuration: Duration(seconds: 30))
//       ..initialize().then((_) => setState(() {}));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _exportingProgress.dispose();
//     _isExporting.dispose();
//     _controller.dispose();
//     super.dispose();
//   }

//   void _openCropScreen() => context.navigator.push(MaterialPageRoute<void>(
//       builder: (BuildContext context) => CropScreen(controller: _controller)));

//   void _exportVideo() async {
//     _isExporting.value = true;
//     bool _firstStat = true;
//     //NOTE: To use `-crf 1` and [VideoExportPreset] you need `ffmpeg_kit_flutter_min_gpl` package (with `ffmpeg_kit` only it won't work)
//     await _controller.exportVideo(
//       // preset: VideoExportPreset.medium,
//       // customInstruction: "-crf 17",
//       onProgress: (statics) {
//         // First statistics is always wrong so if first one skip it
//         if (_firstStat) {
//           _firstStat = false;
//         } else {
//           _exportingProgress.value = statics.getTime() /
//               _controller.video.value.duration.inMilliseconds;
//         }
//       },
//       onCompleted: (file) {
//         _isExporting.value = false;
//         if (!mounted) return;
//         if (file != null) {
//           final VideoPlayerController _videoController =
//               VideoPlayerController.file(file);
//           _videoController.initialize().then((value) async {
//             setState(() {});
//             _videoController.play();
//             _videoController.setLooping(true);
//             await showModalBottomSheet(
//               context: context,
//               backgroundColor: Colors.black54,
//               builder: (_) => AspectRatio(
//                 aspectRatio: _videoController.value.aspectRatio,
//                 child: VideoPlayer(_videoController),
//               ),
//             );
//             await _videoController.pause();
//             _videoController.dispose();
//           });
//           _exportText = "Video success export!";
//         } else {
//           _exportText = "Error on export video :(";
//         }

//         setState(() => _exported = true);
//         Misc.delayed(2000, () => setState(() => _exported = false));
//       },
//     );
//   }

//   void _exportCover() async {
//     setState(() => _exported = false);
//     await _controller.extractCover(
//       onCompleted: (cover) {
//         if (!mounted) return;

//         if (cover != null) {
//           _exportText = "Cover exported! ${cover.path}";
//           showModalBottomSheet(
//             context: context,
//             backgroundColor: Colors.black54,
//             builder: (BuildContext context) =>
//                 Image.memory(cover.readAsBytesSync()),
//           );
//         } else
//           _exportText = "Error on cover exportation :(";

//         setState(() => _exported = true);
//         Misc.delayed(2000, () => setState(() => _exported = false));
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: _controller.initialized
//           ? SafeArea(
//               child: Stack(children: [
//               Column(children: [
//                 _topNavBar(),
//                 Expanded(
//                     child: DefaultTabController(
//                         length: 2,
//                         child: Column(children: [
//                           Expanded(
//                               child: TabBarView(
//                             physics: NeverScrollableScrollPhysics(),
//                             children: [
//                               Stack(alignment: Alignment.center, children: [
//                                 CropGridViewer(
//                                   controller: _controller,
//                                   showGrid: false,
//                                 ),
//                                 AnimatedBuilder(
//                                   animation: _controller.video,
//                                   builder: (_, __) => OpacityTransition(
//                                     visible: !_controller.isPlaying,
//                                     child: GestureDetector(
//                                       onTap: _controller.video.play,
//                                       child: Container(
//                                         width: 40,
//                                         height: 40,
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           shape: BoxShape.circle,
//                                         ),
//                                         child: Icon(Icons.play_arrow,
//                                             color: Colors.black),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ]),
//                               CoverViewer(controller: _controller)
//                             ],
//                           )),
//                           Container(
//                               height: 200,
//                               margin: Margin.top(10),
//                               child: Column(children: [
//                                 TabBar(
//                                   indicatorColor: Colors.white,
//                                   tabs: [
//                                     Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Padding(
//                                               padding: Margin.all(5),
//                                               child: Icon(Icons.content_cut)),
//                                           Text('Trim')
//                                         ]),
//                                     Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Padding(
//                                               padding: Margin.all(5),
//                                               child: Icon(Icons.video_label)),
//                                           Text('Cover')
//                                         ]),
//                                   ],
//                                 ),
//                                 Expanded(
//                                   child: TabBarView(
//                                     children: [
//                                       Container(
//                                           child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: _trimSlider())),
//                                       Container(
//                                         child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [_coverSelection()]),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ])),
//                           _customSnackBar(),
//                           ValueListenableBuilder(
//                             valueListenable: _isExporting,
//                             builder: (_, bool export, __) => OpacityTransition(
//                               visible: export,
//                               child: AlertDialog(
//                                 backgroundColor: Colors.white,
//                                 title: ValueListenableBuilder(
//                                   valueListenable: _exportingProgress,
//                                   builder: (_, double value, __) => Text(
//                                     "Exporting video ${(value * 100).ceil()}%",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ])))
//               ])
//             ]))
//           : Center(child: CircularProgressIndicator()),
//     );
//   }

//   Widget _topNavBar() {
//     return SafeArea(
//       child: Container(
//         height: height,
//         child: Row(
//           children: [
//             Expanded(
//               child: GestureDetector(
//                 onTap: () => _controller.rotate90Degrees(RotateDirection.left),
//                 child: Icon(Icons.rotate_left),
//               ),
//             ),
//             Expanded(
//               child: GestureDetector(
//                 onTap: () => _controller.rotate90Degrees(RotateDirection.right),
//                 child: Icon(Icons.rotate_right),
//               ),
//             ),
//             Expanded(
//               child: GestureDetector(
//                 onTap: _openCropScreen,
//                 child: Icon(Icons.crop),
//               ),
//             ),
//             Expanded(
//               child: GestureDetector(
//                 onTap: _exportCover,
//                 child: Icon(Icons.save_alt, color: Colors.white),
//               ),
//             ),
//             Expanded(
//               child: GestureDetector(
//                 onTap: _exportVideo,
//                 child: Icon(Icons.save),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String formatter(Duration duration) => [
//         duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
//         duration.inSeconds.remainder(60).toString().padLeft(2, '0')
//       ].join(":");

//   List<Widget> _trimSlider() {
//     return [
//       AnimatedBuilder(
//         animation: _controller.video,
//         builder: (_, __) {
//           final duration = _controller.video.value.duration.inSeconds;
//           final pos = _controller.trimPosition * duration;
//           final start = _controller.minTrim * duration;
//           final end = _controller.maxTrim * duration;

//           return Padding(
//             padding: Margin.horizontal(height / 4),
//             child: Row(children: [
//               Text(formatter(Duration(seconds: pos.toInt()))),
//               Expanded(child: SizedBox()),
//               OpacityTransition(
//                 visible: _controller.isTrimming,
//                 child: Row(mainAxisSize: MainAxisSize.min, children: [
//                   Text(formatter(Duration(seconds: start.toInt()))),
//                   SizedBox(width: 10),
//                   Text(formatter(Duration(seconds: end.toInt()))),
//                 ]),
//               )
//             ]),
//           );
//         },
//       ),
//       Container(
//         width: MediaQuery.of(context).size.width,
//         margin: Margin.vertical(height / 4),
//         child: TrimSlider(
//             child: TrimTimeline(
//                 controller: _controller, margin: EdgeInsets.only(top: 10)),
//             controller: _controller,
//             height: height,
//             horizontalMargin: height / 4),
//       )
//     ];
//   }

//   Widget _coverSelection() {
//     return Container(
//         margin: Margin.horizontal(height / 4),
//         child: CoverSelection(
//           controller: _controller,
//           height: height,
//           nbSelection: 8,
//         ));
//   }

//   Widget _customSnackBar() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: SwipeTransition(
//         visible: _exported,
//         axisAlignment: 1.0,
//         child: Container(
//           height: height,
//           width: double.infinity,
//           color: Colors.black.withOpacity(0.8),
//           child: Center(
//             child: Text(_exportText,
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //-----------------//
// //CROP VIDEO SCREEN//
// //-----------------//
// class CropScreen extends StatelessWidget {
//   CropScreen({Key? key, required this.controller}) : super(key: key);

//   final VideoEditorController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Padding(
//           padding: Margin.all(30),
//           child: Column(children: [
//             Row(children: [
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () => controller.rotate90Degrees(RotateDirection.left),
//                   child: Icon(Icons.rotate_left),
//                 ),
//               ),
//               Expanded(
//                 child: GestureDetector(
//                   onTap: () =>
//                       controller.rotate90Degrees(RotateDirection.right),
//                   child: Icon(Icons.rotate_right),
//                 ),
//               )
//             ]),
//             SizedBox(height: 15),
//             Expanded(
//               child: AnimatedInteractiveViewer(
//                 maxScale: 2.4,
//                 child: CropGridViewer(
//                     controller: controller, horizontalMargin: 60),
//               ),
//             ),
//             SizedBox(height: 15),
//             Row(children: [
//               Expanded(
//                 child: SplashTap(
//                   onTap: context.navigator.pop,
//                   child: Center(
//                     child: Text(
//                       "CANCEL",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//               buildSplashTap("16:9", 16 / 9, padding: Margin.horizontal(10)),
//               buildSplashTap("1:1", 1 / 1),
//               buildSplashTap("4:5", 4 / 5, padding: Margin.horizontal(10)),
//               buildSplashTap("NO", null, padding: Margin.right(10)),
//               Expanded(
//                 child: SplashTap(
//                   onTap: () {
//                     //2 WAYS TO UPDATE CROP
//                     //WAY 1:
//                     controller.updateCrop();
//                     /*WAY 2:
//                     controller.minCrop = controller.cacheMinCrop;
//                     controller.maxCrop = controller.cacheMaxCrop;
//                     */
//                     context.navigator.pop();
//                   },
//                   child: Center(
//                     child: Text(
//                       "OK",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ]),
//           ]),
//         ),
//       ),
//     );
//   }

//   Widget buildSplashTap(
//     String title,
//     double? aspectRatio, {
//     EdgeInsetsGeometry? padding,
//   }) {
//     return SplashTap(
//       onTap: () => controller.preferredCropAspectRatio = aspectRatio,
//       child: Padding(
//         padding: padding ?? Margin.zero,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.aspect_ratio, color: Colors.white),
//             Text(
//               title,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey(
//     debugLabel: "Main Navigator");

// late String routeToGo = '/';
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
// String? payload;

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("_firebaseMessagingBackgroundHandler Clicked!");
//   routeToGo = '/second';
//   print(message.notification!.body);
//   flutterLocalNotificationsPlugin.show(
//       message.notification.hashCode,
//       message.notification?.title,
//       message.notification?.body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//         ),
//       ));
// }

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // titletion
//   importance: Importance.high,
// );


// Future<void> selectNotification(String? payload) async {
//   if (payload != null) {
//     debugPrint('notification payload: $payload');
//     navigatorKey.currentState?.pushNamed('/second');
//   }
// }

//   Future<void> main() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp();

//    // initialize background;
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//     // assign channel (required after android 8)
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     // initialize notification for android
//     var initialzationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//     var initializationSettings =
//     InitializationSettings(android: initialzationSettingsAndroid);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings);

//     final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//     await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

//     print('payload=');
//     payload= notificationAppLaunchDetails!.payload;
//   if(payload != null){
//     routeToGo = '/second';
//     navigatorKey.currentState?.pushNamed('/second');
//   }

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: selectNotification);

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       print(message.notification!.body != null);
//       if (message.notification!.body != null) {
//         navigatorKey.currentState?.pushNamed('/second');
//       }
//     });
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   late String token;
//   getToken() async {
//     token = (await FirebaseMessaging.instance.getToken())!;
//     print(token);
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
// /*
//     // check foreground notification
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("onMessage Clicked!");
//       print(message.notification!.body);
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 icon: android.smallIcon,
//               ),
//             ));
//       }
//     });*/
//     getToken();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//         navigatorKey: navigatorKey,
//       theme: ThemeData(
//         primaryColor: Colors.blue
//       ),
//       initialRoute: (routeToGo != null) ? routeToGo : '/',
//       // home: const MyHomePage(title: 'Flutter Demo Home Page'),
//       onGenerateRoute: (RouteSettings settings) {
//           switch (settings.name) {
//             case '/':
//               return MaterialPageRoute(
//                 builder: (_) => const MyHomePage(title: 'Home Page'),
//               );
//               break;
//             case '/second':
//               return MaterialPageRoute(
//                 builder: (_) => const SecondPage(),
//               );
//               break;
//             default:
//               return _errorRoute();
//           }
//       }
//     );
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(
//         builder: (_){
//           return Scaffold(
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Stack(
//                     children: [
//                       Align(
//                         child:  Container(
//                           width: 150,
//                           height: 150,
//                           child: Icon(
//                             Icons.delete_forever,
//                             size: 48,
//                           ),
//                         ),
//                         alignment: Alignment.center,
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: SizedBox(
//                           width: 150,
//                           height: 150,
//                           child: CircularProgressIndicator(
//                               strokeWidth: 4,
//                               value: 1.0
//                             // valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.withOpacity(0.5)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20,),
//                   Text('Page Not Found'),
//                   SizedBox(height: 10,),
//                   Text('Press back button on your phone', style: TextStyle(color: Color(0xff39399d), fontSize: 28),),
//                   SizedBox(height: 20,),
//                   /*ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop();
//                       return;
//                     },
//                     style: ButtonStyle(
//                       backgroundColor:
//                       MaterialStateProperty.all(Colors.orange),
//                     ),
//                     child: const Text('Back to home'),
//                   ),*/
//                 ],
//               ),
//             ),
//           );
//         }
//     );
//   }
// }

// class SecondPage extends StatelessWidget {
//   const SecondPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Page'),
//       ),
//       body: Center(
//         child: Text("Second page")
//       ),

//     );
//   }
// }


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // CustomPaint(
//               //   child: Container(
//               //     width: 400,
//               //     height: 410,
//               //     color: Colors.black,
//               //   ),
//               //   foregroundPainter: LinePainter(),
//               // )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class LinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     print(size);
//       var paint = Paint()
//       ..color = Colors.teal
//       ..strokeWidth = 1;
//       var str = 'm      ';
//       // canvas.drawLine(start, end, paint);
//       var path = Path();
//       path.moveTo(0,57.804239);
//       path.lineTo(51.121936,5.963);
//       path.lineTo(0.612,0.103);
//       path.lineTo(1.137,5.741);
//       path.lineTo(0.517,0.184);
//       path.lineTo(2.214,0.437);
//       path.lineTo(5.067,8.586);
//       path.lineTo(-0.727,3.214);
//       path.lineTo(-0.311,0.82);
//       path.lineTo(-8.509,0);
//       path.close();
//       canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//       return false;
//   }
    
// }
