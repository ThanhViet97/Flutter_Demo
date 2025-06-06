# Coding Standards & Project Structure Guide

## Mục lục
1. [Project Structure](#project-structure)
2. [Naming Conventions](#naming-conventions)
3. [Code Style Guidelines](#code-style-guidelines)
4. [Architecture Patterns](#architecture-patterns)
5. [State Management](#state-management)
6. [Error Handling](#error-handling)
7. [Testing Standards](#testing-standards)
8. [Documentation Standards](#documentation-standards)
9. [Git Convention](#git-convention)
10. [Best Practices](#best-practices)

---

## Project Structure

```
lib/
├── core/                     # Core functionality và utilities
│   ├── constants/           # App constants
│   ├── errors/             # Custom exception classes
│   ├── network/            # Network configuration
│   ├── utils/              # Utility functions
│   └── usecases/           # Base usecase class
├── config/                  # App configuration
│   ├── routes/             # Route configuration
│   ├── themes/             # Theme configuration
│   └── app_config.dart     # App-wide configuration
├── data/                    # Data layer (Repository Implementation)
│   ├── datasources/        # Remote & local data sources
│   ├── models/             # Data models (JSON serializable)
│   └── repositories/       # Repository implementations
├── domain/                  # Domain layer (Business Logic)
│   ├── entities/           # Domain entities
│   ├── repositories/       # Repository interfaces
│   └── usecases/           # Business logic use cases
└── presentation/            # Presentation layer (UI)
    ├── pages/               # Quản lý theo từng page/màn hình
    │   ├── counter/         # Counter page
    │   │   ├── bloc/        # BLoC cho counter page
    │   │   │   ├── counter_bloc.dart
    │   │   │   ├── counter_event.dart
    │   │   │   └── counter_state.dart
    │   │   ├── widgets/     # Widgets riêng cho counter (sẵn sàng)
    │   │   └── counter_page.dart
    │   ├── users/           # Users page
    │   │   ├── bloc/        # Sẵn sàng cho BLoC (khi migrate từ Provider)
    │   │   ├── widgets/     # Widgets riêng cho users (sẵn sàng)
    │   │   └── users_page.dart
    │   ├── user_detail/     # User detail page
    │   │   ├── bloc/        # Sẵn sàng cho BLoC (khi migrate từ Provider)
    │   │   ├── widgets/     # Widgets riêng cho user detail (sẵn sàng)
    │   │   └── user_detail_page.dart
    │   └── theme_demo/      # Theme demo page
    │       └── theme_demo_page.dart
    └── shared/              # Shared components
        ├── bloc/            # Global/shared BLoCs
        │   ├── base/
        │   │   └── base_bloc.dart
        │   ├── extensions/
        │   │   └── bloc_extensions.dart
        │   ├── bloc_observer.dart
        │   └── bloc_exports.dart
        ├── widgets/         # Common widgets
        │   ├── common/
        │   │   ├── bloc_wrapper.dart
        │   │   └── theme_showcase_widget.dart
        │   ├── error_widget.dart
        │   ├── loading_widget.dart
        │   └── user_list_item.dart
        ├── viewmodels/      # Tạm thời giữ lại (để migrate dần)
        │   └── user_viewmodel.dart
        └── utils/           # UI utilities (sẵn sàng)
```

---

## Naming Conventions

### File & Directory Names
- **Lowercase with underscores**: `user_profile_page.dart`
- **Directories**: Số nhiều (`pages`, `widgets`, `models`)
- **Files**: Mô tả chức năng cụ thể (`login_page.dart`, `user_bloc.dart`)

### Class Names
- **PascalCase**: `UserProfilePage`, `LoginBloc`
- **Descriptive**: Tên class phải mô tả chính xác chức năng

```dart
// ✅ Good
class UserProfilePage extends StatelessWidget {}
class LoginBloc extends Bloc<LoginEvent, LoginState> {}

// ❌ Bad
class Page1 extends StatelessWidget {}
class UBloc extends Bloc<UEvent, UState> {}
```

### Variable & Function Names
- **camelCase**: `userName`, `getUserProfile()`
- **Descriptive**: Tên biến phải mô tả ý nghĩa

```dart
// ✅ Good
final String userName = 'john_doe';
void getUserProfile() {}

// ❌ Bad
final String n = 'john_doe';
void getU() {}
```

### Constants
- **SCREAMING_SNAKE_CASE**: `API_BASE_URL`, `MAX_RETRY_COUNT`

```dart
class ApiConstants {
  static const String API_BASE_URL = 'https://api.example.com';
  static const int MAX_RETRY_COUNT = 3;
}
```

---

## Code Style Guidelines

### Import Organization
```dart
// 1. Dart imports
import 'dart:async';
import 'dart:io';

// 2. Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 3. Package imports (alphabetical)
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 4. Project imports (alphabetical)
import '../../core/constants/app_constants.dart';
import '../widgets/custom_button.dart';
```

### Widget Structure
```dart
class UserProfilePage extends StatelessWidget {
  // 1. Constructor parameters
  const UserProfilePage({
    super.key,
    required this.userId,
    this.onProfileUpdated,
  });

  // 2. Final fields
  final String userId;
  final VoidCallback? onProfileUpdated;

  // 3. Build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  // 4. Private helper methods
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Profile'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return const Center(
      child: Text('Profile Content'),
    );
  }
}
```

### Function Documentation
```dart
/// Retrieves user profile information from the API
/// 
/// [userId] The unique identifier for the user
/// 
/// Returns [UserProfile] if successful, throws [ApiException] on error
/// 
/// Example:
/// ```dart
/// final profile = await getUserProfile('123');
/// print(profile.name);
/// ```
Future<UserProfile> getUserProfile(String userId) async {
  // Implementation
}
```

---

## Architecture Patterns

### Clean Architecture Layers

#### 1. Presentation Layer
- **Responsibility**: UI logic, user interactions
- **Components**: Pages, Widgets, BLoCs
- **Rules**: 
  - Không direct dependency với data layer
  - Chỉ depend vào domain layer

#### 2. Domain Layer
- **Responsibility**: Business logic, entities
- **Components**: Entities, Use Cases, Repository interfaces
- **Rules**: 
  - Independent, không depend vào layers khác
  - Pure Dart, không có Flutter dependencies

#### 3. Data Layer
- **Responsibility**: Data access, external APIs
- **Components**: Repository implementations, Data sources, Models
- **Rules**: 
  - Implement domain repositories
  - Handle data transformation

### Dependency Injection
```dart
// core/di/injection_container.dart
final GetIt sl = GetIt.instance;

Future<void> init() async {
  // BLoCs
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
  
  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );
  
  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );
}
```

---

## State Management

### BLoC Pattern (Xem thêm tại BLOC_GUIDE.md)

#### Event Naming
- **Verb phrases**: `LoadUser`, `UpdateProfile`, `DeletePost`
- **Present tense**: `Load` not `Loaded`

```dart
abstract class UserEvent extends BaseEvent {}

class LoadUser extends UserEvent {
  final String userId;
  const LoadUser({required this.userId});
}

class UpdateUserProfile extends UserEvent {
  final UserProfile profile;
  const UpdateUserProfile({required this.profile});
}
```

#### State Naming
- **Adjective/Past tense**: `UserLoaded`, `UserLoading`, `UserError`
- **Descriptive**: Mô tả trạng thái hiện tại

```dart
abstract class UserState extends BaseState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserProfile user;
  const UserLoaded({required this.user});
  
  @override
  List<Object?> get props => [user];
}

class UserError extends UserState {
  final String message;
  const UserError({required this.message});
  
  @override
  List<Object?> get props => [message];
}
```

---

## Error Handling

### Custom Exceptions
```dart
// core/errors/exceptions.dart
abstract class AppException implements Exception {
  final String message;
  final String? code;
  
  const AppException({
    required this.message,
    this.code,
  });
}

class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.code,
  });
}

class CacheException extends AppException {
  const CacheException({
    required super.message,
    super.code,
  });
}
```

### Failure Handling với Dartz
```dart
// core/errors/failures.dart
abstract class Failure extends Equatable {
  final String message;
  final String? code;
  
  const Failure({
    required this.message,
    this.code,
  });
  
  @override
  List<Object?> get props => [message, code];
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    required super.message,
    super.code,
  });
}
```

### Repository Error Handling
```dart
@override
Future<Either<Failure, User>> getUser(String id) async {
  try {
    final user = await remoteDataSource.getUser(id);
    return Right(user.toDomain());
  } on NetworkException catch (e) {
    return Left(NetworkFailure(message: e.message));
  } catch (e) {
    return Left(UnknownFailure(message: e.toString()));
  }
}
```

---

## Testing Standards

### Unit Tests
```dart
// test/domain/usecases/login_usecase_test.dart
group('LoginUseCase', () {
  late LoginUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginUseCase(repository: mockRepository);
  });

  test('should return User when login is successful', () async {
    // Arrange
    const email = 'test@email.com';
    const password = 'password';
    final user = User(id: '1', email: email);
    
    when(mockRepository.login(email, password))
        .thenAnswer((_) async => Right(user));

    // Act
    final result = await useCase(LoginParams(
      email: email,
      password: password,
    ));

    // Assert
    expect(result, equals(Right(user)));
    verify(mockRepository.login(email, password));
  });
});
```

### Widget Tests
```dart
// test/presentation/pages/login_page_test.dart
group('LoginPage', () {
  testWidgets('should display login form', (tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => MockLoginBloc(),
          child: const LoginPage(),
        ),
      ),
    );

    // Assert
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Login'), findsOneWidget);
  });
});
```

### BLoC Tests
```dart
// test/presentation/bloc/login_bloc_test.dart
blocTest<LoginBloc, LoginState>(
  'emits [LoginLoading, LoginSuccess] when login succeeds',
  build: () => LoginBloc(loginUseCase: mockLoginUseCase),
  act: (bloc) => bloc.add(const LoginSubmitted(
    email: 'test@email.com',
    password: 'password',
  )),
  expect: () => [
    LoginLoading(),
    LoginSuccess(user: testUser),
  ],
);
```

---

## Documentation Standards

### README.md Structure
```markdown
# Project Name

