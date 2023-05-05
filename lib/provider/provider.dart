import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/notifier/notifier.dart';
import 'package:riverpod_state_management/notifier/welcome_notifier.dart';
import 'package:riverpod_state_management/notifier/welcome_state.dart';
import 'package:riverpod_state_management/services/services.dart';

final counterStateProvider = StateProvider((ref) {
  return 0;
});

final userProvider = Provider<ApiServices>((ref) => ApiServices());
final isRedProvider = Provider<bool>((ref) {
  final color = ref.watch(selectedButtonProvider);
  return color == 'red'; //check
});
final selectedButtonProvider = StateProvider<String>((ref) => '');

final numbersProvider =
    StateNotifierProvider<NumberNotifier, List<String>>((ref) {
  return NumberNotifier();
});

final welcomeProvider =
    StateNotifierProvider<WelcomeNotifier, WelcomeState>((ref) {
  return WelcomeNotifier();
});
