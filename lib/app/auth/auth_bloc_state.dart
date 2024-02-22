part of 'auth_bloc_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initialState() = InitialState;
  const factory AuthState.authenticated(User user) = Authenticated;
  const factory AuthState.unAuthenticated() = UnAuthenticated;
}
