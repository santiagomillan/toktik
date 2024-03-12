import 'package:toktik/domain/video_post.dart';

class LocalVideoModel {
  //parametros 1
  final String nane;
  final String videoUrl;
  final int likes;
  final int views;
  //Constructor 2
  LocalVideoModel(
      {required this.nane,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});
  //Factory constuctor 3
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        nane: json['name'] ?? 'No video name',
        videoUrl: json['videoUrl'],
        likes: json['likes'] ?? 0,
        views: json['views'] ?? 0,
      );
  //video post entity
  VideoPost toVideoPostEntity() => VideoPost(
        caption: nane,
        videoUrl: videoUrl,
        likes: likes,
        views: views,
      );
}
