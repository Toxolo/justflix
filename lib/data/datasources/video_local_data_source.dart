
import 'dart:convert';

import 'package:flutter/services.dart';
import '../mappers/video_mapper.dart';

abstract class VideoLocalDataSource {
  Future<List<VideoMapper>> getVideos();
}

class VideoLocalDataSourceImpl implements VideoLocalDataSource {
  @override
  Future<List<VideoMapper>> getVideos() async {
    final response = await rootBundle.loadString('lib/data/videos.json');
    final data = json.decode(response);
    return (data['videos'] as List).map((video) => VideoMapper.fromJson(video)).toList();
  }
}
