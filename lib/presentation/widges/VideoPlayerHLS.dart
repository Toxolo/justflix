import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerHLS extends StatefulWidget {
  final String url;
  final double height;
  final double width;

  const VideoPlayerHLS({
    super.key,
    required this.url,
    this.height = 200,
    this.width = 400,
  });

  @override
  State<VideoPlayerHLS> createState() => _VideoPlayerHLSState();
}

class _VideoPlayerHLSState extends State<VideoPlayerHLS> {
  VideoPlayerController? _controller;
  ChewieController? _chewie;

  @override
  void initState() {
    super.initState();
    _initVideo(widget.url);
  }

  @override
  void didUpdateWidget(VideoPlayerHLS oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.url != widget.url) {
      _initVideo(widget.url);
    }
  }

  void _initVideo(String url) async {
    // Tancar l'anterior si existix
    await _controller?.dispose();
    _chewie?.dispose();

    _controller = VideoPlayerController.networkUrl(Uri.parse(url));

    await _controller!.initialize(); // esperem que carregue

    _chewie = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: false,
      aspectRatio: widget.width / widget.height,
    );

    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    _chewie?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return SizedBox(
        height: widget.height,
        width: widget.width,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Chewie(controller: _chewie!),
    );
  }
}
