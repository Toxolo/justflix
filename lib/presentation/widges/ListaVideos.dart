
import 'package:flutter/material.dart';
import 'package:justflix/presentation/providers/video_provider.dart';

import 'package:provider/provider.dart';




/// ListaVideos, este es el llistat de videos per el json
class ListaVideos extends StatelessWidget {
  const ListaVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator()); 
                                                                  
        }

        if (provider.videos.isEmpty) {
          return const Center(child: Text('No videos found'));
        }

        return ListView.builder(
          itemCount: provider.videos.length,
          itemBuilder: (context, index) {
            final video = provider.videos[index];
            return ListTile(
              leading: Image.network('https://picsum.photos/100/50?random=${video.id}'),
              title: Text(video.id),
              subtitle: Text('${video.duration}s'),
              onTap: () {
                provider.selectVideo(video);
              },
            );
          },
        );
      },
    );
  }
}