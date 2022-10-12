import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../../Exports/Exports.dart';

class ProfileVideoPlayerScreen extends StatefulWidget {
  final String url;
  final ScrollController scrollController;
  ProfileVideoPlayerScreen(
      {Key? key, required this.url, required this.scrollController})
      : super(key: key);

  @override
  _ProfileVideoPlayerScreenState createState() =>
      _ProfileVideoPlayerScreenState();
}

class _ProfileVideoPlayerScreenState extends State<ProfileVideoPlayerScreen> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    setState(() {});
    print(widget.url);
    _controller = VideoPlayerController.network('${widget.url}');
    _initializeVideoPlayerFuture = _controller!.initialize();
    _controller!.setLooping(true);
    _controller!.setVolume(0.0);
    // _controller.videoPlayerOptions.
    // _controller!.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.url);
    //    _controller = VideoPlayerController.network(
    //     'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4');
    // _initializeVideoPlayerFuture = _controller!.initialize();
    // _controller!.setLooping(true);
    // _controller!.setVolume(1.0);
    return VisibilityDetector(
      key: ObjectKey(_controller),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && this.mounted) {
          _controller!.pause(); //pausing  functionality

        } else {
          _controller!.play();
        }
      },
      child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                      _controller!.value.hasError
                          ? Container(
                              color: Colors.grey,
                              width: double.infinity,
                              child: Center(child: Text('Error Video')),
                            )
                          : Container()
                      //                Container(
                      //                   /// height: 40.h,
                      //                  child: FloatingActionButton(
                      //                    backgroundColor: Colors.transparent,
                      //                    onPressed: () {
                      //   // Wrap the play or pause in a call to `setState`. This ensures the
                      //   // correct icon is shown.
                      //   setState(() {
                      //     // If the video is playing, pause it.
                      //     if ( _controller!.setVolume(0.0)) {
                      //      _controller!.setVolume(0.1);
                      //     } else {
                      //       // If the video is paused, play it.
                      //        _controller!.setVolume(0);
                      //     }
                      //   });
                      //   },
                      //   // Display the correct icon depending on the state of the player.
                      //   child: Icon(
                      //  _controller!.setVolume(0.0)==_controller!.setVolume(0.0) ? Icons.volume_up : Icons.volume_off,
                      //   ),
                      //                   ),
                      //                )
                      // else Container()
                    ],
                  ),
                  Container(
                    /// height: 40.h,
                    child: FloatingActionButton(
                      elevation: 0,

                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        print(_controller!.value.volume);
                        // Wrap the play or pause in a call to `setState`. This ensures the
                        // correct icon is shown.
                        setState(() {
                          // // If the video is playing, pause it.
                          if (_controller!.value.volume == 1.0) {
                            _controller!.setVolume(0.0);
                          } else {
                            _controller!.setVolume(1.0);
                            // If the video is paused, play it.
                            //_controller!.setVolume(0.1);
                          }
                        });
                      },
                      // Display the correct icon depending on the state of the player.
                      child: Icon(
                        _controller!.value.volume == 1.0
                            ? Icons.volume_up
                            : Icons.volume_off,
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Container(
                height: 35.5.h,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                ),
              );
            }
          }),
    );
  }
}
