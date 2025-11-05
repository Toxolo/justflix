
import 'package:flutter/material.dart';
import '../../domain/entities/video.dart';
import '../../domain/usecases/get_videos.dart';

class VideoProvider extends ChangeNotifier {
  final GetVideos getVideos;
  List<Video> _videos = [];
  bool _isLoading = false;

  VideoProvider({required this.getVideos});

  List<Video> get videos => _videos;
  bool get isLoading => _isLoading;

  Future<void> fetchVideos() async {
    _isLoading = true;
    notifyListeners();
    _videos = await getVideos();
    _isLoading = false;
    notifyListeners();
  }
}
