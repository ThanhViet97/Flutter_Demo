import '../../../../domain/entities/post_entity.dart';
import '../../../shared/bloc/base/base_bloc.dart';

abstract class CreatePostState extends BaseState {
  const CreatePostState();
}

class CreatePostInitial extends CreatePostState {
  const CreatePostInitial();
}

class CreatePostLoading extends CreatePostState {
  const CreatePostLoading();
}

class CreatePostSuccess extends CreatePostState {
  final PostEntity post;

  const CreatePostSuccess({required this.post});

  @override
  List<Object?> get props => [post];
}

class CreatePostError extends CreatePostState {
  final String message;

  const CreatePostError({required this.message});

  @override
  List<Object?> get props => [message];
} 