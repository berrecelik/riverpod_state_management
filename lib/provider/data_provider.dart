import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/provider/provider.dart';

final userDataProvider = FutureProvider((ref) async {
  return ref.watch(userProvider).getUsers();
});
