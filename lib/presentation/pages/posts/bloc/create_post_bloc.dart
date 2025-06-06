import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecases/create_post_usecase.dart';
import 'create_post_event.dart';
import 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final CreatePostUseCase createPostUseCase;

  CreatePostBloc({required this.createPostUseCase}) : super(const CreatePostInitial()) {
    on<CreatePost>(_onCreatePost);
    on<ResetCreatePost>(_onResetCreatePost);
  }

  void _onCreatePost(CreatePost event, Emitter<CreatePostState> emit) async {
    emit(const CreatePostLoading());

    final result = await createPostUseCase(CreatePostParams(
      title: event.title,
      body: event.body,
      userId: event.userId,
    ));

    result.fold(
      (failure) => emit(CreatePostError(message: failure.message)),
      (post) => emit(CreatePostSuccess(post: post)),
    );
  }

  void _onResetCreatePost(ResetCreatePost event, Emitter<CreatePostState> emit) {
    emit(const CreatePostInitial());
  }
} 