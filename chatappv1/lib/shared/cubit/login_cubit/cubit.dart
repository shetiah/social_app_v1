import 'package:chatappv1/layout/home_layout.dart';
import 'package:chatappv1/shared/components/components/my_main_components.dart';
import 'package:chatappv1/shared/cubit/login_cubit/states.dart';
import 'package:chatappv1/shared/network/local/cacheHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/constants/const.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super((InitState()));

  static LoginCubit get(context) => BlocProvider.of(context);
  var formLoginKey = GlobalKey<FormState>();
  var emailLoginController = TextEditingController();
  var passwordLoginController = TextEditingController();

  Future<void> userLogin({
    required String email,
    required String password,
    required  context,
  }) async {
    emit(LoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((v) {
          uId=v.user?.uid;
          CacheHelper.saveData(key: 'uId', value: v.user?.uid);
          navigateAndFinish(context, const HomeScreen());
      emit(LoginFinishedState());
    }).catchError((onError) {
      emit(LoginErrorState(onError.toString()));
    });

  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibility());
  }
}
