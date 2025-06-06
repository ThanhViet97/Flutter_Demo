import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/dependencies/dependency_injection.dart';
import '../../shared/widgets/loading_widget.dart';
import '../../shared/widgets/error_widget.dart' as custom_widgets;
import 'bloc/post_detail_bloc.dart';
import 'bloc/post_detail_event.dart';
import 'bloc/post_detail_state.dart';
import 'widgets/post_detail_content.dart';

class PostDetailPage extends StatelessWidget {
  final int postId;
  
  const PostDetailPage({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PostDetailBloc>()..add(LoadPostDetail(postId: postId)),
      child: _PostDetailPageView(postId: postId),
    );
  }
}

class _PostDetailPageView extends StatelessWidget {
  final int postId;
  
  const _PostDetailPageView({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<PostDetailBloc>().add(RefreshPostDetail(postId: postId));
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: BlocBuilder<PostDetailBloc, PostDetailState>(
        builder: (context, state) {
          return switch (state) {
            PostDetailInitial() => const SizedBox.shrink(),
            PostDetailLoading() => const LoadingWidget(),
            PostDetailError(:final message) => custom_widgets.CustomErrorWidget(
                message: message,
                onRetry: () {
                  context.read<PostDetailBloc>().add(LoadPostDetail(postId: postId));
                },
              ),
            PostDetailLoaded(:final post) => RefreshIndicator(
                onRefresh: () async {
                  context.read<PostDetailBloc>().add(RefreshPostDetail(postId: postId));
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: PostDetailContent(post: post),
                ),
              ),
            _ => const Center(
                child: Text(
                  'Unknown state',
                  style: TextStyle(fontSize: 16),
                ),
              ),
          };
        },
      ),
    );
  }
} 