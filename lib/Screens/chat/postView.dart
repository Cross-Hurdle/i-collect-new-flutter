import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';

class PostViewScreen extends ConsumerStatefulWidget {
  const PostViewScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostViewScreenState();
}

class _PostViewScreenState extends ConsumerState<PostViewScreen> {
final _transformationController = TransformationController();
TapDownDetails? _doubleTapDetails;
  @override
  Widget build(BuildContext context) {
    final  imageview= ref.watch(viewMygroupprov);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
        onTap: (){
        Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
     // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            GestureDetector(
               onDoubleTapDown: _handleDoubleTapDown,
    onDoubleTap: _handleDoubleTap,
              child: InteractiveViewer(
                  transformationController: _transformationController,
                alignPanAxis: false,
                maxScale: 5.0,
                child: Container(
                  
                //  margin: EdgeInsets.symmetric(vertical: 10.h),
               height: 75.5.h,
                 color: Colors.black,
                 width: double.infinity,
                  child: CachedNetworkImage(
                                         imageUrl: '${imageview.postimage}',
                                         placeholder: (context, url) => Container(
                                            // height: 35.5.h,
                                        width: double.infinity,
                                           child: Center(child: new CircularProgressIndicator())),
                                         errorWidget: (context, url, error) => Image.asset( "Assets/Images/Portrait_Placeholder.png",),
                                       ),
                ),
              ),
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