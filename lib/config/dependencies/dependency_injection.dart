import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../core/network/api_client.dart';
import '../../core/network/network_info.dart';
import '../../data/datasources/user_remote_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/get_users_usecase.dart';
import '../../domain/usecases/get_user_by_id_usecase.dart';
import '../../presentation/shared/viewmodels/user_viewmodel.dart';
// Post imports
import '../../data/datasources/post_remote_datasource.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/repositories/post_repository.dart';
import '../../domain/usecases/get_posts_usecase.dart';
import '../../domain/usecases/get_post_by_id_usecase.dart';
import '../../presentation/pages/posts/bloc/posts_bloc.dart';
import '../../presentation/pages/posts/bloc/post_detail_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // External dependencies
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // Core
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt()));
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // User Data sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(getIt()),
  );

  // Post Data sources
  getIt.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(getIt()),
  );

  // User Repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Post Repositories
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // User Use cases
  getIt.registerLazySingleton(() => GetUsersUseCase(getIt()));
  getIt.registerLazySingleton(() => GetUserByIdUseCase(getIt()));

  // Post Use cases
  getIt.registerLazySingleton(() => GetPostsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPostByIdUseCase(getIt()));

  // User ViewModels
  getIt.registerFactory(() => UserViewModel(
        getUsersUseCase: getIt(),
        getUserByIdUseCase: getIt(),
      ));

  // Post BLoCs
  getIt.registerFactory(() => PostsBloc(
        getPostsUseCase: getIt(),
      ));
  
  getIt.registerFactory(() => PostDetailBloc(
        getPostByIdUseCase: getIt(),
      ));
} 