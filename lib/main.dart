import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_store/cubit/cart.dart';
import 'package:library_store/cubit/nav_bar.dart';
import 'package:library_store/cubit/note_book.dart';
import 'package:library_store/firebase_options.dart';
import 'package:library_store/repository/note_book.dart';
import 'package:library_store/view/admin/log_in.dart';
import 'package:library_store/view/categorys/note_book.dart';
import 'package:library_store/view/categorys/widgets/add_note_book.dart';
import 'package:library_store/view/onPording/splash.dart';
import 'view/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider(
          create: (context) => NoteBookCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "splash",
        routes: {
          "home": (context) => Home(),
          "splash": (context) => const Splash(),
          "login": (context) => LogIn()
        },
      ),
    );
  }
}
