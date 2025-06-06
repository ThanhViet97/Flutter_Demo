import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../domain/usecases/get_posts_usecase.dart';
import 'posts_event.dart';
import 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUseCase getPostsUseCase;

  PostsBloc({
    required this.getPostsUseCase,
  }) : super(const PostsInitial()) {
    on<LoadPosts>(_onLoadPosts);
    on<RefreshPosts>(_onRefreshPosts);
  }

  void _onLoadPosts(LoadPosts event, Emitter<PostsState> emit) async {
    emit(const PostsLoading());
    
    final result = await getPostsUseCase(const NoParams());
    
    result.fold(
      (failure) => emit(PostsError(message: failure.message)),
      (posts) => emit(PostsLoaded(posts: posts)),
    );
  }

  void _onRefreshPosts(RefreshPosts event, Emitter<PostsState> emit) async {
    // Không emit loading cho refresh để giữ UI smooth
    final result = await getPostsUseCase(const NoParams());
    
    result.fold(
      (failure) => emit(PostsError(message: failure.message)),
      (posts) => emit(PostsLoaded(posts: posts)),
    );
  }
} 