import 'package:dio/dio.dart';
import '../../core/constants/api_endpoints.dart';
import '../../core/errors/exceptions.dart';
import '../../core/network/api_client.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUserById(int id);
  Future<UserModel> createUser(UserModel user);
  Future<UserModel> updateUser(UserModel user);
  Future<void> deleteUser(int id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient apiClient;

  UserRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await apiClient.get(ApiEndpoints.users);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw ServerException('Failed to load users');
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Server error occurred');
    } catch (e) {
      throw ServerException('Unexpected error occurred');
    }
  }

  @override
  Future<UserModel> getUserById(int id) async {
    try {
      final response = await apiClient.get('${ApiEndpoints.users}/$id');
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException('Failed to load user');
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Server error occurred');
    } catch (e) {
      throw ServerException('Unexpected error occurred');
    }
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    try {
      final response = await apiClient.post(
        ApiEndpoints.users,
        data: user.toJson(),
      );
      if (response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException('Failed to create user');
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Server error occurred');
    } catch (e) {
      throw ServerException('Unexpected error occurred');
    }
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    try {
      final response = await apiClient.put(
        '${ApiEndpoints.users}/${user.id}',
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException('Failed to update user');
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Server error occurred');
    } catch (e) {
      throw ServerException('Unexpected error occurred');
    }
  }

  @override
  Future<void> deleteUser(int id) async {
    try {
      final response = await apiClient.delete('${ApiEndpoints.users}/$id');
      if (response.statusCode != 200) {
        throw ServerException('Failed to delete user');
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Server error occurred');
    } catch (e) {
      throw ServerException('Unexpected error occurred');
    }
  }
} 