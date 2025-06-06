import '../../../../domain/entities/post_entity.dart';
import '../../../shared/bloc/base/base_bloc.dart';

abstract class PostDetailState extends BaseState {
  const PostDetailState();
}

class PostDetailInitial extends PostDetailState {
  const PostDetailInitial();
}

class PostDetailLoading extends PostDetailState {
  const PostDetailLoading();
}

class PostDetailLoaded extends PostDetailState {
  final PostEntity post;
  
  const PostDetailLoaded({required this.post});
  
  @override
  List<Object?> get props => [post];
}

class PostDetailError extends PostDetailState {
  final String message;
  
  const PostDetailError({required this.message});
  
  @override
  List<Object?> get props => [message];
} 