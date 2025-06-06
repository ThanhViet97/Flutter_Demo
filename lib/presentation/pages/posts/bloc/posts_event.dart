import '../../../shared/bloc/base/base_bloc.dart';

abstract class PostsEvent extends BaseEvent {
  const PostsEvent();
}

class LoadPosts extends PostsEvent {
  const LoadPosts();
}

class RefreshPosts extends PostsEvent {
  const RefreshPosts();
}

class LoadPostsByUser extends PostsEvent {
  final int userId;
  
  const LoadPostsByUser({required this.userId});
  
  @override
  List<Object?> get props => [userId];
} 