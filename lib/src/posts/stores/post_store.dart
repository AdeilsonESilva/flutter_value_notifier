import 'package:flutter/material.dart';
import 'package:flutter_value_notifier/src/posts/services/posts_service.dart';
import 'package:flutter_value_notifier/src/posts/states/post_state.dart';

class PostStore extends ValueNotifier<PostState> {
  final PostService service;

  PostStore(this.service) : super(InitialPostState());

  Future fetchPosts() async {
    try {
      value = LoadingPostState();
      final posts = await service.fetchPosts();
      value = SuccessPostState(posts);
    } catch (e) {
      value = ErrorPostState(e.toString());
    }
  }
}
