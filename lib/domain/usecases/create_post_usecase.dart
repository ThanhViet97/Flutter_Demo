import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repository.dart';

class CreatePostUseCase implements UseCase<PostEntity, CreatePostParams> {
  final PostRepository repository;

  CreatePostUseCase(this.repository);

  @override
  Future<Either<Failure, PostEntity>> call(CreatePostParams params) async {
    return await repository.createPost(
      title: params.title,
      body: params.body,
      userId: params.userId,
    );
  }
}

class CreatePostParams {
  final String title;
  final String body;
  final int userId;

  const CreatePostParams({
    required this.title,
    required this.body,
    required this.userId,
  });
} 