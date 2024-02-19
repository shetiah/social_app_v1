import 'package:chatappv1/layout/home_layout.dart';
import 'package:chatappv1/modules/login_screen.dart';
import 'package:chatappv1/modules/register/register_screen.dart';
import 'package:chatappv1/modules/register/register_uName_image_screen.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:chatappv1/shared/cubit/app_cubit/cubit.dart';
import 'package:chatappv1/shared/cubit/app_cubit/states.dart';
import 'package:chatappv1/shared/cubit/blocobserver.dart';
import 'package:chatappv1/shared/cubit/login_cubit/cubit.dart';
import 'package:chatappv1/shared/network/local/cacheHelper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  startScreen = (uId == '') ?const LoginScreen() : const HomeScreen();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (context) => AppCubit()..getUserData(),
          child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return startScreen!;
              // return  RegisterNmImgScreen();
            },

          )),
      // home: const HomeScreen(),
    );
  }
}
