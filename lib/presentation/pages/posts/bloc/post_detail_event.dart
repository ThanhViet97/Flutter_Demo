import '../../../shared/bloc/base/base_bloc.dart';

abstract class PostDetailEvent extends BaseEvent {
  const PostDetailEvent();
}

class LoadPostDetail extends PostDetailEvent {
  final int postId;
  
  const LoadPostDetail({required this.postId});
  
  @override
  List<Object?> get props => [postId];
}

class RefreshPostDetail extends PostDetailEvent {
  final int postId;
  
  const RefreshPostDetail({required this.postId});
  
  @override
  List<Object?> get props => [postId];
} 