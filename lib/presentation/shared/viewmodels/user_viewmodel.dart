import 'package:flutter/material.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/get_users_usecase.dart';
import '../../../domain/usecases/get_user_by_id_usecase.dart';

enum ViewState { idle, loading, success, error }

class UserViewModel extends ChangeNotifier {
  final GetUsersUseCase getUsersUseCase;
  final GetUserByIdUseCase getUserByIdUseCase;

  UserViewModel({
    required this.getUsersUseCase,
    required this.getUserByIdUseCase,
  });

  // State variables
  ViewState _state = ViewState.idle;
  List<UserEntity> _users = [];
  UserEntity? _selectedUser;
  String? _errorMessage;

  // Getters
  ViewState get state => _state;
  List<UserEntity> get users => _users;
  UserEntity? get selectedUser => _selectedUser;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _state == ViewState.loading;
  bool get hasError => _state == ViewState.error;

  // Methods
  Future<void> loadUsers() async {
    _setState(ViewState.loading);
    _errorMessage = null;

    final result = await getUsersUseCase(const NoParams());

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _setState(ViewState.error);
      },
      (users) {
        _users = users;
        _setState(ViewState.success);
      },
    );
  }

  Future<void> loadUserById(int id) async {
    _setState(ViewState.loading);
    _errorMessage = null;

    final result = await getUserByIdUseCase(GetUserParams(id));

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _setState(ViewState.error);
      },
      (user) {
        _selectedUser = user;
        _setState(ViewState.success);
      },
    );
  }

  void clearSelectedUser() {
    _selectedUser = null;
    notifyListeners();
  }

  void _setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
} 