## Description
Brief project description

## Getting Started
### Prerequisites
### Installation
### Running the app

## Architecture
Brief architecture overview

## Testing
How to run tests

## Contributing
Contribution guidelines
```

### Code Documentation
- **Public APIs**: Luôn có documentation
- **Complex logic**: Explain why, not what
- **Examples**: Provide usage examples

```dart
/// A widget that displays user avatar with online status indicator
/// 
/// The avatar displays the user's profile image or initials if no image
/// is available. Shows a green dot when user is online.
/// 
/// Example:
/// ```dart
/// UserAvatar(
///   user: currentUser,
///   size: 50,
///   showOnlineStatus: true,
/// )
/// ```
class UserAvatar extends StatelessWidget {
  /// Creates a user avatar widget
  const UserAvatar({
    super.key,
    required this.user,
    this.size = 40,
    this.showOnlineStatus = false,
  });

  /// The user whose avatar to display
  final User user;
  
  /// The size of the avatar in logical pixels
  final double size;
  
  /// Whether to show online status indicator
  final bool showOnlineStatus;
```

---

## Git Convention

### Branch Naming
- **Feature**: `feature/user-authentication`
- **Bug fix**: `bugfix/login-validation-error`
- **Hotfix**: `hotfix/critical-crash-fix`
- **Release**: `release/v1.2.0`

### Commit Messages
```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code formatting
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance

**Examples:**
```
feat(auth): add user login functionality

Implement login form with email/password validation
Add BLoC for authentication state management
Integrate with backend API

Closes #123
```

### Pull Request Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Unit tests added/updated
- [ ] Widget tests added/updated
- [ ] Manual testing completed

## Screenshots
If applicable, add screenshots

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
```

---

## Best Practices

### Performance
1. **Use const constructors** khi có thể
2. **Avoid rebuilds** với proper BLoC listeners
3. **Optimize images** và assets
4. **Use ListView.builder** cho large lists

### Security
1. **Validate inputs** ở cả client và server
2. **Store sensitive data** securely (Keychain/Keystore)
3. **Use HTTPS** cho tất cả API calls
4. **Implement proper authentication**

### Code Quality
1. **Follow SOLID principles**
2. **Write testable code**
3. **Use meaningful names**
4. **Keep functions small and focused**
5. **Handle errors gracefully**

### Accessibility
1. **Add semanticLabel** cho images
2. **Use proper contrast ratios**
3. **Support screen readers**
4. **Test with accessibility tools**

---

## Tools & Automation

### Static Analysis
```yaml
# analysis_options.yaml
analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
  
linter:
  rules:
    - prefer_const_constructors
    - use_key_in_widget_constructors
    - avoid_print
    - prefer_final_fields
```

### Code Generation
```bash
# Generate code
flutter packages pub run build_runner build

# Watch for changes
flutter packages pub run build_runner watch
```

### CI/CD Pipeline
```yaml
# .github/workflows/ci.yml
name: CI
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
```

---

## Migration Guidelines

### Khi refactor existing code:
1. **Tạo tests trước khi refactor**
2. **Refactor từng phần nhỏ**
3. **Maintain backward compatibility** nếu có thể
4. **Update documentation** kèm theo

### Khi thêm features mới:
1. **Follow architecture guidelines**
2. **Write tests first** (TDD approach)
3. **Review với team** trước khi merge
4. **Update này documentation** nếu cần

---

*Tài liệu này sẽ được cập nhật thường xuyên. Mọi thành viên trong team nên follow và contribute vào việc cải thiện standards này.* 