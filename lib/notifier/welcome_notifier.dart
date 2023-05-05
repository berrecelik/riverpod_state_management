import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/notifier/welcome_state.dart';

class WelcomeNotifier extends StateNotifier<WelcomeState> {
  WelcomeNotifier() : super(const WelcomeState());

  void pageChanged(int page) {
    state = state.copyWith(page: page);
  }
}
