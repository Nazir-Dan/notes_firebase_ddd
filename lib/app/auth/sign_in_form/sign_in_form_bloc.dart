import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_firebase_ddd/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd/domain/auth/i_auth_facade.dart';
import 'package:notes_firebase_ddd/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

typedef ForwardedCall = Future<Either<AuthFailure, Unit>> Function({
  required EmailAddress emailAddress,
  required Password password,
});

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _iAuthFacade;

  @override
  SignInFormState get initialState => SignInFormState.initial();

  SignInFormBloc(this._iAuthFacade)
      : super(
          SignInFormState.initial(),
        ) {
    on<EmailChanged>((event, emit) async {
      emit(state.copyWith(
        emailAddress: EmailAddress(event.emailStr),
        authFailureOrSuccessOption: none(),
      ));
    });
    on<PasswordChanged>((event, emit) async {
      emit(state.copyWith(
        password: Password(event.passwordStr),
        authFailureOrSuccessOption: none(),
      ));
    });
    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      _performActionOnAuthFacadeWithEmailAndPassword(
          _iAuthFacade.registerWithEmailAndPassword);
    });
    on<SignInWithEmailAndPasswordPressed>((event, emit) async {
      _performActionOnAuthFacadeWithEmailAndPassword(
          _iAuthFacade.signInWithEmailAndPassword);
    });
    on<SignInWithGooglePressed>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      final successOrFailure = await _iAuthFacade.signInWithGoogleAccount();
      emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(successOrFailure),
      ));
    });
  }

  void _performActionOnAuthFacadeWithEmailAndPassword(
    ForwardedCall forwardedCall,
  ) async {
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    Either<AuthFailure, Unit>? successOrFailure;
    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      successOrFailure = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
      emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(successOrFailure),
      ));
    }
    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(successOrFailure),
    ));
  }
}
