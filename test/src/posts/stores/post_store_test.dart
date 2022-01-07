import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_value_notifier/src/posts/services/posts_service.dart';
import 'package:flutter_value_notifier/src/posts/states/post_state.dart';
import 'package:flutter_value_notifier/src/posts/stores/post_store.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

class PostServiceMock extends Mock implements PostService {}

void main() {
  final service = PostServiceMock();
  final store = PostStore(service);
  test('should be change alter state to success', () async {
    when(() => service.fetchPosts()).thenAnswer((_) async => []);

    expect(
        store,
        emitValues(
          [
            isA<LoadingPostState>(),
            isA<SuccessPostState>(),
          ],
        ));

    await store.fetchProducts();
  });

  test('should be change alter state to error', () async {
    when(() => service.fetchPosts()).thenThrow(Exception('Error'));

    expect(
        store,
        emitValues(
          [
            isA<LoadingPostState>(),
            isA<ErrorPostState>(),
          ],
        ));

    await store.fetchProducts();
  });
}
