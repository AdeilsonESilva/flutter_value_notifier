import 'package:flutter/material.dart';
import 'package:flutter_value_notifier/src/posts/services/posts_service.dart';
import 'package:flutter_value_notifier/src/posts/states/post_state.dart';
import 'package:flutter_value_notifier/src/posts/stores/post_store.dart';
import 'package:uno/uno.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final store = PostStore(PostService(Uno()));

  @override
  void initState() {
    super.initState();

    store.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (_, state, child) {
          if (state is LoadingPostState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ErrorPostState) {
            return Center(child: Text(state.message));
          }

          if (state is SuccessPostState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (_, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
