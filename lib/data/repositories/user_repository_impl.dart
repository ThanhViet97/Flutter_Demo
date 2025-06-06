import 'package:dartz/dartz.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final users = await remoteDataSource.getUsers();
        return Right(users);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(ServerFailure('Unexpected error occurred'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.getUserById(id);
        return Right(user);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(ServerFailure('Unexpected error occurred'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> createUser(UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = UserModel.fromEntity(user);
        final createdUser = await remoteDataSource.createUser(userModel);
        return Right(createdUser);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(ServerFailure('Unexpected error occurred'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUser(UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = UserModel.fromEntity(user);
        final updatedUser = await remoteDataSource.updateUser(userModel);
        return Right(updatedUser);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(ServerFailure('Unexpected error occurred'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(int id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteUser(id);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(ServerFailure('Unexpected error occurred'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }
} 