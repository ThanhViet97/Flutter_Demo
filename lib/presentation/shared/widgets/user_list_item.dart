import 'package:flutter/material.dart';
import '../../../domain/entities/user_entity.dart';

class UserListItem extends StatelessWidget {
  final UserEntity user;
  final VoidCallback onTap;

  const UserListItem({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.email),
            Text(
              '@${user.username}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
} 