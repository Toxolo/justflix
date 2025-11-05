
import '../../domain/entities/video.dart';

class VideoMapper extends Video {
  VideoMapper({
    required super.id,
    required super.topic,
    required super.description,
    required super.duration,
    required super.thumbnail,
  });

  factory VideoMapper.fromJson(Map<String, dynamic> json) {
    return VideoMapper(
      id: json['id'],
      topic: json['topic'],
      description: json['description'],
      duration: json['duration'],
      thumbnail: json['thumbnail'],
    );
  }
}
