class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String? role;

  AuthSuccessState({this.role});
}

class AuthFailureState extends AuthState {
  final String error;

  AuthFailureState(this.error);
}