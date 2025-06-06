import 'package:flutter/material.dart';
import '../../../../domain/entities/post_entity.dart';

class PostDetailContent extends StatelessWidget {
  final PostEntity post;

  const PostDetailContent({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card với thông tin meta
          _buildHeaderCard(),
          const SizedBox(height: 16),
          
          // Title Card
          _buildTitleCard(),
          const SizedBox(height: 16),
          
          // Content Card
          _buildContentCard(),
          const SizedBox(height: 24),
          
          // Action Buttons
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Post ID Badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.blue.shade300,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.article,
                    size: 16,
                    color: Colors.blue.shade700,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Post #${post.id}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
            ),
            
            const Spacer(),
            
            // User ID Badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.green.shade300,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person,
                    size: 16,
                    color: Colors.green.shade700,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'User ${post.userId}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.green.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.title,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.3,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.article_outlined,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Content',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              post.body,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement share functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Share feature coming soon!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.share),
            label: const Text('Share'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              // TODO: Implement save/bookmark functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bookmark feature coming soon!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.bookmark_outline),
            label: const Text('Save'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: const BorderSide(color: Colors.blue),
              foregroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
} 