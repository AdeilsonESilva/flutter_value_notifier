import 'package:flutter_value_notifier/src/posts/models/post_model.dart';

abstract class PostState {}

class InitialPostState extends PostState {}

class SuccessPostState extends PostState {
  final List<PostModel> posts;

  SuccessPostState(this.posts);
}

class LoadingPostState extends PostState {}

class ErrorPostState extends PostState {
  final String message;

  ErrorPostState(this.message);
}
