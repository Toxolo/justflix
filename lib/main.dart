import 'package:flutter/material.dart';
import 'package:justflix/screens/HomeScreenState.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'data/datasources/video_remote_data_source.dart';
import 'data/repositories/video_repository_impl.dart';
import 'domain/usecases/get_videos.dart';
import 'presentation/providers/video_provider.dart';


void main() {
  final videoRemoteDataSource = VideoRemoteDataSourceImpl(client: http.Client());
  final videoRepository = VideoRepositoryImpl(remoteDataSource: videoRemoteDataSource);
  final getVideos = GetVideos(videoRepository);

  runApp(
    ChangeNotifierProvider( //video_provider
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
      title: 'JustFlix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   final GetVideos getVideos;

//   const MyApp({super.key, required this.getVideos});

//   @override
//   Widget build(BuildContext context) {
//     // Pots cridar fetchVideos directament aquí si vols
//     // Exemple: final videos = getVideos();

//     return MaterialApp(
//       title: 'JustFlix',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeScreen(), // Has de gestionar l'accés als vídeos dins de HomeScreen
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:justflix/screens/HomeScreenState.dart';
// import 'data/datasources/video_local_data_source.dart';
// import 'data/repositories/video_repository_impl.dart';
// import 'domain/usecases/get_videos.dart';

// void main() {
//   // Inicialització de les dependències
//   final videoLocalDataSource = VideoLocalDataSourceImpl();
//   final videoRepository = VideoRepositoryImpl(localDataSource: videoLocalDataSource);
//   final getVideos = GetVideos(videoRepository);

//   // Executa l'app sense Provider
//   runApp(MyApp(getVideos: getVideos));
// }





// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'presentation/screens/home_screen.dart';
// void main() {
//   debugPaintSizeEnabled =
//       false; // Per veure els layouts. Requereix rendering.dart
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'JustFlix',
//       debugShowCheckedModeBanner: false,
//       // Definim el tema de l'aplicacicó. Fem ús de l'esquema de colors Teal
//       theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.amberAccent),
//       // Widget principal
//       home: HomeScreen(),
//     );
//   }
// }



