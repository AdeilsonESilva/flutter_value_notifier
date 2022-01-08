import 'package:flutter/material.dart';
import 'package:flutter_value_notifier/src/posts/posts_page.dart';
import 'package:flutter_value_notifier/src/posts/services/posts_service.dart';
import 'package:flutter_value_notifier/src/posts/stores/post_store.dart';
import 'package:provider/provider.dart';
import 'package:uno/uno.dart';

// import 'home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Uno()),
        Provider(create: (context) => PostService(context.read())),
        ChangeNotifierProvider(create: (context) => PostStore(context.read())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PostsPage(),
      ),
    );
  }
}
