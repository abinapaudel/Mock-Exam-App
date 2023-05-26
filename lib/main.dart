import 'package:api_with_provider/firebase_options.dart';
import 'package:api_with_provider/providers/auth_provider.dart';
import 'package:api_with_provider/providers/login_provider.dart';
import 'package:api_with_provider/providers/quiz_provider.dart';
import 'package:api_with_provider/providers/utils_provider.dart';
import 'package:api_with_provider/screens/extras/on_boarding.dart';
import 'package:api_with_provider/screens/initial_screen.dart';
import 'package:api_with_provider/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'providers/category_provider.dart';
import 'providers/mock_exma_provider.dart';

int? initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExamProvider()),
        ChangeNotifierProvider(create: (context) => UtilsProvider()),
        ChangeNotifierProvider(create: (context)=> LoginProvider()),
        ChangeNotifierProvider(create: (context)=> QuizProvider()),
        ChangeNotifierProvider(
            create: (context) => AuthProvider(FirebaseAuth.instance)),
        Provider<AuthProvider>(
          create: (_) => AuthProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => AuthProvider(FirebaseAuth.instance).authState,
          initialData: null,
        ),
      ],
      child: KhaltiScope(
        publicKey: "test_public_key_f3fbbf17a2d34088ae4bee924a352964",
        builder: (context, navigatorKey) {
          return MaterialApp(
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.indigo,
            ),
            home: initScreen == 0 || initScreen == null
                ?  OnBoardingPage()
                : const AuthWrapper(),
          );
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}
