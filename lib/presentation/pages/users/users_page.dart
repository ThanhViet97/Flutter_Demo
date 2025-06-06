import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/viewmodels/user_viewmodel.dart';
import '../../shared/widgets/user_list_item.dart';
import '../../shared/widgets/loading_widget.dart';
import '../../shared/widgets/error_widget.dart' as custom_widgets;

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserViewModel>().loadUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<UserViewModel>().loadUsers();
            },
          ),
        ],
      ),
      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingWidget();
          }

          if (viewModel.hasError) {
            return custom_widgets.CustomErrorWidget(
              message: viewModel.errorMessage ?? 'An error occurred',
              onRetry: () {
                viewModel.loadUsers();
              },
            );
          }

          if (viewModel.users.isEmpty) {
            return const Center(
              child: Text(
                'No users found',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await viewModel.loadUsers();
            },
            child: ListView.builder(
              itemCount: viewModel.users.length,
              itemBuilder: (context, index) {
                final user = viewModel.users[index];
                return UserListItem(
                  user: user,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/user-detail',
                      arguments: user.id,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
} 