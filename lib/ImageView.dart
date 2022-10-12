import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';

class ImageView extends ConsumerStatefulWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ImageViewState();
}

class _ImageViewState extends ConsumerState<ImageView> {
 final _transformationController = TransformationController();
TapDownDetails? _doubleTapDetails;
  @override
  Widget build(BuildContext context) {
    final photsprov =ref.watch(viewphotoprov);
    return Scaffold(
      backgroundColor: Color(0xffF9F2FF),
      body: SafeArea(
        child: CustomScrollView(
            
            physics:  BouncingScrollPhysics(),
            slivers: 
              [
                SliverList(delegate: SliverChildListDelegate(
                  [
                   Row(mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Padding(
                         padding:  EdgeInsets.all(10.sp),
                         child: IconButton(onPressed: (){
                           Navigator.pop(context);
                         },icon: Icon(Icons.close),),
                       ),
                     ],
                   ),
                   GestureDetector(
                       onDoubleTapDown: _handleDoubleTapDown,
    onDoubleTap: _handleDoubleTap,
                     child: InteractiveViewer(
                         transformationController: _transformationController,
                alignPanAxis: false,
                maxScale: 5.0,
                       child: CachedNetworkImage(
                        imageUrl:  '${photsprov.photodata}',
                        placeholder: (context, url) => Container(
                            height: 35.5.h,
                                  width: double.infinity,
                          child: Center(child: new CircularProgressIndicator())),
                        errorWidget: (context, url, error) => Image.asset( "Assets/Images/Portrait_Placeholder.png",),
                                         ),
                     ),
                   ),
                  //  CachedNetworkImage(
                  //    width: double.infinity,
                  //         imageUrl:  '${photsprov.photodata}',
                  //              imageBuilder: (context, imageProvider) =>Container(
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                          
                  //           image: imageProvider,
                  //           fit: BoxFit.contain,
                  //               ),
                  //     ),
                  //   ),
                  //        // placeholder: (BuildContext, String)=>,  
                  //         progressIndicatorBuilder: (context, url, downloadProgress) => 
                  //                 CircularProgressIndicator(value: downloadProgress.progress),
                  //         errorWidget: (context, url, error) =>
                  //         //Icon(Icons.error)
                  //           Image.asset("Assets/Images/placeholder-image.png",fit: BoxFit.cover,),
                  //      )
                  ]
                )
                ), 
            ],
          ),
      ),
    );
  }
   void _handleDoubleTapDown(TapDownDetails details) {
  _doubleTapDetails = details;
}

void _handleDoubleTap() {
  if (_transformationController.value != Matrix4.identity()) {
    _transformationController.value = Matrix4.identity();
  } else {
    final position = _doubleTapDetails!.localPosition;
    // For a 3x zoom
    _transformationController.value = Matrix4.identity()
      ..translate(-position.dx * 2, -position.dy * 2)
      ..scale(3.0);
    // Fox a 2x zoom
    // ..translate(-position.dx, -position.dy)
    // ..scale(2.0);
  }
  }
}