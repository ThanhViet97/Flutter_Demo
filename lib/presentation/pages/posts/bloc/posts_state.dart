import '../../../../domain/entities/post_entity.dart';
import '../../../shared/bloc/base/base_bloc.dart';

abstract class PostsState extends BaseState {
  const PostsState();
}

class PostsInitial extends PostsState {
  const PostsInitial();
}

class PostsLoading extends PostsState {
  const PostsLoading();
}

class PostsLoaded extends PostsState {
  final List<PostEntity> posts;
  
  const PostsLoaded({required this.posts});
  
  @override
  List<Object?> get props => [posts];
}

class PostsError extends PostsState {
  final String message;
  
  const PostsError({required this.message});
  
  @override
  List<Object?> get props => [message];
} 