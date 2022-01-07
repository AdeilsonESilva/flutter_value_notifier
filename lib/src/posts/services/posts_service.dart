import 'package:flutter_value_notifier/src/posts/models/post_model.dart';
import 'package:uno/uno.dart';

class PostService {
  final Uno uno;

  PostService(this.uno);

  Future<List<PostModel>> fetchPosts() async {
    final response =
        await uno.get('https://jsonplaceholder.typicode.com/posts');
    final list = response.data as List;
    final posts = list.map((item) => PostModel.fromMap(item)).toList();

    return posts;
  }
}
