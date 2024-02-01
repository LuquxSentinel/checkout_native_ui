import 'package:checkout/bloc/auth_bloc/event.dart';
import 'package:checkout/bloc/auth_bloc/state.dart';
import 'package:checkout/repository/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc extends Bloc<AuthenticatonEvent, AuthenticationState> {
  final SecureStorage secureStorage;
  AuthenticationBloc(this.secureStorage)
      : super(AuthenticationUninitialized()) {
    on<AppStartedEvent>(_appStarted);
    on<LoggedInEvent>(_loggedIn);
    on<LoggedOutEvent>(_loggedOut);
  }

  _appStarted(AppStartedEvent event, Emitter emit) async {
    await _cleanIfFirstUseAfterUninstall();
    AuthenticationState initState = await __initStartup(emit);
    emit(initState);
  }

  _loggedIn(LoggedInEvent event, Emitter emit) async {
    emit(AuthenticationLoading());
    await secureStorage.persistEmailAndToken(event.email, event.token);
    AuthenticationState initState = await __initStartup(emit);
    emit(initState);
  }

  _loggedOut(LoggedOutEvent event, Emitter emit) async {
    emit(AuthenticationLoading());
    await secureStorage.deleteToken();
  }

  __initStartup(Emitter emit) async {
    final hasToken = await secureStorage.hasToken();

    if (!hasToken) {
      return AuthenticationUnauthenticated();
    }

    return AuthenticationAuthenticated();
  }

  _cleanIfFirstUseAfterUninstall() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('first_run') ?? true) {
      await secureStorage.deleteAll();
      await prefs.setBool('first_run', false);
    }
  }
}
