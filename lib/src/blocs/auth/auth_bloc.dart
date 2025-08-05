import '../base/base_bloc.dart';

/// Authentication events
abstract class AuthEvent extends BaseEvent {
  const AuthEvent();
}

class LoginRequested extends AuthEvent {
  const LoginRequested({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

class CheckAuthStatus extends AuthEvent {
  const CheckAuthStatus();
}

/// Authentication states
abstract class AuthState extends BaseState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState with LoadingState {
  const AuthLoading();

  @override
  bool get isLoading => true;
}

class AuthAuthenticated extends AuthState with SuccessState {
  const AuthAuthenticated({
    required this.user,
  });

  final User user;

  @override
  bool get isSuccess => true;
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthError extends AuthState with ErrorState {
  const AuthError({
    required this.message,
  });

  final String message;

  @override
  String? get errorMessage => message;
}

/// User model
class User {
  const User({
    required this.id,
    required this.email,
    required this.name,
  });

  final String id;
  final String email;
  final String name;

  User copyWith({
    String? id,
    String? email,
    String? name,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.email == email &&
        other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ name.hashCode;

  @override
  String toString() => 'User(id: $id, email: $email, name: $name)';
}

/// Authentication BLoC
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc() : super() {
    emit(const AuthInitial());
  }

  User? _currentUser;

  User? get currentUser => _currentUser;

  @override
  Future<void> onEvent(AuthEvent event) async {
    if (event is LoginRequested) {
      await _handleLogin(event);
    } else if (event is LogoutRequested) {
      await _handleLogout();
    } else if (event is CheckAuthStatus) {
      await _handleCheckAuthStatus();
    }
  }

  Future<void> _handleLogin(LoginRequested event) async {
    emit(const AuthLoading());

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Mock validation
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(const AuthError(message: 'Email and password are required'));
        return;
      }

      if (event.password.length < 6) {
        emit(const AuthError(message: 'Password must be at least 6 characters'));
        return;
      }

      // Mock successful login
      _currentUser = User(
        id: '1',
        email: event.email,
        name: 'John Doe',
      );

      emit(AuthAuthenticated(user: _currentUser!));
    } catch (error) {
      emit(AuthError(message: error.toString()));
    }
  }

  Future<void> _handleLogout() async {
    emit(const AuthLoading());

    try {
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));

      _currentUser = null;
      emit(const AuthUnauthenticated());
    } catch (error) {
      emit(AuthError(message: error.toString()));
    }
  }

  Future<void> _handleCheckAuthStatus() async {
    emit(const AuthLoading());

    try {
      // Simulate checking auth status
      await Future.delayed(const Duration(milliseconds: 500));

      if (_currentUser != null) {
        emit(AuthAuthenticated(user: _currentUser!));
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (error) {
      emit(AuthError(message: error.toString()));
    }
  }
} 