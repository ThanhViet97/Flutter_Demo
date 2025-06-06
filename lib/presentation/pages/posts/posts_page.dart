import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/dependencies/dependency_injection.dart';
import '../../shared/widgets/loading_widget.dart';
import '../../shared/widgets/error_widget.dart' as custom_widgets;
import 'bloc/posts_bloc.dart';
import 'bloc/posts_event.dart';
import 'bloc/posts_state.dart';
import 'widgets/post_list_item.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PostsBloc>()..add(const LoadPosts()),
      child: const _PostsPageView(),
    );
  }
}

class _PostsPageView extends StatelessWidget {
  const _PostsPageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<PostsBloc>().add(const RefreshPosts());
            },
          ),
        ],
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          return switch (state) {
            PostsInitial() => const SizedBox.shrink(),
            PostsLoading() => const LoadingWidget(),
            PostsError(:final message) => custom_widgets.CustomErrorWidget(
                message: message,
                onRetry: () {
                  context.read<PostsBloc>().add(const LoadPosts());
                },
              ),
            PostsLoaded(:final posts) => RefreshIndicator(
                onRefresh: () async {
                  context.read<PostsBloc>().add(const RefreshPosts());
                },
                child: posts.isEmpty
                    ? const Center(
                        child: Text(
                          'No posts available',
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return PostListItem(
                            post: post,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/post-detail',
                                arguments: post.id,
                              );
                            },
                          );
                        },
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