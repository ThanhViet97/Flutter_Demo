import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecases/get_post_by_id_usecase.dart';
import 'post_detail_event.dart';
import 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final GetPostByIdUseCase getPostByIdUseCase;

  PostDetailBloc({
    required this.getPostByIdUseCase,
  }) : super(const PostDetailInitial()) {
    on<LoadPostDetail>(_onLoadPostDetail);
    on<RefreshPostDetail>(_onRefreshPostDetail);
  }

  void _onLoadPostDetail(LoadPostDetail event, Emitter<PostDetailState> emit) async {
    emit(const PostDetailLoading());
    
    final result = await getPostByIdUseCase(GetPostParams(event.postId));
    
    result.fold(
      (failure) => emit(PostDetailError(message: failure.message)),
      (post) => emit(PostDetailLoaded(post: post)),
    );
  }

  void _onRefreshPostDetail(RefreshPostDetail event, Emitter<PostDetailState> emit) async {
    // Không emit loading cho refresh để giữ UI smooth
    final result = await getPostByIdUseCase(GetPostParams(event.postId));
    
    result.fold(
      (failure) => emit(PostDetailError(message: failure.message)),
      (post) => emit(PostDetailLoaded(post: post)),
    );
  }
} 