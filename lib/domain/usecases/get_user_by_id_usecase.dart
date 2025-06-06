import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUserParams {
  final int id;

  const GetUserParams(this.id);
}

class GetUserByIdUseCase implements UseCase<UserEntity, GetUserParams> {
  final UserRepository repository;

  GetUserByIdUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(GetUserParams params) async {
    return await repository.getUserById(params.id);
  }
} 