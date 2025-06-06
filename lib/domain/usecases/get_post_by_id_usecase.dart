import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repository.dart';

class GetPostParams {
  final int id;

  const GetPostParams(this.id);
}

class GetPostByIdUseCase implements UseCase<PostEntity, GetPostParams> {
  final PostRepository repository;

  GetPostByIdUseCase(this.repository);

  @override
  Future<Either<Failure, PostEntity>> call(GetPostParams params) async {
    return await repository.getPostById(params.id);
  }
} 