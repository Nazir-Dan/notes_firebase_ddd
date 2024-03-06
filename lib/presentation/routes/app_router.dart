import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd/domain/notes/note.dart';
import 'package:notes_firebase_ddd/presentation/notes/note_form/notes_form_page.dart';
import 'package:notes_firebase_ddd/presentation/notes/notes_overview/notes_overview_page.dart';
import 'package:notes_firebase_ddd/presentation/sign_in/sign_in_page.dart';
import 'package:notes_firebase_ddd/presentation/spalsh/splash_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
        AutoRoute(
          page: NotesOverviewRoute.page,
        ),
        AutoRoute(
          page: NoteFormRoute.page,
          fullscreenDialog: true,
        ),
      ];
}
