import 'package:checkout/bloc/auth_bloc/bloc.dart';
import 'package:checkout/bloc/auth_bloc/event.dart';
import 'package:checkout/bloc/signin_bloc/event.dart';
import 'package:checkout/bloc/signin_bloc/state.dart';
import 'package:checkout/exceptions/exceptions.dart';
import 'package:checkout/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationBloc authenticationBloc;
  SignInBloc(this.authenticationBloc) : super(SignInInitial()) {
    on<SignInButtonPressed>(_signinButtonPressed);
  }

  _signinButtonPressed(SignInButtonPressed event, Emitter emit) async {
    emit(SignInLoading());

    try {
      final response = await UserService()
          .login(email: event.email, password: event.password);
      print('----------------dsflkjesfol;isjeagpo-');
      print(response.token);

      authenticationBloc
          .add(LoggedInEvent(email: response.email, token: response.token));
    } on UnauthorizedException {
      emit(const SignInFailure("wrong email or password"));
    } catch (error) {
      print(error);
      emit(SignInFailure(error.toString()));
    }
  }
}
