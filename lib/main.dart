import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'login/cubit/LoginCubit/LoginCubit.dart';
import 'login/cubit/SignUpCubit/sign_up_cubit.dart';
import 'login/screens/pages/login.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hulu',
        home: Login(),
        // home: FirebaseAuth.instance.currentUser?.uid != null
        //     ? const MyHomePage()
        //     : Login(),
      ),
    );
  }
}
