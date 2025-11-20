import 'dart:convert';
import 'package:http/http.dart' as http;
import '../mappers/video_mapper.dart';

abstract class VideoRemoteDataSource {
  Future<List<VideoMapper>> getVideos();
}

class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  final http.Client client;

  VideoRemoteDataSourceImpl({required this.client});

  @override
  Future<List<VideoMapper>> getVideos() async {
    final response = await client.get(Uri.parse('http://10.0.2.2:3000/api/videolist/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data as List).map((video) => VideoMapper.fromJson(video)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
