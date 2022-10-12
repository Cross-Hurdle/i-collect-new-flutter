import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImagePreview extends ConsumerStatefulWidget {
  final List ?previewimages;
 ImagePreview({Key? key,this.previewimages}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends ConsumerState<ImagePreview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
Navigator.pop(context);
        }, icon: Icon(Icons.close)),
      ),
      body:Column(children: [
        Expanded(
          child:  buildGridView1() 
        
        )
      ],)
    );
  }
     Widget buildGridView1() {
       print(widget.previewimages!.length);
    return GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      children: List.generate(widget.previewimages!.length, (index) {
        Asset asset = widget.previewimages![index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }
}