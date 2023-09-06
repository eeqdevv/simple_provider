import 'package:flutter/foundation.dart';

@immutable
final class ProviderState {
  const ProviderState(
      {required this.loading,
      required this.success,
      required this.error,
      required this.init,
      required this.message});
  final bool success;
  final bool error;
  final Object message;
  final bool init;
  final bool loading;

  factory ProviderState.loading() => const ProviderState(
      error: false,
      init: false,
      loading: true,
      message: 'loding',
      success: false);
  factory ProviderState.error(Object e) {
    String? error;

    ///do some condition ...//TODO
    error = e.toString();
    return ProviderState(
        error: true,
        init: false,
        loading: false,
        message: error,
        success: false);
  }
  factory ProviderState.success() => const ProviderState(
        error: false,
        init: false,
        loading: false,
        message: 'success',
        success: true,
      );
  factory ProviderState.init() => const ProviderState(
      error: false,
      init: true,
      loading: false,
      message: 'init',
      success: false);
}
