import 'dart:async';
import 'package:flutter/foundation.dart';

/// Base BLoC class for the app_mayoreo package
abstract class BaseBloc<Event, State> {
  BaseBloc() {
    _eventController.stream.listen(_handleEvent);
  }

  final StreamController<Event> _eventController = StreamController<Event>.broadcast();
  final StreamController<State> _stateController = StreamController<State>.broadcast();

  State? _currentState;
  bool _isDisposed = false;

  /// Current state getter
  State? get currentState => _currentState;

  /// Event stream
  Stream<Event> get eventStream => _eventController.stream;

  /// State stream
  Stream<State> get stateStream => _stateController.stream;

  /// Add event to the BLoC
  void add(Event event) {
    if (!_isDisposed) {
      _eventController.add(event);
    }
  }

  /// Emit new state
  void emit(State state) {
    if (!_isDisposed) {
      _currentState = state;
      _stateController.add(state);
    }
  }

  /// Handle incoming events
  Future<void> _handleEvent(Event event) async {
    try {
      await onEvent(event);
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print('Error in BLoC: $error');
        print('Stack trace: $stackTrace');
      }
      onError(error, stackTrace);
    }
  }

  /// Override this method to handle events
  Future<void> onEvent(Event event);

  /// Override this method to handle errors
  void onError(Object error, StackTrace stackTrace) {
    // Default error handling - can be overridden
  }

  /// Dispose the BLoC
  Future<void> dispose() async {
    _isDisposed = true;
    await _eventController.close();
    await _stateController.close();
  }
}

/// Base event class
abstract class BaseEvent {
  const BaseEvent();
}

/// Base state class
abstract class BaseState {
  const BaseState();
}

/// Loading state mixin
mixin LoadingState on BaseState {
  bool get isLoading;
}

/// Error state mixin
mixin ErrorState on BaseState {
  String? get errorMessage;
}

/// Success state mixin
mixin SuccessState on BaseState {
  bool get isSuccess;
} 