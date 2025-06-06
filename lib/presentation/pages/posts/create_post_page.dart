import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/dependencies/dependency_injection.dart';
import 'bloc/create_post_bloc.dart';
import 'bloc/create_post_event.dart';
import 'bloc/create_post_state.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreatePostBloc>(),
      child: const _CreatePostPageView(),
    );
  }
}

class _CreatePostPageView extends StatefulWidget {
  const _CreatePostPageView();

  @override
  State<_CreatePostPageView> createState() => _CreatePostPageViewState();
}

class _CreatePostPageViewState extends State<_CreatePostPageView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _userIdController = TextEditingController(text: '1');

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    _userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Post'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetForm,
            tooltip: 'Reset Form',
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<CreatePostBloc, CreatePostState>(
          listener: (context, state) {
            if (state is CreatePostSuccess) {
              _showSuccessDialog(context);
            } else if (state is CreatePostError) {
              _showErrorSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header Card
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.create,
                              size: 48,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Create a New Post',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Share your thoughts with the community',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Form Fields
                    _buildTitleField(),
                    const SizedBox(height: 16),
                    _buildBodyField(),
                    const SizedBox(height: 16),
                    _buildUserIdField(),
                    const SizedBox(height: 32),
                    
                    // Submit Button
                    _buildSubmitButton(state),
                    const SizedBox(height: 16),
                    
                    // Cancel Button
                    _buildCancelButton(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: _titleController,
      decoration: InputDecoration(
        labelText: 'Title *',
        hintText: 'Enter post title',
        prefixIcon: const Icon(Icons.title),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[50],
        helperText: 'Min 3 characters, Max 100 characters',
      ),
      maxLength: 100,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Title is required';
        }
        if (value.trim().length < 3) {
          return 'Title must be at least 3 characters';
        }
        return null;
      },
    );
  }

  Widget _buildBodyField() {
    return TextFormField(
      controller: _bodyController,
      decoration: InputDecoration(
        labelText: 'Content *',
        hintText: 'Write your post content here...',
        prefixIcon: const Icon(Icons.text_fields),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[50],
        alignLabelWithHint: true,
        helperText: 'Min 10 characters, Max 500 characters',
      ),
      maxLines: 6,
      maxLength: 500,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Content is required';
        }
        if (value.trim().length < 10) {
          return 'Content must be at least 10 characters';
        }
        return null;
      },
    );
  }

  Widget _buildUserIdField() {
    return TextFormField(
      controller: _userIdController,
      decoration: InputDecoration(
        labelText: 'User ID *',
        hintText: 'Enter user ID',
        prefixIcon: const Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[50],
        helperText: 'Must be a valid user ID (1-10)',
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'User ID is required';
        }
        final userId = int.tryParse(value.trim());
        if (userId == null || userId <= 0 || userId > 10) {
          return 'Please enter a valid user ID (1-10)';
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton(CreatePostState state) {
    final isLoading = state is CreatePostLoading;
    
    return ElevatedButton(
      onPressed: isLoading ? null : _submitForm,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.send),
                SizedBox(width: 8),
                Text(
                  'Create Post',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildCancelButton() {
    return OutlinedButton(
      onPressed: () => Navigator.of(context).pop(),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(color: Colors.grey[400]!),
      ),
      child: Text(
        'Cancel',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final title = _titleController.text.trim();
      final body = _bodyController.text.trim();
      final userId = int.parse(_userIdController.text.trim());

      context.read<CreatePostBloc>().add(CreatePost(
        title: title,
        body: body,
        userId: userId,
      ));
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 28),
            SizedBox(width: 8),
            Text('Success!'),
          ],
        ),
        content: const Text('Your post has been created successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Go back to posts list
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _titleController.clear();
    _bodyController.clear();
    _userIdController.text = '1';
    
    // Reset BLoC state if needed
    context.read<CreatePostBloc>().add(const ResetCreatePost());
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.refresh, color: Colors.white),
            SizedBox(width: 8),
            Text('Form has been reset'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
} 