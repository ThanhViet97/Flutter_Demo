import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:my_app/core/errors/failures.dart';
import 'package:my_app/domain/entities/post_entity.dart';
import 'package:my_app/domain/usecases/get_post_by_id_usecase.dart';
import 'package:my_app/presentation/pages/posts/bloc/post_detail_bloc.dart';
import 'package:my_app/presentation/pages/posts/bloc/post_detail_event.dart';
import 'package:my_app/presentation/pages/posts/bloc/post_detail_state.dart';

import 'post_detail_bloc_test.mocks.dart';

@GenerateMocks([GetPostByIdUseCase])
void main() {
  late PostDetailBloc postDetailBloc;
  late MockGetPostByIdUseCase mockGetPostByIdUseCase;

  setUp(() {
    mockGetPostByIdUseCase = MockGetPostByIdUseCase();
    postDetailBloc = PostDetailBloc(
      getPostByIdUseCase: mockGetPostByIdUseCase,
    );
  });

  tearDown(() {
    postDetailBloc.close();
  });

  group('PostDetailBloc', () {
    const tPostId = 1;
    const tPost = PostEntity(
      id: 1,
      userId: 1,
      title: 'Test Title',
      body: 'Test Body',
    );

    test('initial state should be PostDetailInitial', () {
      expect(postDetailBloc.state, equals(const PostDetailInitial()));
    });

    group('LoadPostDetail', () {
      blocTest<PostDetailBloc, PostDetailState>(
        'emits [PostDetailLoading, PostDetailLoaded] when post is loaded successfully',
        build: () {
          when(mockGetPostByIdUseCase(any))
              .thenAnswer((_) async => const Right(tPost));
          return postDetailBloc;
        },
        act: (bloc) => bloc.add(const LoadPostDetail(postId: tPostId)),
        expect: () => [
          const PostDetailLoading(),
          const PostDetailLoaded(post: tPost),
        ],
      );

      blocTest<PostDetailBloc, PostDetailState>(
        'emits [PostDetailLoading, PostDetailError] when loading post fails',
        build: () {
          when(mockGetPostByIdUseCase(any))
              .thenAnswer((_) async => const Left(ServerFailure('Server Error')));
          return postDetailBloc;
        },
        act: (bloc) => bloc.add(const LoadPostDetail(postId: tPostId)),
        expect: () => [
          const PostDetailLoading(),
          const PostDetailError(message: 'Server Error'),
        ],
      );
    });

    group('RefreshPostDetail', () {
      blocTest<PostDetailBloc, PostDetailState>(
        'emits [PostDetailLoaded] when post is refreshed successfully (no loading state)',
        build: () {
          when(mockGetPostByIdUseCase(any))
              .thenAnswer((_) async => const Right(tPost));
          return postDetailBloc;
        },
        act: (bloc) => bloc.add(const RefreshPostDetail(postId: tPostId)),
        expect: () => [
          const PostDetailLoaded(post: tPost),
        ],
      );

      blocTest<PostDetailBloc, PostDetailState>(
        'emits [PostDetailError] when refreshing post fails',
        build: () {
          when(mockGetPostByIdUseCase(any))
              .thenAnswer((_) async => const Left(NetworkFailure('Network Error')));
          return postDetailBloc;
        },
        act: (bloc) => bloc.add(const RefreshPostDetail(postId: tPostId)),
        expect: () => [
          const PostDetailError(message: 'Network Error'),
        ],
      );
    });

    test('should call GetPostByIdUseCase with correct params', () async {
      // arrange
      when(mockGetPostByIdUseCase(any))
          .thenAnswer((_) async => const Right(tPost));

      // act
      postDetailBloc.add(const LoadPostDetail(postId: tPostId));
      
      // wait for event to be processed
      await postDetailBloc.stream.first;

      // assert
      final captured = verify(mockGetPostByIdUseCase(captureAny)).captured;
      expect(captured.single, isA<GetPostParams>());
      expect((captured.single as GetPostParams).id, equals(tPostId));
    });
  });
} 