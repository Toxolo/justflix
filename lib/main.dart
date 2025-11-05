
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasources/video_local_data_source.dart';
import 'data/repositories/video_repository_impl.dart';
import 'domain/usecases/get_videos.dart';
import 'presentation/providers/video_provider.dart';


void main() {
  final videoLocalDataSource = VideoLocalDataSourceImpl();
  final videoRepository = VideoRepositoryImpl(localDataSource: videoLocalDataSource);
  final getVideos = GetVideos(videoRepository);

  runApp(
    ChangeNotifierProvider(
      create: (_) => VideoProvider(getVideos: getVideos)..fetchVideos(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Justflix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Logo(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoSelect(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Introducción a Flutter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListaVideos(),
          ),
        ],
      ),
    );
  }
}

/// Logo
class Logo extends StatelessWidget implements PreferredSizeWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('assets/images/justflix.png', height: 40),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// VideoSelect
class VideoSelect extends StatelessWidget {
  const VideoSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network('https://picsum.photos/300/200');
  }
}

/// ListaVideos
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
              title: Text(video.topic),
              subtitle: Text(video.description),
            );
          },
        );
      },
    );
  }
}
