import 'package:flutter/foundation.dart';
import 'package:simple_provider/src/data.dart';

abstract class ProivderBase with ChangeNotifier {
  ProivderBase({this.errorCallback}) : providerStates = ProviderState.init();
  late ProviderState providerStates;

  final ValueChanged<Object?>? errorCallback;

  void setState(ProviderState s) {
    providerStates = s;
    if (s.error) {
      onError(s.message, StackTrace.current);
    } else {
      notifyListeners();
    }
  }

  void onError(Object? e, StackTrace stackTrace) {
    final errorMessage = e?.toString() ?? 'An error occurred';
    providerStates = ProviderState.error(errorMessage);
    notifyListeners();
    errorCallback?.call(e);
  }
}
