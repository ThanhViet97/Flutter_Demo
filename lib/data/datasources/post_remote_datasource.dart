import 'package:dio/dio.dart';
import '../../core/constants/api_endpoints.dart';
import '../../core/errors/exceptions.dart';
import '../../core/network/api_client.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
  Future<PostModel> getPostById(int id);
  Future<List<PostModel>> getPostsByUserId(int userId);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final ApiClient apiClient;

  PostRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await apiClient.get(ApiEndpoints.posts);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw ServerException('Failed to load posts');
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Server error occurred');
    } catch (e) {
      throw ServerException('Unexpected error occurred');
    }
  }

  @override
  Future<PostModel> getPostById(int id) async {
    try {
      final response = await apiClient.get('${ApiEndpoints.posts}/$id');
      if (response.statusCode == 200) {
        return PostModel.fromJson(response.data);
      } else {
        throw ServerException('Failed to load post');
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Server error occurred');
    } catch (e) {
      throw ServerException('Unexpected error occurred');
    }
  }

  @override
  Future<List<PostModel>> getPostsByUserId(int userId) async {
    try {
      final response = await apiClient.get(
        ApiEndpoints.posts,
        queryParameters: {'userId': userId},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw ServerException('Failed to load posts by user');
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Server error occurred');
    } catch (e) {
      throw ServerException('Unexpected error occurred');
    }
  }
} 