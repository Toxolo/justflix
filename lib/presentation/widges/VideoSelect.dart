
import 'package:flutter/material.dart';
import 'package:justflix/presentation/providers/video_provider.dart';
import 'package:provider/provider.dart';



/// VideoSelect, Este es el del video seleccionat

class VideoSelect extends StatelessWidget {
  const VideoSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoProvider>(
      builder: (context, provider, child) {
        final selectedVideo = provider.selectedVideo;

        if (selectedVideo == null) {
          return Image.network('https://picsum.photos/300/200');
        }

        return Column(
          children: [
            Image.network('https://picsum.photos/300/200'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${selectedVideo.id}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Topic: ${selectedVideo.topic}'),
                  Text('Description: ${selectedVideo.description}'),
                  Text('Duration: ${selectedVideo.duration}s'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}