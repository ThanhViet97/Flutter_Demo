# BLoC Pattern Guide

## Overview
Dự án này đã được setup để sử dụng BLoC (Business Logic Component) pattern cho state management. BLoC pattern giúp tách biệt business logic khỏi UI và cung cấp một cách quản lý state có thể dự đoán được.

## Cấu trúc BLoC

```
lib/presentation/bloc/
├── base/
│   └── base_bloc.dart          # Base classes cho events và states
├── counter/                    # Example BLoC
│   ├── counter_bloc.dart
│   ├── counter_event.dart
│   └── counter_state.dart
├── extensions/
│   └── bloc_extensions.dart    # Helpful extensions
├── bloc_observer.dart          # Debug observer
└── bloc_exports.dart          # Export file
```

## Cách sử dụng

### 1. Tạo Events
```dart
abstract class MyEvent extends BaseEvent {
  const MyEvent();
}

class LoadData extends MyEvent {
  const LoadData();
}
```

### 2. Tạo States
```dart
abstract class MyState extends BaseState {
  const MyState();
}

class MyInitial extends MyState {
  const MyInitial();
}

class MyLoaded extends MyState {
  final List<Data> data;
  const MyLoaded({required this.data});
  
  @override
  List<Object?> get props => [data];
}
```

### 3. Tạo BLoC
```dart
class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(const MyInitial()) {
    on<LoadData>(_onLoadData);
  }
  
  void _onLoadData(LoadData event, Emitter<MyState> emit) async {
    emit(const LoadingState());
    try {
      final data = await repository.getData();
      emit(MyLoaded(data: data));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}
```

### 4. Sử dụng trong UI
```dart
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBloc, MyState>(
      builder: (context, state) {
        return switch (state) {
          MyInitial() => const Text('Initial'),
          LoadingState() => const CircularProgressIndicator(),
          MyLoaded(:final data) => ListView.builder(...),
          ErrorState(:final message) => Text('Error: $message'),
          _ => const Text('Unknown state'),
        };
      },
    );
  }
}
```

### 5. Thêm BLoC vào main.dart
```dart
MultiBlocProvider(
  providers: [
    BlocProvider(create: (context) => MyBloc()),
  ],
  child: MyApp(),
)
```

## Testing

Sử dụng `bloc_test` package để test BLoC:

```dart
blocTest<MyBloc, MyState>(
  'emits [LoadingState, MyLoaded] when LoadData is added',
  build: () => MyBloc(),
  act: (bloc) => bloc.add(const LoadData()),
  expect: () => [
    const LoadingState(),
    isA<MyLoaded>(),
  ],
);
```

## Example

Xem `CounterBloc` trong `lib/presentation/bloc/counter/` để có ví dụ hoàn chỉnh.

Để test Counter page:
1. Chạy app: `flutter run`
2. Navigate đến `/counter` route
3. Test các chức năng increment, decrement, reset

## Best Practices

1. **Sử dụng Equatable**: Tất cả states và events nên extend từ BaseState/BaseEvent
2. **Immutable States**: States nên là immutable
3. **Single Responsibility**: Mỗi BLoC chỉ quản lý một phần logic
4. **Testing**: Luôn viết tests cho BLoC
5. **Error Handling**: Sử dụng ErrorState cho error handling

## Migration từ Provider

Bạn có thể migrate từ Provider sang BLoC từ từ:
1. Giữ lại Provider cho các features hiện tại
2. Sử dụng BLoC cho features mới
3. Migrate từng feature một cách từ từ 