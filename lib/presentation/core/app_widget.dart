import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd/presentation/sign_in/sign_in_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green[800],
          secondary: Colors.blueAccent,
        ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              //brightness: Brightness.dark,
              color: Colors.green[800],
              iconTheme: ThemeData.dark().iconTheme,
            ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade700),
          ),
        ),
      ),
      //onGenerateRoute: Router.onGenerateRoute,
      //initialRoute: Router.splashPage,
      //navigatorKey: Router.navigator.key,
      home: const SignInPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
