import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_value_notifier/src/posts/services/posts_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';

class UnoMock extends Mock implements Uno {}

class RequestMock extends Mock implements Request {}

void main() {
  final unoMock = UnoMock();

  final service = PostsService(unoMock);
  test('get all posts', () async {
    when(() => unoMock.get(any())).thenAnswer((_) async => Response(
          data: jsonResponse,
          headers: {},
          status: 200,
          request: RequestMock(),
        ));
    final posts = await service.fetchPosts();
    expect(posts[0].title,
        'sunt aut facere repellat provident occaecati excepturi optio reprehenderit');
  });
}

final jsonResponse = jsonDecode(r'''
  [
    {
        "userId": 1,
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    },
    {
        "userId": 2,
        "id": 11,
        "title": "et ea vero quia laudantium autem",
        "body": "delectus reiciendis molestiae occaecati non minima eveniet qui voluptatibus\naccusamus in eum beatae sit\nvel qui neque voluptates ut commodi qui incidunt\nut animi commodi"
    }
  ]
''');
