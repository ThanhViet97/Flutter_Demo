import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/domain/entities/post_entity.dart';
import 'package:my_app/domain/usecases/create_post_usecase.dart';
import 'package:my_app/core/errors/failures.dart';

// Mock repository for testing
class MockPostRepository {
  Future<Either<Failure, PostEntity>> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    // Simulate successful post creation
    final post = PostEntity(
      id: 101, // JSONPlaceholder typically returns id 101 for new posts
      userId: userId,
      title: title,
      body: body,
    );
    return Right(post);
  }
}

void main() {
  group('CreatePost Tests', () {
    test('CreatePostParams should contain correct values', () {
      // Arrange
      const title = 'Test Title';
      const body = 'Test Body';
      const userId = 1;

      // Act
      const params = CreatePostParams(
        title: title,
        body: body,
        userId: userId,
      );

      // Assert
      expect(params.title, equals(title));
      expect(params.body, equals(body));
      expect(params.userId, equals(userId));
    });

    test('PostEntity should be created with correct properties', () {
      // Arrange & Act
      const post = PostEntity(
        id: 101,
        userId: 1,
        title: 'Test Title',
        body: 'Test Body',
      );

      // Assert
      expect(post.id, equals(101));
      expect(post.userId, equals(1));
      expect(post.title, equals('Test Title'));
      expect(post.body, equals('Test Body'));
    });

    test('Two identical PostEntity objects should be equal', () {
      // Arrange
      const post1 = PostEntity(
        id: 101,
        userId: 1,
        title: 'Test Title',
        body: 'Test Body',
      );

      const post2 = PostEntity(
        id: 101,
        userId: 1,
        title: 'Test Title',
        body: 'Test Body',
      );

      // Assert
      expect(post1, equals(post2));
      expect(post1.hashCode, equals(post2.hashCode));
    });
  });
} 