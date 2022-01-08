import 'package:flutter/material.dart';
import 'package:flutter_value_notifier/src/posts/states/post_state.dart';
import 'package:flutter_value_notifier/src/posts/stores/post_store.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      context.read<PostStore>().fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build post page');
    final store = context.watch<PostStore>();
    final state = store.value;
    Widget? child;

    if (state is LoadingPostState) {
      child = const Center(child: CircularProgressIndicator());
    }

    if (state is ErrorPostState) {
      child = Center(child: Text(state.message));
    }

    if (state is SuccessPostState) {
      child = ListView.builder(
        itemCount: state.posts.length,
        itemBuilder: (_, index) {
          final post = state.posts[index];
          return ListTile(
            title: Text(post.title),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Page'),
      ),
      body: child ?? Container(),
    );
  }
}
