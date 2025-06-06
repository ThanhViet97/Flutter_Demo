import '../../../shared/bloc/base/base_bloc.dart';

abstract class CreatePostEvent extends BaseEvent {
  const CreatePostEvent();
}

class CreatePost extends CreatePostEvent {
  final String title;
  final String body;
  final int userId;

  const CreatePost({
    required this.title,
    required this.body,
    required this.userId,
  });

  @override
  List<Object?> get props => [title, body, userId];
}

class ResetCreatePost extends CreatePostEvent {
  const ResetCreatePost();
} 