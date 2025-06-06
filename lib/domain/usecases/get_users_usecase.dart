import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUsersUseCase implements UseCase<List<UserEntity>, NoParams> {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) async {
    return await repository.getUsers();
  }
} 