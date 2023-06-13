import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/model_shelearns.dart';

class ShelearnsDetails extends StatefulWidget {
  ModelShelearns? shelearns;

  ShelearnsDetails(ModelShelearns shelearns) {
    this.shelearns = shelearns;
  }

  @override
  State<ShelearnsDetails> createState() => _ShelearnsDetailsState();
}

class _ShelearnsDetailsState extends State<ShelearnsDetails> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    print('widget.shelearns.toString()');
    _controller = VideoPlayerController.network(widget.shelearns!.videoUrl!)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('widget.shelearns.toString()');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 220,
                    child: Stack(
                      children: [
                        _controller.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              )
                            : CachedNetworkImage(
                                imageUrl: widget.shelearns!.image!,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                placeholder: (context, url) => Container(
                                  color: Colors.grey[300],
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.grey[300],
                                ),
                              ),
                        _controller.value.isInitialized
                            ? Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          seek_back();
                                        });
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              right: 24,
                                              left: 24,
                                              top: 3,
                                              bottom: 3),
                                          decoration: new BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(4),
                                              ),
                                              color: Colors.red[300]),
                                          child: Icon(
                                            Icons.fast_rewind,
                                            size: 18,
                                            color: Colors.white,
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          // _controller.seekTo(Duration(seconds: 2));
                                          _controller.value.isPlaying
                                              ? _controller.pause()
                                              : _controller.play();
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            right: 24,
                                            left: 24,
                                            top: 3,
                                            bottom: 3),
                                        decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            color: Colors.red[300]),
                                        child: Icon(
                                          _controller.value.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          seek();
                                        });
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              right: 24,
                                              left: 24,
                                              top: 3,
                                              bottom: 3),
                                          decoration: new BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(4),
                                              ),
                                              color: Colors.red[300]),
                                          child: Icon(
                                            Icons.fast_forward,
                                            size: 18,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Text(widget.shelearns!.content!),
            )
          ],
        ),
      ),
    );
  }

  seek() async {
    await _controller.position.then((value) {
      int? x = value!.inSeconds + 2;
      _controller.pause();
      _controller.seekTo(Duration(seconds: x));
      _controller.play();
    });
  }

  seek_back() async {
    await _controller.position.then((value) {
      int? x = value!.inSeconds - 2;
      _controller.pause();
      _controller.seekTo(Duration(seconds: x));
      _controller.play();
    });
  }
}
