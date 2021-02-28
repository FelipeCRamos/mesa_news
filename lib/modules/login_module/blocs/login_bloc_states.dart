abstract class LoginBlocState {
  const LoginBlocState();
}

class LoginBlocStateInitial extends LoginBlocState {}

class LoginBlocStateLoading extends LoginBlocState {}

class LoginBlocStateError extends LoginBlocState {}

class LoginBlocStateSuccess extends LoginBlocState {}

