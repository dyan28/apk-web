import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apkfree/common/core/session/session_state.dart';
import 'package:apkfree/common/data/local_secure_storage.dart';
import 'package:apkfree/common/data/local_storage.dart';
import 'package:apkfree/models/app_user.dart';

final sessionProvider =
    StateNotifierProvider<SessionStateNotifier, SessionState>((_) {
  return SessionStateNotifier();
});

class SessionStateNotifier extends StateNotifier<SessionState> {
  SessionStateNotifier() : super(SessionState());

  Future<void> saveSession({
    required String token,
    AppUser? appUser,
  }) async {
    await SecureStorage.saveToken(token);
    await LocalStorage.saveAppUser(appUser);
  }
}
