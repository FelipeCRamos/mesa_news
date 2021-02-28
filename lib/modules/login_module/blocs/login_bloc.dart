import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mesa_news/modules/login_module/blocs/login_bloc_events.dart';
import 'package:mesa_news/modules/login_module/blocs/login_bloc_states.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBloc() : super(LoginBlocStateInitial());

  @override
  void onEvent(LoginBlocEvent event) {
    print('[LoginBloc] event: $event');
    super.onEvent(event);
  }

  @override
  Stream<LoginBlocState> mapEventToState(LoginBlocEvent event) async* {
    switch (event.runtimeType) {
      case LoginBlocEventSignUp:
      case LoginBlocEventLoginWithCredentials:
        yield LoginBlocStateSuccess();
    }
    yield LoginBlocStateInitial();
  }
}
