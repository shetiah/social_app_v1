import 'package:chatappv1/layout/home_layout.dart';
import 'package:chatappv1/models/user_model.dart';
import 'package:chatappv1/shared/components/components/my_main_components.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:chatappv1/shared/cubit/register_cubit/states.dart';
import 'package:chatappv1/shared/network/local/cacheHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super((InitState()));

  static RegisterCubit get(context) => BlocProvider.of(context);

  var formRegisterKey = GlobalKey<FormState>();
  var nameRegisterController = TextEditingController();
  var emailRegisterController = TextEditingController();
  var passwordRegisterController = TextEditingController();
  var phoneRegisterController = TextEditingController();

  Future<void> userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
    required BuildContext context,
  }) async {
    emit(RegisterLoadingState());

    try {
     await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((v) {
        userCreate(
          uId: v.user!.uid,
          phone: phone,
          email: email,
          name: name,
        ).then((user) {
          CacheHelper.saveData(key: 'uId', value: v.user?.uid);
          uId=v.user!.uid;
          userModel=user;
          navigateAndFinish(context,const HomeScreen());
          emit(RegisterFinishedState());
        });
      });
    } catch (nError) {
      emit(RegisterErrorState(nError.toString()));
    }
  }

  Future<UserModel> userCreate({
    required String uId,
    required String email,
    required String phone,
    required String name,
  }) async {
    emit(UserCreationLoadingState());
    UserModel model = UserModel(name, phone, email, uId);
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(model.toMap());
      emit(UserCreationFinishedState());
    } catch (error) {
      emit(UserCreationErrorState(error.toString()));
    }
    return model;
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
