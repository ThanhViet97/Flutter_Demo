import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/domain/entities/post_entity.dart';
import 'package:my_app/domain/usecases/create_post_usecase.dart';
import 'package:my_app/presentation/pages/posts/bloc/create_post_bloc.dart';
import 'package:my_app/presentation/pages/posts/bloc/create_post_event.dart';
import 'package:my_app/presentation/pages/posts/bloc/create_post_state.dart';
import 'package:my_app/core/errors/failures.dart';

class MockCreatePostUseCase extends Mock implements CreatePostUseCase {}

void main() {
  late CreatePostBloc createPostBloc;
  late MockCreatePostUseCase mockCreatePostUseCase;

  setUp(() {
    mockCreatePostUseCase = MockCreatePostUseCase();
    createPostBloc = CreatePostBloc(createPostUseCase: mockCreatePostUseCase);
    
    // Register fallback values for mocktail
    registerFallbackValue(const CreatePostParams(
      title: '',
      body: '',
      userId: 1,
    ));
  });

  tearDown(() {
    createPostBloc.close();
  });

  const testPost = PostEntity(
    id: 101,
    userId: 1,
    title: 'Test Title',
    body: 'Test Body',
  );

  const testCreatePostParams = CreatePostParams(
    title: 'Test Title',
    body: 'Test Body',
    userId: 1,
  );

  group('CreatePostBloc', () {
    test('initial state should be CreatePostInitial', () {
      expect(createPostBloc.state, equals(const CreatePostInitial()));
    });

    blocTest<CreatePostBloc, CreatePostState>(
      'should emit [CreatePostLoading, CreatePostSuccess] when CreatePost is successful',
      build: () {
        when(() => mockCreatePostUseCase(any()))
            .thenAnswer((_) async => const Right(testPost));
        return createPostBloc;
      },
      act: (bloc) => bloc.add(const CreatePost(
        title: 'Test Title',
        body: 'Test Body',
        userId: 1,
      )),
      expect: () => [
        const CreatePostLoading(),
        const CreatePostSuccess(post: testPost),
      ],
      verify: (_) {
        verify(() => mockCreatePostUseCase(any())).called(1);
      },
    );

    blocTest<CreatePostBloc, CreatePostState>(
      'should emit [CreatePostLoading, CreatePostError] when CreatePost fails',
      build: () {
        when(() => mockCreatePostUseCase(any()))
            .thenAnswer((_) async => const Left(ServerFailure('Server error')));
        return createPostBloc;
      },
      act: (bloc) => bloc.add(const CreatePost(
        title: 'Test Title',
        body: 'Test Body',
        userId: 1,
      )),
      expect: () => [
        const CreatePostLoading(),
        const CreatePostError(message: 'Server error'),
      ],
      verify: (_) {
        verify(() => mockCreatePostUseCase(any())).called(1);
      },
    );

    blocTest<CreatePostBloc, CreatePostState>(
      'should emit CreatePostInitial when ResetCreatePost is added',
      build: () => createPostBloc,
      seed: () => const CreatePostError(message: 'Some error'),
      act: (bloc) => bloc.add(const ResetCreatePost()),
      expect: () => [
        const CreatePostInitial(),
      ],
    );

    blocTest<CreatePostBloc, CreatePostState>(
      'should emit CreatePostInitial when ResetCreatePost is added from success state',
      build: () => createPostBloc,
      seed: () => const CreatePostSuccess(post: testPost),
      act: (bloc) => bloc.add(const ResetCreatePost()),
      expect: () => [
        const CreatePostInitial(),
      ],
    );
  });

  group('CreatePostEvent', () {
    test('CreatePost should have correct props', () {
      const event = CreatePost(
        title: 'Test Title',
        body: 'Test Body',
        userId: 1,
      );

      expect(event.props, equals(['Test Title', 'Test Body', 1]));
    });

    test('ResetCreatePost should have empty props', () {
      const event = ResetCreatePost();
      expect(event.props, equals([]));
    });
  });

  group('CreatePostState', () {
    test('CreatePostSuccess should have correct props', () {
      const state = CreatePostSuccess(post: testPost);
      expect(state.props, equals([testPost]));
    });

    test('CreatePostError should have correct props', () {
      const state = CreatePostError(message: 'Error message');
      expect(state.props, equals(['Error message']));
    });

    test('CreatePostInitial should have empty props', () {
      const state = CreatePostInitial();
      expect(state.props, equals([]));
    });

    test('CreatePostLoading should have empty props', () {
      const state = CreatePostLoading();
      expect(state.props, equals([]));
    });
  });
} 