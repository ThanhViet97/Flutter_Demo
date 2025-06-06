import 'package:flutter/material.dart';
import '../../presentation/pages/main_navigation/main_navigation_page.dart';
import '../../presentation/pages/users/users_page.dart';
import '../../presentation/pages/user_detail/user_detail_page.dart';
import '../../presentation/pages/posts/posts_page.dart';
import '../../presentation/pages/posts/post_detail_page.dart';
import '../../presentation/pages/posts/create_post_page.dart';
import '../../presentation/pages/counter/counter_page.dart';
import '../../presentation/pages/theme_demo/theme_demo_page.dart';
import '../../presentation/shared/widgets/common/theme_showcase_widget.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
      case AppRoutes.main:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationPage(),
          settings: settings,
        );

      case AppRoutes.users:
        return MaterialPageRoute(
          builder: (_) => const UsersPage(),
          settings: settings,
        );

      case AppRoutes.userDetail:
        final userId = settings.arguments as int?;
        if (userId != null) {
          return MaterialPageRoute(
            builder: (_) => UserDetailPage(userId: userId),
            settings: settings,
          );
        }
        return _errorRoute('User ID is required');

      case AppRoutes.posts:
        return MaterialPageRoute(
          builder: (_) => const PostsPage(),
          settings: settings,
        );

      case AppRoutes.postDetail:
        final postId = settings.arguments as int?;
        if (postId != null) {
          return MaterialPageRoute(
            builder: (_) => PostDetailPage(postId: postId),
            settings: settings,
          );
        }
        return _errorRoute('Post ID is required');

      case AppRoutes.createPost:
        return MaterialPageRoute(
          builder: (_) => const CreatePostPage(),
          settings: settings,
        );

      case AppRoutes.counter:
        return MaterialPageRoute(
          builder: (_) => const CounterPage(),
          settings: settings,
        );

      case AppRoutes.themeDemo:
        return MaterialPageRoute(
          builder: (_) => const ThemeDemoPage(),
          settings: settings,
        );

      case AppRoutes.themeShowcase:
        return MaterialPageRoute(
          builder: (_) => const ThemeShowcaseWidget(),
          settings: settings,
        );

      default:
        return _errorRoute('Route not found: ${settings.name}');
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  'Route Error',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}