import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/viewmodels/user_viewmodel.dart';
import '../../shared/widgets/loading_widget.dart';
import '../../shared/widgets/error_widget.dart' as custom_widgets;

class UserDetailPage extends StatefulWidget {
  final int userId;

  const UserDetailPage({super.key, required this.userId});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserViewModel>().loadUserById(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
                viewModel.loadUserById(widget.userId);
              },
            );
          }

          final user = viewModel.selectedUser;
          if (user == null) {
            return const Center(
              child: Text('User not found'),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Personal Information',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 16),
                        _buildInfoRow('ID', user.id.toString()),
                        _buildInfoRow('Name', user.name),
                        _buildInfoRow('Username', user.username),
                        _buildInfoRow('Email', user.email),
                        _buildInfoRow('Phone', user.phone),
                        _buildInfoRow('Website', user.website),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
} 