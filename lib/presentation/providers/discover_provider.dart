import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    //metodo espera 2 seg
    // await Future.delayed(const Duration(seconds: 2));
    //Carga los videos
    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();
    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    //a;ade los videos
    videos.addAll(newVideos);
    //cambio de estado
    initialLoading = false;
    notifyListeners();
  }
}
