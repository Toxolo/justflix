import 'dart:convert';
import 'package:http/http.dart' as http;

import '../mappers/video_mapper.dart';

abstract class VideoLocalDataSource {
  Future<List<VideoMapper>> getVideos();
}

class VideoLocalDataSourceImpl implements VideoLocalDataSource {

  final String url = "http://10.0.2.2:3000/api/videolist/";

  @override
  Future<List<VideoMapper>> getVideos() async {

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception("Error al obtener los vídeos: ${response.statusCode}");
    }

    final data = json.decode(response.body);
    return (data['videos'] as List)
        .map((video) => VideoMapper.fromJson(video))
        .toList();
  }
}

