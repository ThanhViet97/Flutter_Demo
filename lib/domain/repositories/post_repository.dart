import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
  Future<Either<Failure, PostEntity>> getPostById(int id);
  Future<Either<Failure, List<PostEntity>>> getPostsByUserId(int userId);
  Future<Either<Failure, PostEntity>> createPost({
    required String title,
    required String body,
    required int userId,
  });
} 