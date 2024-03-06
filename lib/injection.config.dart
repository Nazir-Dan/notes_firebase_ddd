// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import 'app/auth/auth_bloc_bloc.dart' as _i15;
import 'app/auth/sign_in_form/sign_in_form_bloc.dart' as _i14;
import 'app/notes/note_form/note_form_bloc.dart' as _i12;
import 'app/notes/notes_actor/notes_actor_bloc.dart' as _i11;
import 'app/notes/notes_watcher/notes_watcher_bloc.dart' as _i13;
import 'domain/auth/i_auth_facade.dart' as _i7;
import 'domain/notes/i_note_repository.dart' as _i9;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i8;
import 'infrastructure/auth/firebase_user_mapper.dart' as _i5;
import 'infrastructure/core/firebase_injectable_module.dart' as _i16;
import 'infrastructure/notes/notes_repository.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.lazySingleton<_i3.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i4.FirebaseFirestore>(
        () => firebaseInjectableModule.firebaseFirestore);
    gh.lazySingleton<_i5.FirebaseUserMapper>(() => _i5.FirebaseUserMapper());
    gh.lazySingleton<_i6.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i7.IAuthFacade>(() => _i8.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i6.GoogleSignIn>(),
          gh<_i5.FirebaseUserMapper>(),
        ));
    gh.lazySingleton<_i9.INoteRepository>(
        () => _i10.NoteRepository(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i11.NoteActorBloc>(
        () => _i11.NoteActorBloc(gh<_i9.INoteRepository>()));
    gh.factory<_i12.NoteFormBloc>(
        () => _i12.NoteFormBloc(gh<_i9.INoteRepository>()));
    gh.factory<_i13.NoteWatcherBloc>(
        () => _i13.NoteWatcherBloc(gh<_i9.INoteRepository>()));
    gh.factory<_i14.SignInFormBloc>(
        () => _i14.SignInFormBloc(gh<_i7.IAuthFacade>()));
    gh.factory<_i15.AuthBloc>(() => _i15.AuthBloc(gh<_i7.IAuthFacade>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i16.FirebaseInjectableModule {}
