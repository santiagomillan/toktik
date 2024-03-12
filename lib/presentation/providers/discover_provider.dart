import 'package:flutter/material.dart';
import 'package:toktik/domain/video_post.dart';
import 'package:toktik/infraestucture/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  //TODO Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //metodo espera 2 seg
    await Future.delayed(const Duration(seconds: 2));
    //Carga los videos
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    //a;ade los videos
    videos.addAll(newVideos);
    //cambio de estado
    initialLoading = false;
    notifyListeners();
  }
}
